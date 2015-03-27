<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Home</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery-1.11.2.min"></script>
        <script src="js/bootstrap.min.js"></script>

        <script>
            if(screen.height<768){
                //mobile_index
                window.location.assign("mobile_index.jsp")
            }
        </script>


        <%

            session.setAttribute("profileId", "");

        %>

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

                    <div align="center">
                        <h3>Why You Need Permission</h3>
                        <h4 style="text-decoration:underline;">Problem With Excessive Crowding and Poor Crowd Management</h4>
                    </div>

                    <div align="left">

                        <p>In recent years, excessive crowding and poor crowd management at large events like festivals, concerts, demonstrations and other kinds of gatherings, have lead to incidents. Because these Incidents have lead to fatalities, serious injuries and damage, we made a lot of effort trying to understand crowds, and these incidents could be prevented based on knowing how to interact and handle crowd.
                            Web portals/Websites are meant to attract a large variety of users and serve through the means of World Wide Web. This issue of severe accidents, road blockages, and poor crowd management is a multidimensional problem which has to be understood. 
                        </p>

                        <p>Each year hundreds of special events are held in different cities. Residents and organizations planning a special event are required to obtain permits to hold special events. Permits are required by any person or organization wanting to either: </p>
                        <p>Conduct an event on a public road such as a foot or bicycle race or similar, <br>

                            || Flash mob<br>
                            || Strikes <br>
                            || Rally etc.
                        </p>


                        <p>The definition of an event varies from agency to agency, as do the licensing and permit requirements for different types of special events. Highway collections and events are regulated by law to ensure that they are coordinated and all relevant parties are aware of the plan to have pedestrians or bicycles on roads for special purposes unrelated to day-to-day activities.</p>

                    </div>

                    <table style="width: 100%;">
                        <tr><img src="img/5.jpg" style="opacity: 0.4px;width: 320px;height: 250px; padding: 5px;" class="img-thumbnail"/></tr>
            <tr><img src="img/1.jpg" style="opacity: 0.4px;width: 320px;height: 250px; padding: 5px;" class="img-thumbnail"/></tr>
        <tr><img src="img/2.jpg" style="opacity: 0.4px;width: 320px;height: 250px; padding: 5px;" class="img-thumbnail"/></tr>   
</table>    
<br>

<p>The involved emergency organization like police station shows functional and dysfunctional qualities. Police are the one who has to be there at the crisis site, and show the necessary skills for improvised crowd management and safety. The aim of this web portal is to make available of police at the site of event getting organized. 
    Police decision-making plays an important part in crisis preparedness concerning crowd management. 
</p>
<p>This web portal contain all kinds of necessary information and services in a unique environment to provide users with simple, quick and secure access to relevant organizational information. Although the aim of this report is that on the basis of i about road mishaps, accident at crowded places etc. that how we are going to serve people more effectively with the help of this web portal. It will provide police permission before carrying out any event and this permission will make sure that the event will be getting organized under the police surveillance.</p>
<p>The web portal developed, outlines mainly in two phases. In the first phase a web portal âSafety Managementâ is been designed to ask for the police permission for the event and to send the information about the event scheduled by crowd or any organization. First phase of system is purely for the purpose regarding the information to get reached at the local police station of the respective city/state. </p>
<p>The results of Phase one defined the police permit for the event as a means to improve emergency response and preparedness capabilities through internet by capturing and distributing events information to various police stations. The system is easy to use and disparate systems must be coordinated for efficiency, allowing a number of organizations to both see and inform to the portal. </p>
<p> The second phase of the web portal was to assign the duties to relevant police officers for the type of event going to happened. The respective police station will assign the duties according to specified permit/event registered by the person or organization. </p>
<p>It will become compulsory for every event management organization, personal event management body, and local or public event organization to get a permit before carrying out those for a better management and safety issue of crowd. </p>





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
