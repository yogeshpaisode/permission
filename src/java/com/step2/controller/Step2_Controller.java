/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.step2.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Yogesh
 */
public class Step2_Controller extends org.apache.struts.action.Action {

    /*
     * forward name="success" path=""
     */
    String SUCCESS = "step2";
    SessionFactory sessionFactory = com.Hibernate.HibernateUtil.getSessionFactory();
    String document = "";
    String profileId = "";
    String nature = "";
    String address = "";
    String pincode = "";
    String peopleNumber = "";
    String permisionId = "";
    String processionFrom = "";
    String processionTo = "";
    //Get the servers upload directory real path name
    String filePath = "";
    FormFile file = null;
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
        try {


            filePath = getServlet().getServletContext().getRealPath("/") + "upload";
            //create the upload folder if not exists       
            File folder = new File(filePath);
            if (!folder.exists()) {
                folder.mkdir();
            }

            com.step2.model.Step2_Model model = (com.step2.model.Step2_Model) form;
            document = "";
            profileId = model.getProfileId();
            nature = model.getEventType();
            address = model.getAdddress();
            pincode = model.getPincode();
            peopleNumber = model.getPeoplenumber();
            processionFrom = model.getProcessionFrom();
            processionTo = model.getProcessionTo();
            file = model.getDocument();
            permisionId = model.getPermisionId();


            if (permisionId.equals("") || permisionId.equals("NO")) {
                if (!insert()) {
                    SUCCESS = "error";
                    request.setAttribute("errorMsg", errorMsg);
                }
            } else {
                if (!update()) {
                    SUCCESS = "error";
                    request.setAttribute("errorMsg", errorMsg);
                }
            }

        } catch (Exception e) {
            errorMsg = "Global Error : " + e.getMessage();
            request.setAttribute("errorMsg", errorMsg);

        }
        return mapping.findForward(SUCCESS);
    }

    boolean insert() {

        try {
            Session session = sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();
            //Get the servers upload directory real path name
            permisionId = RandomStringUtils.random(9, 0, 9, true, true, "by81G5RDED3DC6142kasok".toCharArray()).toUpperCase();
            String fileName = profileId + ".png";
            if (!("").equals(fileName)) {
                File newFile = new File(filePath, fileName);
                if (!newFile.exists()) {
                    FileOutputStream fos = new FileOutputStream(newFile);
                    fos.write(file.getFileData());
                    fos.flush();
                    fos.close();
                }
                document = "" + newFile.getName();
            }
            Permisiondetail permisiondetail = new Permisiondetail(profileId, nature, address, pincode, Integer.parseInt(peopleNumber), document, processionFrom, processionTo, permisionId);
            session.save(permisiondetail);
            transaction.commit();
            session.close();

            return true;
        } catch (Exception e) {
            errorMsg = "Error From Insert : " + e.getMessage();
            return false;
        }
    }

    boolean update() {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            Criteria cr = session.createCriteria(Permisiondetail.class);
            cr.add(Restrictions.eq("profileId", profileId));
            cr.add(Restrictions.eq("permisionId", permisionId));
            List results = cr.list();
            for (Object o : results) {
                Permisiondetail p = (Permisiondetail) o;
                p.setNature(nature);
                p.setAddress(address);
                p.setPincode(pincode);
                p.setPeopleNumber(Integer.parseInt(peopleNumber));
                p.setProcessionFrom(processionFrom);
                p.setProcessionTo(processionTo);
                session.save(p);
            }

            if (file.getFileName().length() > 1) {
                String fileName = profileId + ".png";
                File newFile = new File(filePath + "/" + fileName);
                newFile.delete();
                if (!("").equals(fileName)) {
                    newFile = new File(filePath, fileName);
                    if (!newFile.exists()) {
                        FileOutputStream fos = new FileOutputStream(newFile);
                        fos.write(file.getFileData());
                        fos.flush();
                        fos.close();
                    }
                    document = "" + newFile.getName();
                }

            }
            transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            errorMsg = "Error From Update : " + e.getMessage();
            session.close();
            return false;
        }


    }
}
