<%@page import="java.io.File"%> <!You have to update signup,manage subcat,manage prod,and checkavail,showsubcatajax>
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
        <title>Manage Products</title>
        <%@include file="extfiles.jsp"%>
    
    <script src="js/jquery.js"></script>
    <script>
        $(document).ready(function(){
            $("#cat").change(function(){
                var cid=$(this).val();
                $.ajax({
                    method:"POST",
                    url:"showsubcatajax.jsp",
                    beforeSend:function(){
                        $("#showloader").html("<img src='images/loader.gif'>");
                      },
                      data:{catid:cid}
                }).done(function(res){
                    $("#showloader").html("");
                    $("#subcat").html(res);
                });
            });
            $("#subcat").change(function(){
                var scid=$(this).val();
                $.ajax({
                    method:"POST",
                    url:"fetchprodajax.jsp",
                    beforeSend:function(){
                        $("#showloader").html("<img src='images/loader.gif'>");
                      },
                      data:{scid:scid}
                }).done(function(res){
                    $("#showloader").html("");
                    $("#proddiv").html(res);
                });
            });
             $('#proddiv').delegate(".dellink","click",function(e)
            {
                    e.preventDefault();
                    var pid=$(this).attr("id");
                    var pr1=$(this).parent();//td
                    var pr=$(this).parent().parent();//tr
                    if(confirm("Are you sure to delete?"))
                    {
                        $.ajax({
                                    url:'delprod.jsp',
                                    type:'post',
                                    data:{"pid":pid},
                                    beforeSend:function()
                                    {
                                        pr1.append("<img src='uploads/loader.gif'>")
                                    },
                                    success:function(reslt)
                                    {
                                        if($.trim(reslt)=="done")
                                        {
                                            pr.css({'backgroundColor':'#fb6c6c'});
                                            pr.fadeOut(600,function(){
                                                
                                             })
                                        }
                                        else
                                        {
                                            alert("Some problem occured");
                                        }
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
  <h2 class="heading text-center mb-sm-5 mb-4">Manage Products</h2>
    <div class="row agileinfo_mail_grids">
     <div class="col-lg-8 agileinfo_mail_grid_right">
         <form name="form1" method="post" enctype="multipart/form-data"><!HERE IT IS MULTIPART FORM SINCE FORM CONTAINS LARGE FILES WHICH ARE UPLOADED IN PARTS AND NOT DIRECTLY,OTHER TEXT FILES ARE VERY SMALL AND CAN BE UPLOADED AS ONE FILE>
	 
	<div>
            <select name="cat" id="cat" class="form-group">
                <option value="">Choose Category</option> <!IMPORTANT= USING JAVA CODE IN HTML SELECT BOX TO FETCH CATEGORIES IN SELECTBOX FROM OUR DATABASE >
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
                                out.print("<option value='"+myres.getString("catid")+"'>" + myres.getString("catname") + "</option>");                      
                            }//HERE HTML MUST BE IN DOUBLE QUOTES("") AND IN THERE '' MUST BE USED // HERE VALUE '' CONTAINS catid AND CATNAME IS PRINTED AS OPTION
                            while(myres.next());
                            //TO PRINT ALL CATEGORIES!!
                            
                     }
                    else
                     {
                      out.print("No Categories   found.");
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
                <div id="showloader"></div>
           <div class="form-group contact-forms">
            <select name="subcat" id="subcat" class="form-group">
                <option value="">Choose Sub Category</option>
               
            </select>
                
                <div class="row">
	  <div class="col-md-6 wthree_contact_left_grid pr-md-0">
	   <div class="form-group">
          <input type="text" name="prodname" class="form-control" placeholder="Product Name" required=""> <!HERE WE ENTER NAME >
            </div><!INPUTTING SUBCATEGORY NAME HERE AFTER THE SLECT BOX OF CATEGORIES>
              </div>
           </div>
               <div class="row">
	  <div class="col-md-6 wthree_contact_left_grid pr-md-0">
	   <div class="form-group">
          <input type="text" name="rate" class="form-control" placeholder="Product Rate" required=""> <!HERE WE ENTER NAME >
            </div><!INPUTTING SUBCATEGORY NAME HERE AFTER THE SLECT BOX OF CATEGORIES>
              </div>
           </div>
               <div class="row">
	  <div class="col-md-6 wthree_contact_left_grid pr-md-0">
	   <div class="form-group">
          <input type="text" name="stock" class="form-control" placeholder="Stock left" required=""> <!HERE WE ENTER NAME >
            </div><!INPUTTING SUBCATEGORY NAME HERE AFTER THE SLECT BOX OF CATEGORIES>
              </div>
           </div>
               <div class="row">
	  <div class="col-md-6 wthree_contact_left_grid pr-md-0">
	   <div class="form-group">
          <input type="text" name="discount" class="form-control" placeholder="Discount" required=""> <!HERE WE ENTER NAME >
            </div><!INPUTTING SUBCATEGORY NAME HERE AFTER THE SLECT BOX OF CATEGORIES>
              </div>
           </div>
               <div class="row">
	  <div class="col-md-6 wthree_contact_left_grid pr-md-0">
	   <div class="form-group">
          <input type="text" name="des" class="form-control" placeholder="Product Description" required=""> <!HERE WE ENTER NAME >
            </div><!INPUTTING SUBCATEGORY NAME HERE AFTER THE SLECT BOX OF CATEGORIES>
              </div>
           </div>
               
	    <div class="form-group">
                <div>
	<input type="file" name="prodpic" class="form-control">
	</div>
                </div>
             <div class="row"></div>
	<div class="col-md-12">
	<div class="submit-buttons">
            
	<input type="submit" name="s1" class="btn" value="Add">
	</div>
	</div> 
	</div> 
  <%  
         String pname="" , cid="", sid="" , rate="" , dis="" , stock="" , des="" , imagename="",path="";//THREE STRINGS ARE DECLARED(NAME,ID,IMAGENAME) 
           boolean successful=true;
           boolean isMultipart = ServletFileUpload.isMultipartContent(request);
              
    if(isMultipart)
    {
   
    FileItemFactory factory = new DiskFileItemFactory();
  
    ServletFileUpload upload = new ServletFileUpload(factory);
    List<FileItem> items = null;
    
   try
   {
        items = upload.parseRequest(request);
   }
   catch (FileUploadException e)
   {
       e.printStackTrace();
   }
 
   for(FileItem myitem:items)
   {
        if (myitem.isFormField())//EVERY ITEM EXCEPT FILE IS FORMFIELD
        {
            String itemName1 = myitem.getFieldName();//common.apache.org/proper/commons-fileupload>User Guide (IMPORTANT)
            String value=myitem.getString();
          
            if(itemName1.equals("cat")) //("IMPORTANT")IF "MYITEM" CONTAINS ID,,THEN ITEMNAME IS CAT(FROM SELECTBOX) AND THIS IF RUNS AND CID=VALUE OF ITEM THAT IS THE CATID THAT WE GAVE IN VALUE IN SELECTBOX 
            {
                cid=value;//HERE VALUE IS OF CAT THAT IS CATID
            }
            else if(itemName1.equals("subcat"))//THIS IS CASE OF SUBCATNAME WHICH WE ENTERED
            {
                sid=value;
            }
            else if(itemName1.equals("prodname"))//THIS IS CASE OF SUBCATNAME WHICH WE ENTERED
            {
                pname=value;
            }
            else if(itemName1.equals("rate"))//THIS IS CASE OF SUBCATNAME WHICH WE ENTERED
            {
                rate=value;
            }
            else if(itemName1.equals("discount"))//THIS IS CASE OF SUBCATNAME WHICH WE ENTERED
            {
                dis=value;
            }
            else if(itemName1.equals("stock"))//THIS IS CASE OF SUBCATNAME WHICH WE ENTERED
            {
                stock=value;
            }
            else if(itemName1.equals("des"))//THIS IS CASE OF SUBCATNAME WHICH WE ENTERED
            {
                des=value;
            }
        }//THESE CASES RUNNED FOR CATID AND SUBCATNAME 
        else//THIS CASE IS FOR THE FILE WE UPLOADED SINCE ITS NOT FORMFIELD(TEXT)
        {
                String type=myitem.getContentType();
                long size=myitem.getSize()/1024; 
                
                if(size==0)
                {
                    imagename="noimage.jpg";
                }
                else if((type.equals("image/pjpeg") || type.equals("image/jpeg")
                        || type.equals("image/png") || type.equals("image/x-png")
                        || type.equals("image/gif")))
                    {
                imagename=new java.util.Date().getTime()+myitem.getName();//IT ASSIGNS UNIQUE NAME TO IMAGE AS TIME IS UPDATED EVERY MILLISEC
                path=getServletContext().getRealPath("/") + "uploads\\" + imagename;//PATH WHERE IMAGE IS UPLOADED (YOU CAN SEE IMAGE IN BUILD > MYPROJ>UPLOADS)
                
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
                String q = "insert into manageprod(catid,subcatid,name,rate,stock,discount,description,prodpic) values(?,?,?,?,?,?,?,?)";
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, cid);//CID(OF CATEGORY) IS ALSO ENTERED SO THAT WE CAN KNOW THIS SUBCAT IS UNDER WHICH CAT 
                myst.setString(2, sid);
                myst.setString(3, pname);
                myst.setString(4, rate);
                myst.setString(5, stock);
                myst.setString(6, dis);
                myst.setString(7, des);
                myst.setString(8, imagename);
                int myres = myst.executeUpdate();
                if(myres>0)
                {
                    out.print("");
                }
                else
                {
                    out.print("Product not added successfully");
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
                                <div id="proddiv"></div>		
     </div>
		</div>
	</div>
	
</section>
<%@include file="footer.jsp"%>
    </body>
</html>
