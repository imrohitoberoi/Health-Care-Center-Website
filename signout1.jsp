<%
  Cookie mycookie = new Cookie("uname", "");
  mycookie.setMaxAge(0);
  response.addCookie(mycookie);
  response.sendRedirect("index1.jsp");


%>
