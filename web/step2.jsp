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
        <title>New Permission : Step 2</title>
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

        <%

            String profileId = (String) request.getAttribute("profileId");

            String event = "";
            String address = "";
            String pincode = "";
            String processionFrom = "";
            String processionTo = "";
            String peoplenumber = "";
            String permisionId = "";
            String required = "required=\"\"";
            String src = "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTf7mJKqSKG6ipus9cpQIZCBfLsrjUQ9tOlV51rNcW6Fll-HwdfGg";

            if (request.getAttribute("profileId") == null) {
                profileId = (String) session.getAttribute("profileId");
            } else {
                session.setAttribute("profileId", profileId);
            }


            SessionFactory factory = com.Hibernate.HibernateUtil.getSessionFactory();
            Session s = factory.openSession();
            Criteria cr = s.createCriteria(com.step2.controller.Permisiondetail.class);
            cr.add(Restrictions.eq("profileId", profileId));
            List results = cr.list();
            for (Object o : results) {
                com.step2.controller.Permisiondetail p = (com.step2.controller.Permisiondetail) o;
                event = p.getNature();
                address = p.getAddress();
                pincode = p.getPincode();
                processionFrom = p.getProcessionFrom();
                processionTo = p.getProcessionTo();
                peoplenumber = p.getPeopleNumber() + "";
                permisionId = p.getPermisionId();
                event = "<option>" + p.getNature() + "</option>";
                required = "";
                src = "/Permision/upload/" + p.getDocument();
            }
            s.close();





        %>


        <table style="width:100%;">
            <tr>
                <td style="width:13%;"><div style="top:112px; position:absolute;"><img src="https://tpc.googlesyndication.com/simgad/13072458334479246189" /></div></td>

                <!---------------------------------------------------------------------------------------------------------------->

                <td style="color:black; background-color:#dff0d8;width:74%;">


                    <br>

                    <div align="center">
                        <a href="step1.jsp"> <button type="button" class="btn btn-success">Step 1<br><p>Personal Detail<br>Complete</p></button></a>
                        <img src="img/arrow.png" >
                        <button type="button" class="btn btn-primary">Step 2<br><p>Permission Detail<br>In-Process</p></button>
                        <img src="img/arrow.png" >
                        <button type="button" class="btn btn-warning">Step 3<br><p>Date and Time<br>In-Complete</p></button>
                        <img src="img/arrow.png" >
                        <button type="button" class="btn btn-warning">Step 4<br><p>Payment<br>In-Complete</p></button>
                    </div>
                    <br>
                    <h4 style="padding-left: 168px;">Profile Id :<% out.print(profileId);%></h4>

                    <h3 style="padding-left: 168px;">Step 2:Fill Permission Detail</h3>	

                    </div> 

                    <div class="form-horizontal" role="form">    

                        <html:form action="/step2" onsubmit="return validateStep2Form()" enctype="multipart/form-data">


                            <%
                                out.print("<input type=\"text\" value=\"" + profileId + "\" hidden name=\"profileId\"/>");
                            %>


                            <%
                                out.print("<input type=\"text\" value=\"" + permisionId + "\" hidden name=\"permisionId\"/>");
                            %>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Nature of Event:</label>
                                <div class="col-sm-10">


                                    <select class="form-control" name="eventType" required="">
                                        <% out.print(event);%>
                                        <option>Select from below list</option>
                                        <option>Marriage</option>
                                        <option>Flash Mob</option>
                                        <option>Strikes</option>
                                        <option>Rally</option>
                                        <option>Concerts</option>
                                        <option>Gatherings</option>                                        
                                        <option>Other</option>                                        
                                    </select>


                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Location/Address<br>of Event:</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" required="" required="" id="step2Address"
                                              placeholder="This address will be use for verification. Maximum 90 Charecter" name="adddress"><% out.print(address);%></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Pin Code:</label>
                                <div class="col-sm-10">
                                    <input class="form-control" id="pincode" type="text"  required="" <% out.print("value=\"" + pincode + "\"");%>
                                           placeholder="Police Duty will be assign with the help of this pin code" name="pincode" onkeypress="return onlyNumbers(event,this);">
                                </div>
                            </div>                          

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Procession From Address <br>(optional):</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" id="processionStart"
                                              placeholder="Procession should start from this address" name="processionFrom"><% out.print(processionFrom);%></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Procession To Address <br>(optional):</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" id="processionEnd"
                                              placeholder="Procession should end to this address" name="processionTo"><% out.print(processionTo);%></textarea>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label">Expected Number Of People:</label>
                                <div class="col-sm-10">
                                    <input class="form-control" id="peopleNumber" type="text"  required="" <% out.print("value=\"" + peoplenumber + "\"");%>
                                           placeholder="Expected number of people" name="peoplenumber" onkeypress="return onlyNumbers(event,this);">
                                </div>
                            </div>   

                            <script type="text/javascript">
                                function PreviewImage() {
                                    var oFReader = new FileReader();
                                    oFReader.readAsDataURL(document.getElementById("inputfile").files[0]);

                                    oFReader.onload = function (oFREvent) {
                                        document.getElementById("uploadPreview").src = oFREvent.target.result;
                                    };
                                };

                            </script>      


                            <div style="padding-left:170px;">
                                <img id="uploadPreview" src="<% out.print(src);%>" width="150" height="150" />  
                            </div>              

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Upload Event Document<br>(.png or .jpg File):</label>
                                <div class="col-sm-10">
                                    <input type="file" id="inputfile" class="btn btn-info" name="document" <% out.print(required);%> onchange="PreviewImage();" accept="image/jpg, image/JPG,image/JPEG, image/jpeg,image/png">		 
                                </div>
                            </div>
                            <div style="padding-left:168px;">
                                <a href="step1.jsp"><button type="button" class="btn btn-primary">Back</button></a>
                                <button type="submit" class="btn btn-primary">Save and Continue</button>
                                <button type="reset" class="btn btn-warning">Reset</button>
                            </div>  

                        </html:form>
                    </div>


                </td>

                <!---------------------------------------------------------------------------------------------------------------->

                <td style="width:13%;"><div style="top:112px; position:absolute;"><img src="http://pagead2.googlesyndication.com/simgad/9071255492840831994" align="right"/></div></td>

            </tr>

        </table>

        <header style="background: black  repeat-x;box-shadow: 4px 6px 3px 8px rgba( 0,0,0,0.4 ); width: 100%; height: 111px; z-index: 100;left:0px;position:absolute; -webkit-font-smoothing: subpixel-antialiased;">
            <jsp:include page="footer.jsp"/>
        </header>




    </body>
</html:html>
