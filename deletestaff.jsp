<%@page import="java.sql.*"%>
<%@include file="dbvars.jsp" %>
<html>
    <head>   
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
        <%@include file="extfiles.jsp"%>
    </head>
    <body>
        <%@include file="adminheader.jsp"%>
        `<!-- contact -->
<section class="mail pt-lg-5 pt-4">
 <div class="container pt-lg-5">
  <h2 class="heading text-center mb-sm-5 mb-4">Delete</h2>
    <div class="row agileinfo_mail_grids">
     <div class="col-lg-8 agileinfo_mail_grid_right">
	<form action="#" method="post">
	 <div class="row">
	  <div class="col-md-6 wthree_contact_left_grid pr-md-0">
	   <div class="form-group">
	    Are you sure you want to delete?
	    </div>
	    	</div>
	<div class="col-md-12">
	<div class="submit-buttons">
	<input type="submit" name="s1" class="btn" value="Yes">

	<input type="submit" name="s2" class="btn" value="No">
	</div>
	</div>
          
	</div>
<% 
    if(request.getParameter("s1")!=null)
    {
    try              
    
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn =  DriverManager.getConnection(dburl, dbuname, dbpass);
            try
            {
                String q = "delete from staff where Sno=?";//CATID IS AUTO INCREMENTED IN OUR TABLE
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, request.getParameter("sno"));
                int count=myst.executeUpdate();
                if(count==1)
                {
                   response.sendRedirect("listofstaff.jsp");
                }
                else
                {
                    out.print("Deletion Unsuccessful");
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
    }
    else if(request.getParameter("s2")!=null)
    {
        response.sendRedirect("listofstaff.jsp");
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