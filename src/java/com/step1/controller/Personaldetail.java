package com.step1.controller;
// Generated Mar 13, 2015 5:27:17 PM by Hibernate Tools 3.2.1.GA



/**
 * Personaldetail generated by hbm2java
 */
public class Personaldetail  implements java.io.Serializable {


     private Integer id;
     private String name;
     private String address;
     private String emailId;
     private String contact;
     private String profileId;

    public Personaldetail() {
    }

    public Personaldetail(String name, String address, String emailId, String contact, String profileId) {
       this.name = name;
       this.address = address;
       this.emailId = emailId;
       this.contact = contact;
       this.profileId = profileId;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    public String getEmailId() {
        return this.emailId;
    }
    
    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }
    public String getContact() {
        return this.contact;
    }
    
    public void setContact(String contact) {
        this.contact = contact;
    }
    public String getProfileId() {
        return this.profileId;
    }
    
    public void setProfileId(String profileId) {
        this.profileId = profileId;
    }




}


