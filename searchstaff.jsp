
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="dbvars.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
        <%@include file="extfiles.jsp"%>
    </head>
    <body>
        <%@include file="adminheader.jsp"%>
        `<!-- contact -->
<section class="mail pt-lg-5 pt-4">
<div class="container pt-lg-5">
<h2 class="heading text-center mb-sm-5 mb-4">Search Staff</h2>
<div class="row agileinfo_mail_grids">
<div class="col-lg-8 agileinfo_mail_grid_right">
	<form action="#" method="post">
	<div class="row">
	<div class="col-md-6 wthree_contact_left_grid pr-md-0">
	
	<div class="form-group">
		<input type="text" name="uname" class="form-control" placeholder="Name/Phone/Emailid/Type" required="">
		</div>
		</div>
	
	<div class="col-md-12">
	<div class="submit-buttons">
            <input type="submit" name="s1" class="btn" value="Search"> <br/><br/><br/>
		</div>
		</div>
		</div>
    <%
       if(request.getParameter("s1")!=null)
         {
           try
             {
               Class.forName("com.mysql.jdbc.Driver");//CALLS DRIVER,,YOU HAVE TO ADD LIBRARY NAMED "MYSQL JDBC DRIVER" 
               Connection myconn=DriverManager.getConnection(dburl,dbuname,dbpass);//CONNECTION
              try
               {
                String un=request.getParameter("uname");
                                                             
                String q="select * from staff where name=? or phone=? or email=?";//THIS STATEMENT IS VERY IMP SINCE IT SELECTS EVERYTHING(*) FROM SIGN UP(NAME OF OUR DATABASE)
                //"WHERE" - HERE IT IS CONDITION THAT IS CHECKED IN THE DATABASE IF IT MATCHES 
                //executeUpdate works on insert,update or delete AND NOT ON SELECT SO WE USE RESULTSET(IT IS VERY SIMILAR TO ITERATOR)
                PreparedStatement myst=myconn.prepareStatement(q);//Creates a PreparedStatement object for sending parameterized SQL statements to the database.
                myst.setString(1,un);//THESE VALUES ARE INSERTED AT ?
                myst.setString(2,un);
                myst.setString(3,un);//un CAN BE ANYTHING SO ITS COMPARED AS UNAME,PHONE OR EMAIL AND IF ANY ONE MATCHES,,ITS TRUE

                
                ResultSet myres=myst.executeQuery();//RETURNS DATA PRODUCED BY THE QUERY AS A SET CALLED RESULTSET
                                                    
                if(myres.next()==true)//HERE IT CHECKS IF THERE IS NEXT LINE OR NOT,,EVEN IF THERE IS ONE LINE(IT IS IN CASE PRIMARY KEYWORD, SINCE IT IS UNIQUE e.g. username here, as there is unique username for everyone so there will be one line only)
                   //IT HAS INITIAL CURSOR BEFORE THE FIRST LINE                    
                 {
                    //IF SEARCH IS SUCCESSFUL WE SHOW THEIR INFORMATION USING myres.getString("column name") FUNCTION IN TABULAR FORM
                        out.print("<table class='table table-striped table-dark'> <tr> <th>Name<th/> " + "<td>" + myres.getString("name") + "<td/>" + "<tr/>");
                        out.print("<tr> <th>Phone No.<th/>" + "<td>" + myres.getString("phone") + "<td/>" + "<tr/>");
                        out.print("<tr> <th>Email<th/>" + "<td>" + myres.getString("email") + "<td/>" + "<tr/>");
                        out.print("<tr> <th>Type<th/>" + "<td>" + myres.getString("TYPE") + "<td/>" + "<tr/></table>");
                 }
                else
                 {
                  out.print("No records found.");
                 }
           }
                catch(Exception e)
                 {
                   out.print("Error occured " + e.getMessage());   
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
