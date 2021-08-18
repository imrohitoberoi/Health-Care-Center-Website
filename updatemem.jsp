
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
        <title>Update </title>
        <%@include file="extfiles.jsp"%>
    </head>
    <body>
        <%@include file="adminheader.jsp"%>
        <% 
    String name="", phone="", email="", uname="", utype="", pass=""; 
    try              
    
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn =  DriverManager.getConnection(dburl, dbuname, dbpass);
            try
            {
                uname=request.getParameter("uname");   //NOTE IN NOTES : CAME FROM QUERY STRING
                String q = "select * from signup where username=?";//CATID IS AUTO INCREMENTED IN OUR TABLE
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, uname);//HERE CID IS CALLED FROM LAST PAGE USING ? AND IS FETCHED HERE USING REQUEST.GETPARAMETER
                ResultSet myres = myst.executeQuery();//SO THAT WE CAN KNOW ON WHICH CATEGORY WE ARE WORKING
                if(myres.next())
                {
                    name=myres.getString("name");
                    phone=myres.getString("phonenumber");
                    email=myres.getString("email");
                    utype=myres.getString("usertype");
                    pass=myres.getString("password");
                }
                else
                {
                    out.print("NO details found");
                }
            }
            catch(Exception e)
            {
                out.print("Error in query" + e.getMessage());
            }
            finally
            {
                myconn.close();
            }
        }   
        catch(Exception e)
        {
            out.print("Error in connection" + e.getMessage());
        }
   
%>

        `<!-- contact -->
<section class="mail pt-lg-5 pt-4">
 <div class="container pt-lg-5">
  <h2 class="heading text-center mb-sm-5 mb-4">Update </h2>
    <div class="row agileinfo_mail_grids">
     <div class="col-lg-8 agileinfo_mail_grid_right">
	<form action="#" method="post">
	 <div class="row">
	  <div class="col-md-6 wthree_contact_left_grid pr-md-0">
	   <div class="form-group">
	    <input type="text" name="name1" class="form-control" placeholder="Name" required="" value="<% out.print(name); %>"> <!HERE WE ENTER NAME >
	    </div>                                                                                        <!MUST BE NOTED>
	    <div class="form-group">
	<input type="email" name="email1" class="form-control" placeholder="Email" required="" value="<% out.print(email); %>">
	</div>
	</div>
	<div class="col-md-6 wthree_contact_left_grid">
	<div class="form-group">
	<input type="text" name="phone1" class="form-control" placeholder="Phone Number" required="" value="<% out.print(phone); %>">
	</div>
	
	</div>
	<div class="col-md-12">
	
            <div class="form-group">
	<input type="text" name="utype1" placeholder="Usertype" class="form-control" required="" value="<% out.print(utype); %>">
        </div>
	</div>
	<div class="col-md-12">
	<div class="submit-buttons">
	<input type="submit" name="s1" class="btn" value="Submit">
	</div>
	</div>
	</div>
  <%
     if(request.getParameter("s1")!=null)
      {
       try
         {
            Class.forName("com.mysql.jdbc.Driver");// THIS HELPS IN FINDING A SUITABLE DRIVER FOR OUR DATABASE 
            Connection myconn=DriverManager.getConnection(dburl,dbuname,dbpass);//CONNECTION HERE IS A CLASS,,USING DRIVER IN DBURL USING USERID AND PASS CONNECTION IS MADE
            try//TRY BLOCK IS VERY IMP SINCE WITHOUT THIS IF ERROR COMES,THE APPLCATION CRASHES
            {
                name=request.getParameter("name1");
                email=request.getParameter("email1");
                phone=request.getParameter("phone1");
                utype=request.getParameter("utype1");
             String q="update signup set name=?, email=?, phonenumber=?, usertype=? where username=?";//THIS IS QUERY I.E. IT GIVES WHICH FUNCTION TO DO IN OUR DATABASE,HERE IT "INSERTS"
            PreparedStatement myst=myconn.prepareStatement(q);//STATEMENT IIS PREPARED OF q THROUGH OUR CONNECTION AND STORED IN MYST
            myst.setString(1,name);//THIS PREPARED STATEMENT IS EMPTY,SO WE ADD STRINGS IN HERE,,,,HERE WE START FROM 1 AND NOT 0
            myst.setString(2,email);//THESE VALUES ARE INSERTED AT PLACE OF "?" IN OUR QUERY STATEMENT
            myst.setString(3,phone);
            myst.setString(4,utype);
            myst.setString(5,uname);
            
            int count=myst.executeUpdate();//GIVES HOW MANY RECORDS ARE UPDATED IN DATABASE,HERE IT'S "1"

             if(count==1)
              {
                response.sendRedirect("listofmembers.jsp");
              }
             else
              {
                out.print("Some error occured,try again.");
              }
                     }
              catch(Exception e)
               {
                 out.print("Error occured " + e.getMessage());   
               }
              finally
               {
                 myconn.close();//ITS VERY IMPORTANT TO CLOSE OUR CONNECTION ONCE STARTED AS IT MAKES OUR SYSTEM SLOW AND ITS DONE IN FINALLY SO IT SURELY CLOSES
               }
                      }
          catch(Exception e)
            {
              out.print("Connection failed - " + e.getMessage());   // THIS IS OUTER TRY CATCH AND IS RUNNED IF CONNECTION IS NOT MADE SINCE CONNECTION IS MADE OUTSIDE THE INNNER TRY BLOCK 
            }
                             }
                                              %>
				</form>  <!WE DO THIS ALL IN FORM > 
			</div>
		</div>
	</div>
	
</section>
<!-- //contact -->
 <%@include file="footer.jsp"%>
    </body>
</html>