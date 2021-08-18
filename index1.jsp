<%
    Cookie mycookies[] = request.getCookies(); //getting cookie
    if(mycookies!=null)
    {
        for(Cookie mycookie123 : mycookies)
        {
            if(mycookie123.getName().equals("uname")) //getting name of cookie
            {
                session.setAttribute("uname", mycookie123.getValue());
                response.sendRedirect("welcome.jsp");
            }
        }
    }
    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <div><h1>Login</h1></div>
        <form action="abc.php" method="post">
            Username<input type="text" name="uname"></br>
            Password<input type="password" name="pass"></br>
            <input type="checkbox" name="remember">Keep in logged in <br>
            <input type="submit" name="s1" value="Login">
        </form>
        
    </body>
</html>
