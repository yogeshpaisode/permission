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
        <title>New Permission : Step 3</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery-1.11.2.min"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/validator.min"></script>
        <script src="js/validator.js"></script>


        <script type="text/javascript">
            window.history.forward(1);
            function noBack(){
                window.history.forward();
            }
        </script>


    </head>
    <body style="background-image:url('img/5.jpg');" onload="noBack();">


        <%

            String profileId = (String) session.getAttribute("profileId");

            String hrs = "";

            int j = 0;

            for (int i = 5; i < 23; i++) {


                String data = "";
                if (i < 12) {
                    if (i <= 9) {
                        data = "0" + i;
                    } else {
                        data = i + "";
                    }

                    data = data + " AM";
                } else {

                    if (i <= 9) {
                        data = "0" + i;
                    } else {
                        data = i + "";
                    }
                    data = data + " PM";
                }



                hrs = hrs + "<option>" + data + "</option>";

            }



        %>



        <header style="background: black  repeat-x; position: absolute; box-shadow: 0px 2px 0px 4px rgba( 0,0,0,0.4 ); width: 100%; height: auto; z-index: 100; top:0px; left:0px;-webkit-font-smoothing: subpixel-antialiased; position:absolute;">
            <jsp:include page="header.jsp"/>
        </header>
        <br><br><br><br><br>

        <table style="width:100%;">
            <tr>
                <td style="width:13%; padding: 7px;"><div style="top:112px; position:absolute;"><img src="https://tpc.googlesyndication.com/simgad/13072458334479246189" /></div></td>

                <!---------------------------------------------------------------------------------------------------------------->

                <td style="color:black; background-color:#dff0d8;width:74%; padding: 7px;">


                    <br>

                    <div align="center">
                        <a href="step1.jsp"> <button type="button" class="btn btn-success">Step 1<br><p>Personal Detail<br>Complete</p></button></a>
                        <img src="img/arrow.png" >
                        <a href="step2.jsp"> <button type="button" class="btn btn-success">Step 2<br><p>Permission Detail<br>Complete</p></button></a>
                        <img src="img/arrow.png" >
                        <button type="button" class="btn btn-primary">Step 3<br><p>Date and Time<br>In-Process</p></button>
                        <img src="img/arrow.png" >
                        <button type="button" class="btn btn-warning">Step 4<br><p>Payment<br>In-Complete</p></button>
                    </div>
                    <br>
                    <h4 style="padding-left: 168px;">Profile Id :<% out.print(profileId);%></h4>
                    <h3 style="padding-left: 168px;">Step 3:Fill Date and Time</h3>	

                    </div> 

                    <div class="form-horizontal" role="form">                      

                        <html:form action="/step3" onsubmit="return validateStep3Form()">

                            <%
                                String date = "";
                                String startTime = "";
                                String startPeriod = "";
                                String endTime = "";
                                String endPeriod = "";
                                String dateTimeId = "";

                                SessionFactory factory = com.Hibernate.HibernateUtil.getSessionFactory();
                                Session s = factory.openSession();
                                Criteria cr = s.createCriteria(com.step3.controller.Datetime.class);
                                cr.add(Restrictions.eq("profileId", profileId));
                                List results = cr.list();
                                for (Object o : results) {
                                    com.step3.controller.Datetime d = (com.step3.controller.Datetime) o;
                                    date = d.getDateData();
                                    startTime = d.getStartTimeData();
                                    endTime = d.getEndTimeData();
                                    dateTimeId = d.getDateTimeId();
                                    startTime = "<option>" + startTime + "</option>";
                                    endTime = "<option>" + endTime + "</option>";
                                }


                                out.print("<input type=\"text\" value=\"" + profileId + "\" hidden name=\"profileId\"/>");
                                out.print("<input type=\"text\" value=\"" + dateTimeId + "\" hidden name=\"dateTimeId\"/>");
                            %>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Date of event:</label>
                                <div class="col-sm-10">
                                    <input class="form-control" id="date" type="date" required="" style="width: 177px;" name="date" value="<% out.print(date);%>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Start Time:</label>
                                <div class="col-sm-10">

                                    <table style="width: 22%">
                                        <tr>
                                            <td> <select class="form-control" name="startTime" required="" id="starttime">

                                                    <% out.print(startTime);%>

                                                    <option>Select Start Time</option>
                                                    <% out.print(hrs);%>
                                                </select></td>

                                        </tr>
                                    </table>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label">End Time:</label>
                                <div class="col-sm-10">

                                    <table style="width: 22%">
                                        <tr>
                                            <td> <select class="form-control" name="endTime" required="" id="endtime">
                                                    <% out.print(endTime);%>
                                                    <option>Select End Time</option>
                                                    <% out.print(hrs);%>
                                                </select></td>

                                        </tr>
                                    </table>
                                </div>
                            </div>


                            <div style="padding-left:168px;"> 
                                <a href="step2.jsp"><button type="button" class="btn btn-primary">Back</button></a>
                                <button type="submit" class="btn btn-primary">Save and Continue</button>
                                <button type="reset" class="btn btn-warning">Reset</button>

                            </div>  

                        </html:form>
                    </div>


                </td>

                <!---------------------------------------------------------------------------------------------------------------->

                <td style="width:13%; padding: 7px;"><div style="top:112px; position:absolute;"><img src="http://pagead2.googlesyndication.com/simgad/9071255492840831994" align="right"/></div></td>

            </tr>

        </table>

        <header style="background: black  repeat-x;box-shadow: 4px 6px 3px 8px rgba( 0,0,0,0.4 ); width: 100%; height: 111px; z-index: 100;left:0px;top: 720px;position:absolute; -webkit-font-smoothing: subpixel-antialiased;">
            <jsp:include page="footer.jsp"/>
        </header>





    </body>
</html:html>
