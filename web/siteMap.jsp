<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Site Map</title>
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

        <table>
            <tr>
                <td style="width:13%;"><div style="top:112px; position:absolute;"><img src="https://tpc.googlesyndication.com/simgad/13072458334479246189" /></div></td>

                <!---------------------------------------------------------------------------------------------------------------->

                <td style="color:black; background-color:#dff0d8;width:74%;">
                    <div class="alert alert-success"><h3>Site Map :</h3></div>
                    
                    <UL>
                        <li><a href="index.jsp">Home</a></li>
                        <br>
                        <li><a href="newPermision.jsp">New Permission</a></li> <br>                       
                        <ul> 
                            <li>Start With New Permission</li>
                            <ul>
                                <li>Step 1: Provide Personal Detail</li>
                                <li>Step 2: Provide Permission Detail</li>
                                <li>Step 3: Provide Date and Time of event</li>
                                <li>Step 4: Make Payment and collect e-permission</li>
                            </ul><br>
                            <li>Continue Using Existing Permission Id</li>   
                            <ul>
                                <li>Continue Using Step 1</li>
                            </ul>
                        </ul>
                        <br>

                        <li><a href="cancel.jsp">Cancel Permission</a></li>
                        <ul>
                            <li>Provide Permission Id and cancel Permission</li>
                        </ul><br>

                        <li><a href="track.jsp">Track Permission Status</a></li>
                        <ul>
                            <li>Download e-permission in Pdf format</li>
                            <li>Track response by police station</li>             
                        </ul>
                        <br>

                        <li><a href="contactUs.jsp">Contact Us</a></li>
                        <ul>
                            <li>Contact on Toll Free Number 1800 345 543</li>
                            <li>Contact on email care@getmepermission.com</li>
                            <li>Get information from nearest police station</li>
                        </ul><br>

                        <li><a href="faq.jsp">Frequently Asked Question</a></li>
                        <br>
                        <li><a href="caseStudy.jsp">Concept Case Study</a></li>
                        <br>
                        <li><a href="tc.jsp">Terms and Condition</a></li>
                        <br>
                        <li><a href="help.jsp">Help</a></li>


                    </UL> 




                </td>

                <!---------------------------------------------------------------------------------------------------------------->

                <td style="width:13%;"><div style="top:112px; position:absolute;"><img src="http://pagead2.googlesyndication.com/simgad/9071255492840831994" align="right"/></div></td>

            </tr>

        </table>
        <header style="background: black  repeat-x;box-shadow: 4px 6px 3px 8px rgba( 0,0,0,0.4 ); width: 100%; height: 111px; z-index: 100;left:0px;position:absolute; -webkit-font-smoothing: subpixel-antialiased;">
            <jsp:include page="footer.jsp"/>	
        </header>
    </body>
</html>
