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


<!--THIS PAGE IS FOR SPECIALIZATION-->


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Specialization</title>
        <%@include file="extfiles.jsp"%>
        <script src="js/jquery.js"></script>
        <script>
            $(document).ready(function(){
                $('.dellink').click(function(e){
                    e.preventDefault();
                    var cid=$(this).attr("id");
                    var pr1=$(this).parent();//td
                    var pr=$(this).parent().parent();//tr
                    if(confirm("Are you sure to delete?"))
                    {
                        $.ajax(
                                {
                                    url:'delcat.jsp',
                                    type:'post',
                                    data:{"catid":cid},
                                    beforeSend:function()
                                    {
                                        pr1.append("<img src='uploads/loader.gif'>");
                                    },
                                    success:function(reslt)
                                    {
                                      pr.css({'backgroundColor':'#fb6c6c'});
                                      pr.fadeOut(600,function(){   });
                                    },
                                    error:function(e)
                                    {
                                        alert("Error in Ajax");
                                    }
                                });
                    }
                });
            });
            </script>
    </head>
    <body>
        <%@include file="adminheader.jsp"%>
        `<!-- contact -->
<section class="mail pt-lg-5 pt-4">
 <div class="container pt-lg-5">
  <h2 class="heading text-center mb-sm-5 mb-4">Manage Specialization</h2>
    <div class="row agileinfo_mail_grids">
     <div class="col-lg-8 agileinfo_mail_grid_right">
         <form action="#" method="post" enctype="multipart/form-data"><!HERE IT IS MULTIPART FORM SINCE FORM CONTAINS LARGE FILES WHICH ARE UPLOADED IN PARTS AND NOT DIRECTLY,OTHER TEXT FILES ARE VERY SMALL AND CAN BE UPLOADED AS ONE FILE>
	 <div class="row">
	  <div class="col-md-6 wthree_contact_left_grid pr-md-0">
	   <div class="form-group">
	    <input type="text" name="catname" class="form-control" placeholder="Specialization Name" required=""> <!HERE WE ENTER NAME >
	    </div>
	    <div class="form-group">
	<input type="file" name="catpic" class="form-control">
	</div>
	</div>
	
	<div class="col-md-12">
	<div class="submit-buttons">
            <br/>
	<input type="submit" name="s1" class="btn" value="Add"><br/><br/>
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
                cname=value;  //NO IMAGE NAME HERE AS THERE IS NO IMAGE IN TEXT
            }
        }
        else
        {
                String type=myitem.getContentType();//GETS CONTENT TYPE
                long size=myitem.getSize()/1024; //SINCE getSize GIVES SIZE IN BYTES, WE CONVERT IT TO KB BY USING /1024
                
                if(size==0)//IF WE ADD NOTHING, NO IMAGE GOES
                {
                    imagename="noimage.jpg";
                }
                else if((type.equals("image/pjpeg") || type.equals("image/jpeg")
                        || type.equals("image/png") || type.equals("image/x-png")
                        || type.equals("image/gif")))
                {
                        imagename=new java.util.Date().getTime()+myitem.getName();
                        path=getServletContext().getRealPath("/") + "uploads\\" + imagename;

                        File savefile=new File(path);
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
                String q = "insert into managecat(catname,catpic) values(?,?)";//CATID IS AUTO INCREMENTED IN OUR TABLE
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, cname);
                myst.setString(2, imagename);
                int myres = myst.executeUpdate();
                if(myres>0)
                {
                    out.print("Specialization added successfully");
                }
                else
                {
                    out.print("Specialization not added successfully");
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
            <h2>Already added Specialization</h2>
            
<% try              
    
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn =  DriverManager.getConnection(dburl, dbuname, dbpass);
            try
            {
                String q = "select * from managecat";//CATID IS AUTO INCREMENTED IN OUR TABLE
                PreparedStatement myst = myconn.prepareStatement(q);
                ResultSet myres = myst.executeQuery();
                if(myres.next())
                {
                    out.print("<table class='table table-striped'>"+
                            "<tr>"
                            + "<th>Picture</th>"
                            + "<th>Name</th>"
                            + "<th>Update</th><th>Delete</th></tr>");
                    do
                    {
                        out.print("<tr>"
                                + "<td><img src='uploads/" + myres.getString("catpic") +"' height='75'></td>"
                                        + "<td>"+ myres.getString("catname") + "</td>"
                                                + "<td><a href='updatecat.jsp?cid=" + myres.getString("catid") + "' style='color:black'>Update</a></td>"
                                                        + "<td><a class='dellink' href='' id=" + myres.getString("catid") + " style='color:black'>Delete</a></td>");
                                                        //HERE QUERY VARIABLES ARE DIFF. BUT THEY BOTH SEND CATID TO UPDATE AMND DELETE PAGE(cid,catid)
                    }while(myres.next());
                    out.print("</table>");
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
