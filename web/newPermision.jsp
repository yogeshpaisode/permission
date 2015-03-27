<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>New Permission:</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery-1.11.2.min"></script>
        <script src="js/bootstrap.min.js"></script>

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

    </head>
    <body style="background-image:url('img/5.jpg');">


        <header style="background: black  repeat-x; position: absolute; box-shadow: 0px 2px 0px 4px rgba( 0,0,0,0.4 ); width: 100%; height: auto; z-index: 100; top:0px; left:0px;-webkit-font-smoothing: subpixel-antialiased; position:absolute;">
            <jsp:include page="header.jsp"/>
        </header>
        <br><br><br><br><br>

        <%
            String errorMsg = "";

            if (!(session.getAttribute("errorMsg") == null)) {
                errorMsg = (String) session.getAttribute("errorMsg");
            }

        %>


        <table>
            <tr>
                <td style="width:13%;"><div style="top:112px; position:absolute;"><img src="https://tpc.googlesyndication.com/simgad/13072458334479246189" /></div></td>

                <%
                    String profileId = (String) session.getAttribute("profileId");
                    if (!profileId.equals("")) {
                        response.sendRedirect("step1.jsp");
                    }

                %>


                <!---------------------------------------------------------------------------------------------------------------->

                <td style="color:black; background-color:#dff0d8;width:74%;" align="center">
                    <% out.print(errorMsg);%>
                    <br>
                    <a href="step1.jsp"> <button type="button" class="btn btn-primary" style="width: 33%;">Start With New Permission</button></a>
                    <h3>or</h3>
                    <h4>Continue Using Existing Permission Id</h4>


                    <form role="form" action="xsdhsahd734y32hjhshdjsahdjr3ruhueyr3ryyruwhrjwhr83yrhwqjrhjkdsadmsnaduahuwy8ry328ry8qr8qwrwqiwqjwkdjas,dkjasowyr8328r3rjwqkjwqadjsakjdkjsadjweoiwquewqejwqdjakjdjkadjsadjsajdasdasi83ur8328r83232.jsp" method="post">
                        <div class="form-group">

                            <input type="text" class="form-control" id="name" required=""
                                   placeholder="Please Enter Your Permission Id Here.." style="width: 33%;" name="id">                            
                        </div>
                        <button type="submit" class="btn btn-primary" style="width: 33%;">Submit</button>
                    </form>
                    <br><br><br>

                    <!---------------------------AD------------------------------------------------>
                    <img src="http://pagead2.googlesyndication.com/simgad/11837140660743254807"/>
                    <!---------------------------AD------------------------------------------------>
                </td>

                <!---------------------------------------------------------------------------------------------------------------->

                <td style="width:13%;"><div style="top:112px; position:absolute;"><img src="http://pagead2.googlesyndication.com/simgad/9071255492840831994" align="right"/></div></td>

            </tr>

        </table>
        <header style="background: black  repeat-x;box-shadow: 4px 6px 3px 8px rgba( 0,0,0,0.4 ); width: 100%; height: 111px; z-index: 100;left:0px;top: 720px;position:absolute; -webkit-font-smoothing: subpixel-antialiased;">
            <jsp:include page="footer.jsp"/>
        </header>

    </body>
</html>
