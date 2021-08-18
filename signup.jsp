
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="dbvars.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Page</title>
        <%@include file="extfiles.jsp"%>
        <script src="js/jquery.js"></script>
        <script>
            $(document).ready(function()
            {
                $("#name").blur(function(){
                  var n=$("#name").val();
                  $.ajax({
                      method:"POST",
                      url:"showname.jsp",
                      beforeSend:function(){
                          $("#showmsg").html("<img src='images/loader.gif'>");
                      },
                      data:{pname:n}
                  }).done(function(msg){
                      $("#showmsg").html(msg);
                  });
                });
                $("#un").blur(function(){
                    var uname=$(this).val();
                    $.ajax(
                            {
                                method:"POST",
                                url:"checkavail.jsp",
                                beforeSend: function(){
                                    $("#showavail").html("<img src='images/loader.gif'>");
                                },
                                  data:{un:uname}//("IMPORTANT")here un is the variable used in another page and rhs is value to be send
                            }).done(function(msg){
                                $("#showavail").html(msg);
                            });
                });
            });
            </script>
    </head>
    <body>
        <%@include file="header.jsp"%>
        `<!-- contact -->
<section class="mail pt-lg-5 pt-4">
 <div class="container pt-lg-5">
  <h2 class="heading text-center mb-sm-5 mb-4">Sign Up </h2>
    <div class="row agileinfo_mail_grids">
     <div class="col-lg-8 agileinfo_mail_grid_right">
	<form method="post">
	 <div class="row">
	  <div class="col-md-6 wthree_contact_left_grid pr-md-0">
	   <div class="form-group">
	    <input type="text" name="name" id="name" class="form-control" placeholder="Name" required="">  <!HERE WE ENTER NAME >
                   <div id="showmsg"></div>
	    </div>
             
	    <div class="form-group">
	<input type="email" name="email" class="form-control" placeholder="Email" required="">
 
	</div>
              
	</div>
              
	<div class="col-md-6 wthree_contact_left_grid">
	<div class="form-group">
	<input type="text" name="phoneno" class="form-control" placeholder="Phone Number" required="">
	</div>
	<div class="form-group">
            <input type="text" name="uname" id="un" class="form-control" placeholder="Username" required=""> <!YOU CAN ALSO ADD RADIO BUTTONS FOR GENDER>
             <div id="showavail"></div>
        </div>
	</div>
            
	<div class="col-md-12">
	<div class="form-group">
	<input type="password" name="pass" placeholder="Password" class="form-control" required="">
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
            String n=request.getParameter("name");
            String phn=request.getParameter("phoneno");
            String em=request.getParameter("email");
            String un=request.getParameter("uname");
            String pass=request.getParameter("pass") + "@$$$#%%%%$#@$@$";
                                                    
            String q="insert into signup values(?,?,?,?,md5(?),?)";//THIS IS QUERY I.E. IT GIVES WHICH FUNCTION TO DO IN OUR DATABASE,HERE IT "INSERTS"

            PreparedStatement myst=myconn.prepareStatement(q);//STATEMENT IIS PREPARED OF q THROUGH OUR CONNECTION AND STORED IN MYST
            myst.setString(1,n);//THIS PREPARED STATEMENT IS EMPTY,SO WE ADD STRINGS IN HERE,,,,HERE WE START FROM 1 AND NOT 0
            myst.setString(2,phn);//THESE VALUES ARE INSERTED AT PLACE OF "?" IN OUR QUERY STATEMENT
            myst.setString(3,em);
            myst.setString(4,un);
            myst.setString(5,pass);
            myst.setString(6,"normal");//HERE USERTYPE IS ALWAYS ADDED AS "normal" IN CASE OF NORMAL SIGNUP OF PEOPLE

            int count=myst.executeUpdate();//GIVES HOW MANY RECORDS ARE UPDATED IN DATABASE,HERE IT'S "1"
                    //EXECUTEUPDATE USED IN CASE OF UPDATE,INSERT AND SELECT AND NOT IN CASE OF SELECT WHERE RESULTSET IS MADE
             if(count==1)
              {
                out.print("Signup Successful");//OR YOU CAN GO TO ANOTHER PAGE(thnx.jsp) USING response.sendRedirect() WHICH SAYS THANKS FOR SIGNING
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