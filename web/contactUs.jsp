<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Contact Us</title>
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

                <td style="color:black; background-color:#dff0d8;width:74%;" align="center">

                    <div class="alert alert-success"><h3>Contact Us :</h3></div>



                    <div class="alert alert-danger">For Any Query Call Us On Toll Free Number - 1800 567 677<br>Or<br>Email Us On : care@getmepermision.com</div>
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
