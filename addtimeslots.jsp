
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="dbvars.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Time Slots</title>
        <%@include file="extfiles.jsp"%>
    </head>
    <body>
        <%@include file="adminheader.jsp"%>
        `<!-- contact -->
<section class="mail pt-lg-5 pt-4">
 <div class="container pt-lg-5">
  <h2 class="heading text-center mb-sm-5 mb-4">Add Time Slots</h2>
    <div class="row agileinfo_mail_grids">
     <div class="col-lg-8 agileinfo_mail_grid_right">
	<form action="#" method="post">
	 <div class="row">
	  <div class="col-md-6 wthree_contact_left_grid pr-md-0">
	   <div class="form-group">
	    <input type="text" name="slot" class="form-control" placeholder="Time Slot" required=""> <!HERE WE ENTER NAME >
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
            String t=request.getParameter("slot");
            
                                                    
            String q="insert into timeslot(time) values(?)";//THIS IS QUERY I.E. IT GIVES WHICH FUNCTION TO DO IN OUR DATABASE,HERE IT "INSERTS"

            PreparedStatement myst=myconn.prepareStatement(q);//STATEMENT IIS PREPARED OF q THROUGH OUR CONNECTION AND STORED IN MYST
            myst.setString(1,t);//THIS PREPARED STATEMENT IS EMPTY,SO WE ADD STRINGS IN HERE,,,,HERE WE START FROM 1 AND NOT 0
            
            int count=myst.executeUpdate();//GIVES HOW MANY RECORDS ARE UPDATED IN DATABASE,HERE IT'S "1"

             if(count==1)
              {
                out.print("Entry Successful");//OR YOU CAN GO TO ANOTHER PAGE(thnx.jsp) USING response.sendRedirect() WHICH SAYS THANKS FOR SIGNING
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