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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Category</title>
        <%@include file="extfiles.jsp"%>
        
    </head>
    <body>
        <%@include file="adminheader.jsp"%>
<% 
    String catname="", catpic=""; 
    try              
    
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn =  DriverManager.getConnection(dburl, dbuname, dbpass);
            try
            {
                String q = "select * from managecat where catid=?";//CATID IS AUTO INCREMENTED IN OUR TABLE
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, request.getParameter("cid"));//HERE CID IS CALLED FROM LAST PAGE USING ? AND IS FETCHED HERE USING REQUEST.GETPARAMETER
                ResultSet myres = myst.executeQuery();//SO THAT WE CAN KNOW ON WHICH CATEGORY WE ARE WORKING
                if(myres.next())
                {
                    catname=myres.getString("catname");
                    catpic=myres.getString("catpic");
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
  <h2 class="heading text-center mb-sm-5 mb-4">Update Category </h2>
    <div class="row agileinfo_mail_grids">
     <div class="col-lg-8 agileinfo_mail_grid_right">
         <form method="post" enctype="multipart/form-data"><!HERE IT IS MULTIPART FORM SINCE FORM CONTAINS LARGE FILES WHICH ARE UPLOADED IN PARTS AND NOT DIRECTLY,OTHER TEXT FILES ARE VERY SMALL AND CAN BE UPLOADED AS ONE FILE>
	 <div class="row">
	  <div class="col-md-6 wthree_contact_left_grid pr-md-0">
	   <div class="form-group">
	    <input type="text" name="catname" class="form-control" placeholder="Category Name" value="<% out.print(catname); %>"> <!HERE WE ENTER NAME >
	    </div><br/>
            <% out.print("<img src='uploads/" + catpic + "' height='75'>"); %><br/>
            Choose new image, if required<br/>
	    <div class="form-group">
	<input type="file" name="catpic" class="form-control">
	</div>
	</div>
	
	<div class="col-md-12">
	<div class="submit-buttons">
            <br/>
	<input type="submit" name="s1" class="btn" value="Update">
	</div>
	</div>
	</div>
  <%        // THIS IS FILE UPLOADING 
         String cname="", imagename="",path="";//TWO STRINGS ARE DECLARED 
           boolean successful=true;
           boolean isMultipart = ServletFileUpload.isMultipartContent(request);//CHECKS IF FILE UPLOAD IS HAVING MULTIPART CONTENT
              
    if(isMultipart)//GIVES BOOLEAN
    {
   
    FileItemFactory factory = new DiskFileItemFactory();//SENDING ITEMS FROM DISK TO FACTORY
  
    ServletFileUpload upload = new ServletFileUpload(factory);// Create a new file upload handler(SERVLETFILEUPLOAD)
    List<FileItem> items = null;//DECLARING LIST
    
   try
   {
        items = upload.parseRequest(request);//UPLOADS EVERYTHING IN OUR LIST="ITEMS"
   }
   catch (FileUploadException e)
   {
       e.printStackTrace();
   }
 
   for(FileItem myitem:items)//FOR EACH LOOP
   {
        if (myitem.isFormField())//EVERY ITEM EXCEPT FILE IS FORMFIELD
        {
            String itemName1 = myitem.getFieldName();//""common.apache.org/proper/commons-fileupload>User Guide (IMPORTANT)""
            //getFieldName GIVES "NAME" ON WHICH CURRENT ITEM IS STORED SO THAT WE CAN PUT IT IN RESPECTIVE If Else. 
            String value=myitem.getString();//TAKES VALUE IN THE FORM OF STRING
          
            if(itemName1.equals("catname")) //
            {
                cname=value;//         NO IMAGE NAME HERE AS THERE IS NO IMAGE IN TEXT
            }
        }
        else
        {
                String type=myitem.getContentType();//GETS CONTENT TYPE
                long size=myitem.getSize()/1024; //SINCE getSize GIVES SIZE IN BYTES, WE CONVERT IT TO KB BY USING /1024
                
                if(size==0)//IF WE ADD NOTHING, NO IMAGE GOES
                {
                    imagename=catpic;  //IMPORTANT*********
                }
                else if((type.equals("image/pjpeg") || type.equals("image/jpeg")
                        || type.equals("image/png") || type.equals("image/x-png")
                        || type.equals("image/gif")))
                    {
                imagename=new java.util.Date().getTime()+myitem.getName();//IT ASSIGNS UNIQUE NAME TO IMAGE AS TIME IS UPDATED EVERY MILLISEC
                path=getServletContext().getRealPath("/") + "uploads\\" + imagename;//PATH WHERE IMAGE IS UPLOADED (YOU CAN SEE IMAGE IN BUILD > MYPROJ>UPLOADS)
                
                File savefile=new File(path);//MAKING FILE OF OUR PATH
                myitem.write(savefile);    
                }
                else
                {
                    successful=false;
                    out.println("Only pictures are allowed");
                }    
        }
   
  }
   if(successful==true)
   {
        try              
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn =  DriverManager.getConnection(dburl, dbuname, dbpass);
            try
            {
                String q = "update managecat set catname=?, catpic=? where catid=?";//CATID IS AUTO INCREMENTED IN OUR TABLE
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, cname);
                myst.setString(2, imagename);
                myst.setString(3, request.getParameter("cid"));
                int myres = myst.executeUpdate();
                if(myres>0)
                {
                    response.sendRedirect("managecat.jsp");
                }
                else
                {
                    out.print("Category not updated successfully");
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
