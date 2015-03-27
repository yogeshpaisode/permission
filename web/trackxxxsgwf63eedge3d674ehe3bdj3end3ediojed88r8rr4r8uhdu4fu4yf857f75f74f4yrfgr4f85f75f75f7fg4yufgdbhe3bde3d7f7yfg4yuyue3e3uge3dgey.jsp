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
        cr.add(Restrictions.eq("paymentStatus", true));
        cr.add(Restrictions.eq("profileId", profileId));

        results = cr.list();

        if (results.size() == 1) {
            for (Object o : results) {
                com.paymentStatus.Paymentstatus p = (com.paymentStatus.Paymentstatus) o;
                session.setAttribute("trackErrorMsg", "");
                session.setAttribute("trackId", profileId);
                response.sendRedirect("trackResult.jsp");
            }
        } else {
            session.setAttribute("trackErrorMsg", "<div class=\"alert alert-danger\"><strong>Access Denied !</strong><br>Payment Is Not Done Yet For Permission Id " + profileId.toUpperCase() + " ,Please Complet Your Profile By Making Desire Payment</div>");
            response.sendRedirect("track.jsp");
        }
    } else {
        session.setAttribute("trackErrorMsg", "<div class=\"alert alert-danger\"><strong>Access Denied !</strong><br>Last Entered Permission Id " + profileId.toUpperCase() + " Do Not Match With Our Database..</div>");
        response.sendRedirect("track.jsp");

    }


%>