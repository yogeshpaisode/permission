/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mail;

import java.io.InputStream;
import java.net.URL;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author Yogesh
 */
public class sendStep1Completion_Email implements Runnable {

    String receiver = "";
    String name = "";
    String id = "";
    URL url=  getClass().getResource("1.txt");
    String filePath=url.getPath().substring(1);
    String filename = "Terms and Conditions";

    public sendStep1Completion_Email(String receiver, String name, String id) {
        try {
            this.receiver = receiver;
            this.name = name;
            this.id = id;
            new Thread(this, "").start();
        } catch (Exception e) {
            System.out.print("\n\n\n\nError Yogesh : " + e.getMessage() + "\n\n\n\n");
        }
    }

    @Override
    public void run() {
        sendEmail();
    }

    public void sendEmail() {
        // Recipient's email ID needs to be mentioned. sender, password, subject, body,filePath,receiver        

        String host = "mail.malanicombines.in";
        String to = receiver;
        String subject = "Permission Detail-Your Permision Id Is- "+id;
        String body = "<div style=\"display:block;border:2px;background-color:rgba(236, 225, 225, 0.64); border-style: solid;border-color: gray;\"><div style=\"background-color: orange;\" align=\"center\"><img src=\"https://scontent-hkg.xx.fbcdn.net/hphotos-xfp1/v/t1.0-9/11070202_802074406546376_4249359303885995156_n.jpg?oh=5eba46cff63921d3228d8503030b9b02&oe=55B0F597\"></div><hr><h2 style=\"text-shadow: 0px 2px 3px #666;\" align=\"center\">" + name + "<br>Please Note Your Permission Id - " + id + "</h2><div align=\"left\"><h3 style=\"padding-left:30px;\">Respected Sir/Madam,</h3><h4 style=\"padding-left:30px;\">As per your last activity on <a href=\"severIndia.com\">www.getmepermision.com</a> you have complet step 1 successfully regarding please note down your Permission id is <b style=\"background-color:gray;\">" + id + "</b> .<br>you can use permision is in case if you stuck in incomlet transaction.</h4><h5 style=\"padding-left:30px;\">Warm Regards,<br>Support Team<br><a href=\"severIndia.com\">www.getmepermision.com</a><br><br>For any queries write to us on care@malanicombines.in or call us on 1800-209-3111</h5></div><hr><div style=\"background-color: green;\" align=\"left\"><br><p style=\"padding-left:30px;\">Notice: The information contained in this e-mail<br>message and/or attachments to it may contain <br>confidential or privileged information. If you are<br> not the intended recipient, any dissemination, use, <br>review, distribution, printing or copying of the <br>information contained in this e-mail message <br>and/or attachments to it are strictly prohibited.<br> If you have received this communication in error, <br>please notify us by reply e-mail or telephone and <br>immediately and permanently delete the message <br>and any attachments. <br><br>For More Information Please Find Pdf Attached<br><br>Thank you<br>.</p></div></div>";

        // Sender's email ID needs to be mentioned
        String from = "support@malanicombines.in";
        final String username = from;//change accordingly
        final String userPassword = "support@mcombines7654321";//change accordingly
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");
        // Get the Session object.
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {

                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, userPassword);
                    }
                });
        try {
            // Create a default MimeMessage object.
            Message message = new MimeMessage(session);
            // Set From: header field of the header.

            message.setFrom(new InternetAddress(from));
            // Set To: header field of the header.
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to));
            // Set Subject: header field
            message.setSubject(subject);
            // Create the message part
            BodyPart messageBodyPart = new MimeBodyPart();
            // Now set the actual message          
            messageBodyPart.setContent(body, "text/html");           
            // Create a multipar message
            Multipart multipart = new MimeMultipart();
            // Set text message part
            multipart.addBodyPart(messageBodyPart);
            // Part two is attachment            
            messageBodyPart = new MimeBodyPart();          
            DataSource source = new FileDataSource(filePath);
            messageBodyPart.setDataHandler(new DataHandler(source));
            messageBodyPart.setFileName(filename);
            multipart.addBodyPart(messageBodyPart);
            // Send the complete message parts
            message.setContent(multipart);
            // Send message
            Transport.send(message);

        } catch (Exception e) {
            System.out.print("\n\n\n\nError Yogesh : " + e.getMessage() + "\n\n\n\n");
        }
    }
}
