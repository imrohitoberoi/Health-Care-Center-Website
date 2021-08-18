
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


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Confirmed</title>
        <%@include file="extfiles.jsp"%>
  </head>
  <body>
       <%@include file="header.jsp"%>
<section class="services py-5">
	<div class="container py-lg-5">
		<h3 class="heading text-center mb-5">Booking Confirmed</h3>
		<div class="row offer-grids">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your booking has been confirmed.
                Thank You!
                </div>
	
                <div class="container py-lg-2 ">
                    <%
                    String doc = request.getParameter("doc");
                    String sno = request.getParameter("sno");
                    String date = request.getParameter("date");
                    out.print("<a href=appdetail.jsp?doc=" + doc + "&sno=" + sno + "&date=" + date + ">For details of your appointment, click here</a>");
                    %>
                
                </div>  			
	</div>

</section>          
 <%@include file="footer.jsp"%>                    
       </body>             
</html>     
			
				
				
						
					
			