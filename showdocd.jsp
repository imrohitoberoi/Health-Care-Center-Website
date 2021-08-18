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
        <title>Doctor Details</title>
        <style>
.button {
  display: inline-block;
  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 24px;
  padding: 20px;
  width: 200px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
</style>
        <%@include file="extfiles.jsp"%>
  </head>
  <body>
       <%@include file="header.jsp"%>
<section class="services py-5">
	<div class="container py-lg-5">
		<h1 class="heading text-center mb-5">Doctor Details</h1>
		<div class="row offer-grids">
<% try              
    
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn =  DriverManager.getConnection(dburl, dbuname, dbpass);
            try
            {
                String q = "select Subcatname,Qual,Subcatpic,Catname,SubcatID from managesubcat,managecat"
                        + " where subcatid=? and managesubcat.CatID=managecat.CatID";//CATID IS AUTO INCREMENTED IN OUR TABLE
                PreparedStatement myst = myconn.prepareStatement(q);  //We made this query to get CatName which is only present in managecat
                myst.setString(1, request.getParameter("subcatid"));
                ResultSet myres = myst.executeQuery();
                if(myres.next())
                {
                        out.print("<section class='about-bottom pb-5'>"
                                + "<div class='container pb-lg-3'>"
                                + "<div class='row bottom-grids'>"
                                + "<div class='col-lg-6'>"
                                + "	<img src='uploads/" + myres.getString("subcatpic") +"' class='img-fluid' alt='' />"
                                + "</div>"
                                + "<div class='col-lg-6 mt-lg-0 mt-5'>"
                                + "<h3>"+myres.getString("subcatname") +"</h3>"
                                        + "<h4>"+myres.getString("qual") +" ("+myres.getString("Catname")+")</h4>"
                                        + "<p class='py-3'>Our all doctors are specialist registered in Medical Council of India with more than 12+ experience in medical field. Many have practised in countries like UK, USA.</p>"
                                        + "<p class=''>For checkup, book appointment Now</p>"
                                        + "<a href='bookapp.jsp?doc="+myres.getString("subcatid")+"'><button class='button' style='vertical-align:middle'><span>Book Appointment</button></a>"
                                        + "</div></div></div></section>");
                                
                                        
                    
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

