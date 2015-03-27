<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <title>New Permission : Step 1</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery-1.11.2.min"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/validator.js"></script>


        <style>
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;	
                width:100%;
            }
            th, td {
                padding: 7px;

            }
        </style>

        <script type="text/javascript">
            window.history.forward(1);
            function noBack(){
                window.history.forward();
            }
        </script>


    </head>
    <body style="background-image:url('img/5.jpg');" onload="noBack();">


        <header style="background: black  repeat-x; position: absolute; box-shadow: 0px 2px 0px 4px rgba( 0,0,0,0.4 ); width: 100%; height: auto; z-index: 100; top:0px; left:0px;-webkit-font-smoothing: subpixel-antialiased; position:absolute;">
            <jsp:include page="header.jsp"/>	
        </header>
        <br><br><br><br><br>

        <table>
            <tr>
                <td style="width:13%;"><div style="top:112px; position:absolute;"><img src="https://tpc.googlesyndication.com/simgad/13072458334479246189" /></div></td>

                <!---------------------------------------------------------------------------------------------------------------->

                <td style="color:black; background-color:#dff0d8;width:74%;">


                    <br>

                    <div align="center">

                        <button type="button" class="btn btn-primary">Step 1<br><p>Personal Detail<br>In-Process</p></button>
                        <img src="img/arrow.png" >
                        <button type="button" class="btn btn-warning">Step 2<br><p>Permission Detail<br>In-Complete</p></button>
                        <img src="img/arrow.png" >
                        <button type="button" class="btn btn-warning">Step 3<br><p>Date and Time<br>In-Complete</p></button>
                        <img src="img/arrow.png" >
                        <button type="button" class="btn btn-warning">Step 4<br><p>Payment<br>In-Complete</p></button>

                    </div>

                    <br><br>
                    <%

                        String name = "";
                        String address = "";
                        String email = "";
                        String contact = "";
                        String profileId = (String) session.getAttribute("profileId");

                        if (!profileId.equals("")) {

                            SessionFactory factory = com.Hibernate.HibernateUtil.getSessionFactory();
                            Session s = factory.openSession();
                            Criteria cr = s.createCriteria(com.step1.controller.Personaldetail.class);
                            cr.add(Restrictions.eq("profileId", profileId));
                            List results = cr.list();

                            for (Object o : results) {
                                com.step1.controller.Personaldetail p = (com.step1.controller.Personaldetail) o;
                                name = p.getName();
                                address = p.getAddress();
                                profileId = p.getProfileId();
                                email = p.getEmailId();
                                contact = p.getContact();
                            }

                            s.close();

                        }
                    %>  




                    <h3 style="padding-left: 168px;">Step 1:Fill Personal Detail</h3>	



                    <div class="form-horizontal" role="form">    

                        <html:form action="/step1" onsubmit="return validateStep1Form()">




                            <input type="text" <% out.print("value=\"" + profileId + "\"");%> name="profileId" hidden=""/>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Name of Applicant:</label>
                                <div class="col-sm-10">
                                    <input class="form-control" id="focusedInput" type="text" required=""
                                           placeholder="Police will be contact to this person" name="name" <% out.print("value=\"" + name + "\"");%> onkeypress="return onlyAlphabets(event,this);">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Primary Address:</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" required="" id="step1Address"
                                              placeholder="This address will be use for verification. Maximum 90 Charecter " name="address" ><% out.print(address);%></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Primary Email Id:</label>
                                <div class="col-sm-10">
                                    <input class="form-control" id="email" type="text" required=""
                                           placeholder="Permission will be sent to this mail ID" name="email" <% out.print("value=\"" + email + "\"");%>>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Primary 10 Digit Mobile Number:</label>
                                <div class="col-sm-10">
                                    <input class="form-control" id="numBro" type="text" required="" onkeypress="return onlyNumbers(event,this);"
                                           placeholder="SMS alert will be sent to this phone number" name="contact" <% out.print("value=\"" + contact + "\"");%>>


                                </div>
                            </div>

                            <div align="left" style="padding-left: 168px;"> 

                                <button type="submit" class="btn btn-primary">Save and Continue</button>
                                <button type="reset" class="btn btn-warning">Reset</button>
                                <br>
                            </div>  

                        </html:form>
                    </div>


                </td>

                <!---------------------------------------------------------------------------------------------------------------->

                <td style="width:13%;"><div style="top:112px; position:absolute;"><img src="http://pagead2.googlesyndication.com/simgad/9071255492840831994" align="right"/></div></td>

            </tr>

        </table>

        <header style="background: black  repeat-x;box-shadow: 4px 6px 3px 8px rgba( 0,0,0,0.4 ); width: 100%; height: 111px; z-index: 100;left:0px;top: 720px;position:absolute; -webkit-font-smoothing: subpixel-antialiased;">
            <jsp:include page="footer.jsp"/>
        </header>




    </body>
</html:html>
