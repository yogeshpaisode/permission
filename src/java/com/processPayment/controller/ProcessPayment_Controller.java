/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.processPayment.controller;

import com.report.Bean;
import java.io.File;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
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
public class ProcessPayment_Controller extends org.apache.struts.action.Action {

    /*
     * forward name="success" path=""
     */
    private static final String SUCCESS = "step4";

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

        com.processPayment.model.ProcessPayment_Model model = (com.processPayment.model.ProcessPayment_Model) form;
        String name = model.getName();
        String id = model.getProfileId();
        String email = model.getEmail();
        String fullPath = "";
        id = id.trim();

        SessionFactory sessionFactory = com.Hibernate.HibernateUtil.getSessionFactory();
        Session s = sessionFactory.openSession();
        Transaction transaction = s.beginTransaction();
        Criteria cr = s.createCriteria(com.paymentStatus.Paymentstatus.class);
        cr.add(Restrictions.eq("profileId", id));
        List results = cr.list();
        for (Object o : results) {
            com.paymentStatus.Paymentstatus p = (com.paymentStatus.Paymentstatus) o;
            p.setPaymentStatus(true);
            p.setDateData(new Date());
            s.save(p);
        }
        transaction.commit();
        s.close();
        //-----------Create e-permission-------------------------------------------------------------
        String filePath = getServlet().getServletContext().getRealPath("/") + "document";
        File folder = new File(filePath);
        if (!folder.exists()) {
            folder.mkdir();
        }
        com.report.ReportName reportName= new com.report.ReportName();
        String sourceFileName = reportName.getReportName();
        String printFileName = null;
        
        ArrayList<Bean> dataList = new ArrayList<Bean>();
        Bean bean=new Bean();
        name=name.trim();
        
        bean.setName("Applicant Name : "+name);
        bean.setProfileId("Permision Id : "+id);
        bean.setEmblem(reportName.getEmblemName());
        bean.setLogo(reportName.getLogoName());
        bean.setSign(reportName.getSignName());
        //System.out.print("\n\n\n\n\n"+reportName.getEmblemName()+"\n\n\n\n\n\n");
        dataList.add(bean);
        JRBeanCollectionDataSource beanColDataSource =
                new JRBeanCollectionDataSource(dataList);

        Map parameters = new HashMap();
        try {
            printFileName = JasperFillManager.fillReportToFile(sourceFileName,
                    parameters, beanColDataSource);
            if (printFileName != null) {
                fullPath = filePath + "/" + id + ".pdf";
                JasperExportManager.exportReportToPdfFile(printFileName, fullPath);
            }
        } catch (JRException e) {
            System.out.print("\n\n\n\n\n"+e.getMessage()+"\n\n\n\n\n\n");
        }

        //-----------Create e-permission-------------------------------------------------------------

        String msg = "<div style=\"display:block;border:2px;background-color:rgba(236, 225, 225, 0.64); border-style: solid;border-color: gray; top:114px;\"><div style=\"background-color: orange;\" align=\"center\"><img src=\"https://scontent-hkg.xx.fbcdn.net/hphotos-xfp1/v/t1.0-9/11070202_802074406546376_4249359303885995156_n.jpg?oh=5eba46cff63921d3228d8503030b9b02&oe=55B0F597\"></div><hr><h4 style=\"text-shadow: 0px 2px 3px #666;\" align=\"center\">" + name + "<br>Please Note Your Permission Id - " + id + "</h4><div align=\"left\"><h3 style=\"padding-left:30px;\">Respected Sir/Madam,</h3><h4 style=\"padding-left:30px;\">As per your last activity on <a href=\"severIndia.com\">www.getmepermision.com</a> You have applied for permission successfully regarding please note down your Permission id is <b style=\"background-color:gray;\">" + id + "</b> .<br>you can use permision is in case if you lost your e-Permission .</h4><h5 style=\"padding-left:30px;\">Warm Regards,<br>Support Team<br><a href=\"severIndia.com\">www.getmepermision.com</a><br><br>For any queries write to us on care@malanicombines.in or call us on 1800-209-3111</h5></div><hr><div style=\"background-color: green;\" align=\"left\"><br><p style=\"padding-left:30px;\">Notice: The information contained in this e-mail<br>message and/or attachments to it may contain <br>confidential or privileged information. If you are<br> not the intended recipient, any dissemination, use, <br>review, distribution, printing or copying of the <br>information contained in this e-mail message <br>and/or attachments to it are strictly prohibited.<br> If you have received this communication in error, <br>please notify us by reply e-mail or telephone and <br>immediately and permanently delete the message <br>and any attachments. <br><br>For More Information Please Find Pdf Attached<br><br>Thank you<br>.</p></div></div>";

        new com.mail.SendConfirmation_Email(email, name, id,fullPath);

        request.setAttribute("msg", msg);

        return mapping.findForward(SUCCESS);
    }
}
