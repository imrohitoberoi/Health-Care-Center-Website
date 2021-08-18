<%
    Thread.sleep(50);
    String name=request.getParameter("pname");
    out.print("Welcome " + name);


%>