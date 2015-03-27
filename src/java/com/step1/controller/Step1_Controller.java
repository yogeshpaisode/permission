/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.step1.controller;

import com.paymentStatus.Paymentstatus;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Yogesh
 */
public class Step1_Controller extends org.apache.struts.action.Action {

    /*
     * forward name="success" path=""
     */
    String SUCCESS = "step1";
    String name = "";
    String address = "";
    String emailId = "";
    String contact = "";
    String profileId = "";
    String errorMsg = "";
    SessionFactory sessionFactory = com.Hibernate.HibernateUtil.getSessionFactory();

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        com.step1.model.step1_Model model = (com.step1.model.step1_Model) form;
        name = model.getName();
        String temp[] = name.split(" ");
        name = "";
        for (String s : temp) {
            name = name + s.toUpperCase() + " ";
        }
        address = model.getAddress();
        emailId = model.getEmail();
        contact = model.getContact();
        profileId = model.getProfileId();


        if (profileId.equals("") || profileId.equals("NO")) {
            if (insert()) {
                new com.mail.sendStep1Completion_Email(emailId, name, profileId);
                request.setAttribute("profileId", profileId);
            } else {
                SUCCESS = "error";
                request.setAttribute("errorMsg", errorMsg);
            }
        } else {
            if (update()) {
                request.setAttribute("profileId", profileId);
            } else {
                SUCCESS = "error";
                request.setAttribute("errorMsg", errorMsg);
            }

        }
        return mapping.findForward(SUCCESS);
    }

    boolean insert() {
        try {
            Session session = sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();
            profileId = RandomStringUtils.random(9, 0, 9, true, true, "by81G5RDED3DC6142kasok".toCharArray()).toUpperCase();
            Personaldetail personaldetail = new Personaldetail(name, address, emailId, contact, profileId);
            com.paymentStatus.Paymentstatus paymentstatus = new Paymentstatus(profileId, false, new Date());
            session.save(personaldetail);
            session.save(paymentstatus);
            transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            errorMsg = "Error From Insert : " + e.getMessage();
            return false;
        }
    }

    boolean update() {
        try {
            Session session = sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();
            Criteria cr = session.createCriteria(com.step1.controller.Personaldetail.class);
            cr.add(Restrictions.eq("profileId", profileId));
            List results = cr.list();
            for (Object o : results) {
                com.step1.controller.Personaldetail p = (com.step1.controller.Personaldetail) o;
                p.setName(name);
                p.setAddress(address);
                p.setEmailId(emailId);
                p.setContact(contact);
                session.save(p);
            }
            transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            errorMsg = "Error From Update : " + e.getMessage();
            return false;
        }
    }
}
