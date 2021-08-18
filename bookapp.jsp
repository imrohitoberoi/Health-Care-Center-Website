<%@page import="java.sql.*"%>
<%@include file="dbvars.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!--IN THIS PAGE WE HAVE USED JQUERY FOR DATE PICKER, IF YOU WANT DIFFERENT CSS FOR THESE DATE PICKERS VISIT= jqueryui/datepicker-->


<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Appointment</title>
        <%@include file="extfiles.jsp"%>
        <script src="js/jquery.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
             $( function() {
    $( "#datepicker" ).datepicker({
         dateFormat: "yy-mm-dd"
    });
  } );
            </script>
            <script>
                
            $(document).ready(function(){
               
            $("#datepicker").blur(function(e){
                e.preventDefault();
                var date1=$("#datepicker").val();
                var doc1=$("#did").val();
                $.ajax({
                    method:"POST",
                    url:"fetchtimeajax.jsp",
                    beforeSend:function(){
                    
                      },
                      data:{date:date1,doc:doc1}
                }).done(function(res){
                     $("#time").html(res);
                });
            })
           
                 
            });
                </script>
    </head>
    <body>
        <%@include file="header.jsp"%>
        `<!-- contact -->
<section class="mail pt-lg-5 pt-4">
 <div class="container pt-lg-5">
  <h2 class="heading text-center mb-sm-5 mb-4">Book Appointment</h2>
    <div class="row agileinfo_mail_grids">
     <div class="col-lg-8 agileinfo_mail_grid_right">
	<form  method="post">
	 <div class="row">
	  <div class="col-md-6 wthree_contact_left_grid pr-md-0">
	   <div class="form-group">
               <input type="text" name="name" class="form-control" placeholder="Name" required="" value="<%out.print(request.getSession().getAttribute("name"));%>"> <!HERE WE ENTER NAME >
	    </div>
	    <div class="form-group">
	<input type="email" name="email" class="form-control" placeholder="Email" required="" value="<%out.print(request.getSession().getAttribute("email"));%>">
	</div>
	</div>
	<div class="col-md-6 wthree_contact_left_grid">
	<div class="form-group">
	<input type="text" name="phone" class="form-control" placeholder="Phone Number" required="" value="<%out.print(request.getSession().getAttribute("phone"));%>">
	</div>
	<div class="form-group">
	<input type="text" name="age" class="form-control" placeholder="Age" required="">
	</div>
	</div>
             <div class="col-md-12">
	<div class="form-group">
	<input type="text" name="address" class="form-control" placeholder="Address" required=""> 
	</div>
                 
	</div>
	<div class="col-md-12">
	<div class="form-group">
            Gender- &nbsp;&nbsp; <input type="radio" name="gender" value="male"> Male &nbsp; 
        <input type="radio" name="gender" value="female"> Female<br>
        </div>
	</div>
        <div class="col-md-12">
            <p>Date: <input type="text" id="datepicker" name="date"></p> 
            </br>
            
            
	</div>
        <input type="hidden" name="did" id="did" value="<% out.print(request.getParameter("doc"));%>">
             
        <div class="col-md-12">
	<div class="form-group">
               Choose Time Slot &nbsp;  <select name='time' class='form-group' id="time">
      
                <option value="">Choose Time</option>
               
               </select>
                  </div>
	             </div>
             
	<div class="col-md-12">
	<div class="submit-buttons">
	<input type="submit" name="s1" class="btn" value="Submit">
      
	</div>  </br>
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
            String n=request.getParameter("name");
            String phn=request.getParameter("phone");
            String em=request.getParameter("email");
            String add=request.getParameter("address");
            String age=request.getParameter("age");
            String gen=request.getParameter("gender");
            String date=request.getParameter("date");
            String sno=request.getParameter("time");
            String doc=request.getParameter("doc");
            
            String q="insert into appointment(sno,subcatid,name,phone,address,email,age,gender,date) value"
                    + "s(?,?,?,?,?,?,?,?,?)";//THIS IS QUERY I.E. IT GIVES WHICH FUNCTION TO DO IN OUR DATABASE,HERE IT "INSERTS"

            PreparedStatement myst=myconn.prepareStatement(q);//STATEMENT IIS PREPARED OF q THROUGH OUR CONNECTION AND STORED IN MYST
            myst.setString(1,sno);//THIS PREPARED STATEMENT IS EMPTY,SO WE ADD STRINGS IN HERE,,,,HERE WE START FROM 1 AND NOT 0
            myst.setString(2,doc);//THESE VALUES ARE INSERTED AT PLACE OF "?" IN OUR QUERY STATEMENT
            myst.setString(3,n);
            myst.setString(4,phn);
            myst.setString(5,add);
            myst.setString(6,em); //IT IS SIMILAR TO NORMAL SIGNUP, THE ONLY DIFFERENCE IS THAT HERE USERTYPE IS "admin" WHICH BRINGS US TO ADMIN HOME PAGE WHEN WE LOGIN
            myst.setString(7,age);
            myst.setString(8,gen);
            myst.setString(9,date);
            

            int count=myst.executeUpdate();//GIVES HOW MANY RECORDS ARE UPDATED IN DATABASE,HERE IT'S "1"

             if(count==1)
              {
                response.sendRedirect("appsuccess.jsp?doc="+doc+"&sno="+sno+"&date="+date+"");
                
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