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
        <title>Update Products</title>
        <%@include file="extfiles.jsp"%>
        
    </head>
    <body>
        <%@include file="adminheader.jsp"%>
  
<% 
    String prodname="", prodpic="",catid="",scatid="",r="",s="",d="",des=""; 
    try              
     {    //TAKING INFO FROM MANAGEprod TO BE USED DOWN WHILE UPDATING
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn =  DriverManager.getConnection(dburl, dbuname, dbpass);
            try
            {
                String prodid1=request.getParameter("pid");
                String q = "select * from manageprod where prodid=?";//CATID IS AUTO INCREMENTED IN OUR TABLE
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, prodid1);//SCID WE CALLED FROM LAST PAGE(managesubcat) TO GET ITS ALL INFO(OF SUBCAT)
                ResultSet myres = myst.executeQuery();//SO THAT WE CAN KNOW ON WHICH CATEGORY WE ARE WORKING
                if(myres.next())
                {
                    catid=myres.getString("catid");
                    scatid=myres.getString("subcatid");
                    prodname=myres.getString("name");
                    prodpic=myres.getString("prodpic");
                    r=myres.getString("rate");
                    s=myres.getString("stock");
                    d=myres.getString("discount");
                    des=myres.getString("description");
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
  <h2 class="heading text-center mb-sm-5 mb-4">Update Product </h2>
    <div class="row agileinfo_mail_grids">
     <div class="col-lg-8 agileinfo_mail_grid_right">
         <form method="post" enctype="multipart/form-data"><!HERE IT IS MULTIPART FORM SINCE FORM CONTAINS LARGE FILES WHICH ARE UPLOADED IN PARTS AND NOT DIRECTLY,OTHER TEXT FILES ARE VERY SMALL AND CAN BE UPLOADED AS ONE FILE>
	 <div class="row">
	  <div class="col-md-6 wthree_contact_left_grid pr-md-0">
	   <div class="form-group">
               <select name="cat" id="cat" class="form-control"
                       <option value="">Choose Category</option>
	     <%
                    
           try
             {
               Class.forName("com.mysql.jdbc.Driver");//CALLS DRIVER,,YOU HAVE TO ADD LIBRARY NAMED "MYSQL JDBC DRIVER" 
               Connection myconn=DriverManager.getConnection(dburl,dbuname,dbpass);
                try
                 {
                    String q="select * from managecat";//("IMPORTANT")SELECTS EVERY ROW FROM DATABASE AND ADDS IN RESULTSET SO WE CAN FETCH ONE BY ONE
                    PreparedStatement myst=myconn.prepareStatement(q);
                    ResultSet myres=myst.executeQuery();

                    if(myres.next()==true)//HERE IT CHECKS IF THERE IS NEXT LINE OR NOT,,EVEN IF THERE IS ONE LINE(IT IS IN CASE PRIMARY KEYWORD, SINCE IT IS UNIQUE e.g. username here, as there is unique username for everyone so there will be one line only)
                       //IT HAS INITIAL CURSOR BEFORE THE FIRST LINE                    
                     {
                            
                            do  //HERE DO WHILE LOOP IS USED,IF WE USE WHILE LOOP,ITERATOR GOES TO NEXT LINE TWICE AND FIRST LINE IS SKIPPED,BCOZ "myres.next()" has moved cursor once in if statement
                            {    //IMP- HERE NOW CURSOR IS AT FIRST LINE/ROW OF OUR DATABASE AND WE CAN CALL ANY COLUMN USNG myres.getString("column name");
                                if(myres.getString("catid").equals(catid))
                                {
                                out.print("<option selected value='"+myres.getString("catid")+"'>" + myres.getString("catname") + "</option>");                      
                                }//HERE CAT WILL BE ALREADY SELECTED IN COMBOBOX while updating
                                else
                                {
                                    out.print("<option value='"+myres.getString("catid")+"'>" + myres.getString("catname") + "</option>");                      
                                }
                            }
                            while(myres.next());
                            //TO PRINT ALL CATEGORIES!!
                            
                     }
                    else
                     {
                      out.print("No Records found.");
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
        
                         
                    
                    %>
               </select>
	</div>
               
                <div class="form-group">
               <select name="scat" id="scat" class="form-control"
                       <option value="">Choose Sub-Category</option>
	     <%
                    
           try
             {
               Class.forName("com.mysql.jdbc.Driver");//CALLS DRIVER,,YOU HAVE TO ADD LIBRARY NAMED "MYSQL JDBC DRIVER" 
               Connection myconn=DriverManager.getConnection(dburl,dbuname,dbpass);
                try
                 {
                   String uname=request.getParameter("un");
                    String q="select * from managesubcat";//("IMPORTANT")SELECTS EVERY ROW FROM DATABASE AND ADDS IN RESULTSET SO WE CAN FETCH ONE BY ONE
                    PreparedStatement myst=myconn.prepareStatement(q);
                    ResultSet myres=myst.executeQuery();

                    if(myres.next()==true)//HERE IT CHECKS IF THERE IS NEXT LINE OR NOT,,EVEN IF THERE IS ONE LINE(IT IS IN CASE PRIMARY KEYWORD, SINCE IT IS UNIQUE e.g. username here, as there is unique username for everyone so there will be one line only)
                       //IT HAS INITIAL CURSOR BEFORE THE FIRST LINE                    
                     {
                            
                            do  //HERE DO WHILE LOOP IS USED,IF WE USE WHILE LOOP,ITERATOR GOES TO NEXT LINE TWICE AND FIRST LINE IS SKIPPED,BCOZ "myres.next()" has moved cursor once in if statement
                            {    //IMP- HERE NOW CURSOR IS AT FIRST LINE/ROW OF OUR DATABASE AND WE CAN CALL ANY COLUMN USNG myres.getString("column name");
                                if(myres.getString("subcatid").equals(scatid))
                                {
                                out.print("<option selected value='"+myres.getString("subcatid")+"'>" + myres.getString("subcatname") + "</option>");                      
                                }//HERE SUBCAT WILL BE ALREADY SELECTED IN COMBOBOX while updating
                                else
                                {
                                    out.print("<option value='"+myres.getString("subcatid")+"'>" + myres.getString("subcatname") + "</option>");                      
                                }
                            }
                            while(myres.next());
                            //TO PRINT ALL CATEGORIES!!
                            
                     }
                    else
                     {
                      out.print("No Records found.");
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
        
                         
                    
                    %>
               </select>
	</div>
               
	<div class="form-group contact-forms">
            <input type="text" name="prodname" value="<%out.print(prodname);%>" class="form-control" placeholder="Product name">
        </div>
        <div class="form-group contact-forms">
            <input type="text" name="rate" value="<%out.print(r);%>" class="form-control" placeholder="Product name">
        </div>
        <div class="form-group contact-forms">
            <input type="text" name="stock" value="<%out.print(s);%>" class="form-control" placeholder="Product name">
        </div>
        <div class="form-group contact-forms">
            <input type="text" name="discount" value="<%out.print(d);%>" class="form-control" placeholder="Product name">
        </div>
        <div class="form-group contact-forms">
            <input type="text" name="description" value="<%out.print(des);%>" class="form-control" placeholder="Product name">
        </div>
        <%out.print("<img src='uploads/"+ prodpic + "' height='75'>");%><br/>
            Choose new image, if required<br/>
                <div class="form-group">
	<input type="file" name="prodpic" class="form-control">
	</div>
	<div class="col-md-12">
	<div class="submit-buttons">
            <br/>
	<input type="submit" name="s1" class="btn" value="Update">
	</div>
	</div>
	</div>
  <%        // THIS IS FILE UPLOADING 
         String pname="", imagename="",path="",cid="",scid="",r1="",s1="",d1="",des1="";
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
          
            if(itemName1.equals("cat")) //
            {
                cid=value;//         NO IMAGE NAME HERE AS THERE IS NO IMAGE IN TEXT
            }
            else if(itemName1.equals("scat"))
            {
                scid=value;
            }
            else if(itemName1.equals("prodname"))
            {
                pname=value;
            }
            else if(itemName1.equals("rate"))
            {
                r1=value;
            }
            else if(itemName1.equals("stock"))//here its name of field(<input type="text">)
            {
                s1=value;
            }
            else if(itemName1.equals("discount"))
            {
                d1=value;
            }
            else if(itemName1.equals("description"))
            {
                des1=value;
            }
        }
        else
        {
                String type=myitem.getContentType();//GETS CONTENT TYPE
                long size=myitem.getSize()/1024; //SINCE getSize GIVES SIZE IN BYTES, WE CONVERT IT TO KB BY USING /1024
                
                if(size==0)//IF WE ADD NOTHING, NO IMAGE GOES
                {
                    imagename=prodpic;  //IMPORTANT*********
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
                String q = "update manageprod set catid=?, subcatid=?, name=?, rate=?, stock=?, discount=?, description=?, prodpic=? where prodid=?";//PRODID IS AUTO INCREMENTED IN OUR TABLE
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, cid);
                myst.setString(2, scid);
                myst.setString(3, pname);
                myst.setString(4, r1);
                myst.setString(5, s1);
                myst.setString(6, d1);
                myst.setString(7, des1);
                myst.setString(8, imagename);
                myst.setString(9, request.getParameter("pid"));//SINCE PID WILL BE UPDATED ONLY
                int myres = myst.executeUpdate();
                if(myres>0)
                {
                    response.sendRedirect("manageprod.jsp");
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
