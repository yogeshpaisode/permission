/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.step3.controller;

import com.step2.controller.Permisiondetail;
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
public class Step3_Controller extends org.apache.struts.action.Action {

    /*
     * forward name="success" path=""
     */
    String SUCCESS = "step3";
    SessionFactory sessionFactory = com.Hibernate.HibernateUtil.getSessionFactory();
    String profileId = "";
    String dateData = "";
    String startTimeData = "";
    String endTimeData = "";
    String dateTimeId = "";
    String errorMsg = "";

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

        com.step3.model.Step3_Model model = (com.step3.model.Step3_Model) form;
        profileId = model.getProfileId();
        dateData = model.getDate();
        startTimeData = model.getStartTime();
        endTimeData = model.getEndTime();
        dateTimeId = model.getDateTimeId();


        if (dateTimeId.equals("") || dateTimeId.equals("NO")) {
            if (!insert()) {
                SUCCESS = "error";
            }
        } else {
            if (!update()) {
                SUCCESS = "error";
            }
        }
        return mapping.findForward(SUCCESS);
    }

    boolean insert() {
        try {
            Session session = sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();
            dateTimeId = RandomStringUtils.random(9, 0, 9, true, true, "by81G5RDED3DC6142kasok".toCharArray()).toUpperCase();
            Datetime datetime = new Datetime(profileId, dateData, startTimeData, endTimeData, dateTimeId);
            session.save(datetime);
            transaction.commit();
            session.close();

            return true;
        } catch (Exception e) {
            errorMsg = e.getMessage();
            return false;
        }
    }

    boolean update() {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            Criteria cr = session.createCriteria(Datetime.class);
            cr.add(Restrictions.eq("profileId", profileId));
            cr.add(Restrictions.eq("dateTimeId", dateTimeId));
            List results = cr.list();
            for (Object o : results) {
                Datetime d = (Datetime) o;
                d.setDateData(dateData);
                d.setStartTimeData(startTimeData);
                d.setEndTimeData(endTimeData);
                session.save(d);
            }
            transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            errorMsg = e.getMessage();
            return false;
        }
    }
}
