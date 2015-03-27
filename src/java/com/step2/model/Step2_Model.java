/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.step2.model;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author Yogesh
 */
public class Step2_Model extends org.apache.struts.action.ActionForm {

    String eventType = "";
    String processionFrom = "Not Provided";
    String permisionId = "NO";

    public String getPermisionId() {
        return permisionId;
    }

    public void setPermisionId(String permisionId) {
        this.permisionId = permisionId;
    }

    public String getProcessionFrom() {
        return processionFrom;
    }

    public void setProcessionFrom(String processionFrom) {
        this.processionFrom = processionFrom;
    }

    public String getProcessionTo() {
        return processionTo;
    }

    public void setProcessionTo(String processionTo) {
        this.processionTo = processionTo;
    }
    String processionTo = "Not Provided";

    public String getAdddress() {
        return adddress;
    }

    public void setAdddress(String adddress) {
        this.adddress = adddress;
    }

    public FormFile getDocument() {
        return document;
    }

    public void setDocument(FormFile document) {
        this.document = document;
    }

    public String getEventType() {
        return eventType;
    }

    public void setEventType(String eventType) {
        this.eventType = eventType;
    }

    public String getPeoplenumber() {
        return peoplenumber;
    }

    public void setPeoplenumber(String peoplenumber) {
        this.peoplenumber = peoplenumber;
    }

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }
    String adddress = "";
    String pincode = "";
    String peoplenumber = "";
    String profileId = "";

    public String getProfileId() {
        return profileId;
    }

    public void setProfileId(String profileId) {
        this.profileId = profileId;
    }
    private FormFile document = null;

    /**
     *
     */
    public Step2_Model() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
//        if (getName() == null || getName().length() < 1) {
//            errors.add("name", new ActionMessage("error.name.required"));
//            // TODO: add 'error.name.required' key to your resources
//        }

        //profileId=(String)request.getAttribute("profileId");

        return errors;
    }
}
