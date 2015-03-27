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

        <style>
            table, th, td {      	

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

        <%

            String name = "";
            String address = "";
            String email = "";

            String profileId = (String) session.getAttribute("profileId");
            SessionFactory sessionFactory = com.Hibernate.HibernateUtil.getSessionFactory();
            Session hibsession = sessionFactory.openSession();

            Criteria cr = hibsession.createCriteria(com.step1.controller.Personaldetail.class);
            cr.add(Restrictions.eq("profileId", profileId));
            java.util.List results = cr.list();

            for (Object o : results) {
                com.step1.controller.Personaldetail personaldetail = (com.step1.controller.Personaldetail) o;
                name = personaldetail.getName();
                address = personaldetail.getAddress();
                email = personaldetail.getEmailId();
            }


        %>



        <header style="background: black  repeat-x; position: absolute; box-shadow: 0px 2px 0px 4px rgba( 0,0,0,0.4 ); width: 100%; height: auto; z-index: 100; top:0px; left:0px;-webkit-font-smoothing: subpixel-antialiased; position:absolute;">
            <jsp:include page="header.jsp"/>
        </header>
        <br><br><br><br><br>
        <table style="width:100%;">
            <tr>
                <td style="width:13%;"><div style="top:112px; position:absolute;"><img src="https://tpc.googlesyndication.com/simgad/13072458334479246189" /></div></td>

                <!---------------------------------------------------------------------------------------------------------------->

                <td style="color:black; background-color:#dff0d8;width:74%;">


                    <br>

                    <div align="center">
                        <a href="step1.jsp"><button type="button" class="btn btn-success">Step 1<br><p>Personal Detail<br>Complete</p></button></a>
                        <img src="img/arrow.png" >
                        <a href="step2.jsp"><button type="button" class="btn btn-success">Step 2<br><p>Permission Detail<br>Complete</p></button></a>
                        <img src="img/arrow.png" >
                        <a href="step3.jsp"><button type="button" class="btn btn-success">Step 3<br><p>Date and Time<br>Complete</p></button></a>
                        <img src="img/arrow.png" >
                        <button type="button" class="btn btn-primary">Step 4<br><p>Payment<br>In-Process</p></button>
                    </div>
                    <br>
                    <h4 style="padding-left: 104px;">Profile Id :<% out.print(profileId);%></h4>
                    <h3 style="padding-left: 104px;">Step 4:Make Payment</h3>	

                    </div> 

                    <div class="form-horizontal" role="form">     

                        <html:form action="/step4">

                            <div align="left" style="padding-left:104px;"> 

                                <table class="table">
                                    <thead>
                                        <tr class="danger">
                                            <th>Payment Memo:</th>      
                                        </tr>
                                    </thead>    
                                </table>

                                <table class="table">
                                    <tr class="success">
                                        <td>Organizer Name</td>
                                        <td>: <% out.print(name);%></td>      
                                    </tr>    
                                    <tr class="success">
                                        <td>Address</td>
                                        <td>: <% out.print(address);%></td>      
                                    </tr>    
                                    <tr class="success">
                                        <td>Total amount</td>
                                        <td>: 2100 /- only</td>      
                                    </tr>      
                                    </tbody>
                                </table>    


                                <input type="text" name="profileId" hidden="" value="

                                       <%
                                           out.print(profileId);
                                       %>

                                       ">
                                <input type="text" name="name" hidden="" value="

                                       <%
                                           out.print(name);
                                       %>

                                       ">

                                <input type="text" name="email" hidden="" value="

                                       <%
                                           out.print(email);
                                       %>

                                       ">

                                <script>

                                    function openTandC(){

                                        window.open ("http://www.australiandesignunit.com/wp-content/uploads/SampleTermsandConditions.pdf","Terms and Conditions","menubar=1,resizable=1,width=650,height=650");

                                    }
                                </script>




                                <table class="alert alert-danger">

                                    <tr>

                                    <script>
                                            
                                        function chk(){
                                            var x = document.getElementById("tc").checked;
                                                 
                                            if(x==true){
                                                document.getElementById("sub").disabled=false
                                            }
                                            else{
                                                document.getElementById("sub").disabled=true
                                            }
                                                 
                                        }
                                            
                                    </script>


                                    <td><input type="checkbox" onclick="chk();" id="tc"></td>
                                    <td style="text-decoration: underline;" onclick="openTandC();"><a href="">I have agreed to the terms and conditions</a></td>

                                    </tr>

                                </table>


                                <a href="step3.jsp"><button type="button" class="btn btn-primary">Back</button></a>
                                <button type="submit" class="btn btn-primary" disabled="" id="sub">Make Payment Now</button>
                                <a href="index.jsp"><button class="btn btn-primary" type="button">Later</button></a>


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
