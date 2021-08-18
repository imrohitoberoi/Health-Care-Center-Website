<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.*"%> <!THESE ARE COMMONS IO FILES>
<%@include file="dbvars.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Our Doctors</title>
        <%@include file="extfiles.jsp"%>
  </head>
  <body>
       <%@include file="header.jsp"%>
<section class="services py-5">
	<div class="container py-lg-5">
		<h3 class="heading text-center mb-5">Our Doctors</h3>
		<div class="row offer-grids">
<% try              
    
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn =  DriverManager.getConnection(dburl, dbuname, dbpass);
            try
            {
                String q = "select * from managesubcat where catid=?";//CATID IS AUTO INCREMENTED IN OUR TABLE
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, request.getParameter("catid"));
                ResultSet myres = myst.executeQuery();
                if(myres.next())
                {
                    do
                    {
                        out.print("<div class='col-lg-4 col-md-6'>"
                                + "<div class='ser1'>"
                                + "<div class='bg-layer'>"
                                + "<h4 class=''><a href='showdocd.jsp?subcatid=" + myres.getString("subcatid") +"'>"+ myres.getString("subcatname") +"</a></h4>"
                                        + "<a href='showdocd.jsp?subcatid=" + myres.getString("subcatid") +"'>" + "<img src='uploads/"+ myres.getString("subcatpic") +"'> "+"</a>"
                                + "</div></div></div>");
                                        
                    }while(myres.next());
                }
                else
                {
                    out.print("No records found");
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

</section>          
 <%@include file="footer.jsp"%>                    
       </body>             
</html>     
			
				
				
						
					
			