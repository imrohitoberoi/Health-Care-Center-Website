<%
Cookie mycookie = new Cookie("id", "");//making new empty cookie
  mycookie.setMaxAge(0); //with instant expiry date
  response.addCookie(mycookie);
    session.invalidate();
    response.sendRedirect("login.jsp");
    
%>