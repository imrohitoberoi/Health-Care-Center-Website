<!THIS IS COPY OF LOGIN PAGE>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="dbvars.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if(session.getAttribute("name")==null)
    {
        response.sendRedirect("login.jsp");
    }
    
    %>
    <html>
    <head>
<!DOCTYPE html>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <%@include file="extfiles.jsp"%>
    </head>
    <body>
    
        <%
    if(session.getAttribute("usertype").toString().equalsIgnoreCase("admin"))
    {
        %> <%@include file="adminheader.jsp"%><%
    }
    else if(session.getAttribute("usertype").toString().equalsIgnoreCase("normal"))
    {
        %><%@include file="header.jsp"%><%
    }
      
    %>

        
        `<!-- contact -->
<section class="mail pt-lg-5 pt-4">
<div class="container pt-lg-5">
<h2 class="heading text-center mb-sm-5 mb-4">Change Password </h2>
<div class="row agileinfo_mail_grids">
<div class="col-lg-8 agileinfo_mail_grid_right">
	<form action="#" method="post">
	<div class="row">
	<div class="col-md-6 wthree_contact_left_grid pr-md-0">
	
	<div class="form-group">
		<input type="password" name="opass" class="form-control" placeholder="Current Password" required="">
		</div>
	
                <div class="form-group">
		<input type="password" name="npass" class="form-control" placeholder="New Password" required="">
		</div>
                <div class="form-group">
		<input type="password" name="cpass" class="form-control" placeholder="Confirm New Password" required="">
		</div>
	
	<div class="col-md-12">
	<div class="submit-buttons">
		<input type="submit" name="s1" class="btn" value="Change">
	
        	</div></div>
		</div>
		</div>
    <%
       if(request.getParameter("s1")!=null)
         {
             String opass=request.getParameter("opass") + "@$$$#%%%%$#@$@$";
             String npass=request.getParameter("npass") + "@$$$#%%%%$#@$@$";
             String cpass=request.getParameter("cpass") + "@$$$#%%%%$#@$@$";
             if(npass.equals(cpass))
             {
                 try
                {
                Class.forName("com.mysql.jdbc.Driver");
                Connection myconn=DriverManager.getConnection(dburl,dbuname,dbpass);
                try
                {
                    String q="update signup set password=md5(?) where (username=? or phonenumber=? or email=?) and password=md5(?)";
                
                    PreparedStatement myst=myconn.prepareStatement(q);
                  
                    myst.setString(1,npass);
                    myst.setString(2,session.getAttribute("uname").toString());   //NOTE AS WE GET FROM SESSION
                    myst.setString(3,session.getAttribute("phone").toString());
                    myst.setString(4,session.getAttribute("email").toString());
                    myst.setString(5,opass);
                    int count = myst.executeUpdate();
                                                    
                    if(count==1)
                   
                    {
                            out.print("Password Changed Successfully");
                    }
                    else
                    {
                            out.print("Current Password Incorrect");
                    }
                 }
                 catch(Exception e)
                 {
                   e.printStackTrace();
                   out.print("Error Occured " + e.getMessage());   
                 }            
                finally
                 {
                   myconn.close();
                 }
           }
          catch(Exception e)
          {
           out.print("Connection failed - " + e.getMessage());   
           }
             }
             else
             {
                 out.print("New Password didnt matched");
             }
         }
                          %>
				</form>
			</div>
		</div>
	</div>
	
</section>
<!-- //contact -->
 <%@include file="footer.jsp"%>
     </body>
    </html>

