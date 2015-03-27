<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%

    String profileId = (String) request.getParameter("id");
    SessionFactory sessionFactory = com.Hibernate.HibernateUtil.getSessionFactory();
    Session s = sessionFactory.openSession();
    Criteria cr = s.createCriteria(com.paymentStatus.Paymentstatus.class);
    cr.add(Restrictions.eq("profileId", profileId));
    List results = cr.list();

    if (results.size() == 1) {

        cr = s.createCriteria(com.paymentStatus.Paymentstatus.class);
        cr.add(Restrictions.eq("paymentStatus", false));
        cr.add(Restrictions.eq("profileId", profileId));
        results = cr.list();

        if (results.size() == 1) {
            for (Object o : results) {
                com.paymentStatus.Paymentstatus p = (com.paymentStatus.Paymentstatus) o;
                session.setAttribute("profileId", p.getProfileId());
                session.setAttribute("errorMsg", "");
                response.sendRedirect("step1.jsp");
            }
        } else {
            session.setAttribute("errorMsg", "<div class=\"alert alert-danger\"><strong>Access Denied !</strong><br>Payment Already Done For Permission Id " + profileId.toUpperCase() + " Please Use <a href=\"cancel.jsp\" style=\"text-decoration:underline;\">Cancel Permission </a> In Case If You Want To Cancl Permission</div>");
            response.sendRedirect("newPermision.jsp");
        }
    } else {
        session.setAttribute("errorMsg", "<div class=\"alert alert-danger\"><strong>Access Denied !</strong><br>Last Entered Permission Id " + profileId.toUpperCase() + " Do Not Match With Our Database..</div>");
        response.sendRedirect("newPermision.jsp");

    }


%>