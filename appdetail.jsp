<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.sql.*"%><!THESE ARE COMMONS IO FILES>
<%@include file="dbvars.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!--THIS PAGE IS FOR SPECIALISATION-->


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appointment Details</title>
        <%@include file="extfiles.jsp"%>
        
    </head>
    <body>
        <%@include file="header.jsp"%>
        `<!-- contact -->
<section class="mail pt-lg-5 pt-4">
 <div class="container pt-lg-5">
  <h2 class="heading text-center mb-sm-5 mb-4">Appointment Details</h2>
    <div class="row agileinfo_mail_grids">
     <div class="col-lg-8 agileinfo_mail_grid_right">
        
	
  <%   
         
   
   
        try              
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn =  DriverManager.getConnection(dburl, dbuname, dbpass);
            try
            {
                String q = "select * from appointment where SubcatID=? and sno=? and date=?";//CATID IS AUTO INCREMENTED IN OUR TABLE
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, request.getParameter("doc"));
                myst.setString(2, request.getParameter("sno"));
                myst.setString(3, request.getParameter("date"));
               ResultSet myres = myst.executeQuery();
                if(myres.next())
                {
                    out.print("Booking for Name=" + myres.getString("name")+" is confirmed on Date-"+myres.getString("date")+"");
                }
                else
                {
                    out.print("No booking available");
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
				
			</div>
            
            
		</div>
	</div>
	
</section>

 <%@include file="footer.jsp"%>
    </body>
</html>
