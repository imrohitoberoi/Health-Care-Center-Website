
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="dbvars.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update </title>
        <%@include file="extfiles.jsp"%>
    </head>
    <body>
        <%@include file="adminheader.jsp"%>
        <% 
    String name="", phone="", email="", sno="", type="", qual="", add="", gen=""; 
    try              
    
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn =  DriverManager.getConnection(dburl, dbuname, dbpass);
            try
            {
                sno=request.getParameter("sno");
                String q = "select * from staff where Sno=?";//CATID IS AUTO INCREMENTED IN OUR TABLE
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, sno);//HERE CID IS CALLED FROM LAST PAGE USING ? AND IS FETCHED HERE USING REQUEST.GETPARAMETER
                ResultSet myres = myst.executeQuery();//SO THAT WE CAN KNOW ON WHICH CATEGORY WE ARE WORKING
                if(myres.next())
                {
                    name=myres.getString("name");
                    phone=myres.getString("phone");
                    email=myres.getString("email");
                    type=myres.getString("type");
                    qual=myres.getString("qualification");
                    gen=myres.getString("gender");
                    add=myres.getString("address");
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
  <h2 class="heading text-center mb-sm-5 mb-4">Update Staff</h2>
    <div class="row agileinfo_mail_grids">
     <div class="col-lg-8 agileinfo_mail_grid_right">
	<form action="#" method="post">
	 <div class="row">
	  <div class="col-md-6 wthree_contact_left_grid pr-md-0">
	   <div class="form-group">
	    <input type="text" name="name" class="form-control" placeholder="Name" required="" value="<% out.print(name); %>"> <!HERE WE ENTER NAME >
	    </div>
	    <div class="form-group">
	<input type="email" name="email" class="form-control" placeholder="Email" required="" value="<% out.print(email); %>">
	</div>
	</div>
	<div class="col-md-6 wthree_contact_left_grid">
	<div class="form-group">
	<input type="text" name="phoneno" class="form-control" placeholder="Phone Number" required="" value="<% out.print(phone); %>">
	</div>
	<div class="form-group">
	<input type="text" name="qualification" class="form-control" placeholder="Qualification" required="" value="<% out.print(qual); %>">
	</div>
	</div>
             <div class="col-md-6 wthree_contact_left_grid">
	<div class="form-group">
	<input type="text" name="address" class="form-control" placeholder="Address" required="" value="<% out.print(add); %>"> <!YOU CAN ALSO ADD RADIO BUTTONS FOR GENDER>
	</div>
                 
	</div>
	<div class="col-md-12">
	<div class="form-group">               
            Gender- &nbsp;&nbsp; 
            <%
                if(gen.equalsIgnoreCase("male")) //////NOTE
                {
                %><input type="radio" name="gender" value="male" checked="checked"> Male &nbsp; 
                <input type="radio" name="gender" value="female"> Female<br><%
                    }
                else
                {
                    %><input type="radio" name="gender" value="male"> Male &nbsp; 
                    <input type="radio" name="gender" value="female" checked="checked"> Female<br><%
                }
                %>
        </div>
	</div>
        <div class="col-md-12">
	<div class="form-group">
Staff Type&nbsp; <select name="type">
    <% 
        if(type.equalsIgnoreCase("nurse"))
        {
                %><option value="">Choose</option>
                <option value="Nurse" selected>Nurse</option>
                <option value="Therapists">Therapists</option>
                <option value="Technicians">Technicians</option>
                <option value="Janitorial">Janitorial</option><%
        }
        else if(type.equalsIgnoreCase("janitorial"))
        {
                    %><option value="">Choose</option>
                <option value="Nurse">Nurse</option>
                <option value="Therapists">Therapists</option>
                <option value="Technicians">Technicians</option>
                <option value="Janitorial" selected>Janitorial</option><%
        }
        else if(type.equalsIgnoreCase("therapists"))
        {
                    %><option value="">Choose</option>
                <option value="Nurse">Nurse</option>
                <option value="Therapists" selected>Therapists</option>
                <option value="Technicians">Technicians</option>
                <option value="Janitorial">Janitorial</option><%
        }
        else if(type.equalsIgnoreCase("technicians"))
        {
                    %><option value="">Choose</option>
                <option value="Nurse">Nurse</option>
                <option value="Therapists">Therapists</option>
                <option value="Technicians" selected>Technicians</option>
                <option value="Janitorial">Janitorial</option><%
        }%>
              </select>
        </div>
	</div>     
             <div class="col-md-6 wthree_contact_left_grid">
	
	
	</div>
	<div class="col-md-12">
	<div class="submit-buttons">
	<input type="submit" name="s1" class="btn" value="Update">
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
                name=request.getParameter("name");
                email=request.getParameter("email");
                phone=request.getParameter("phoneno");
                type=request.getParameter("type");
                qual=request.getParameter("qualification");
                add=request.getParameter("address");
                gen=request.getParameter("gender");
             String q="update staff set name=?, email=?, phone=?, gender=?, qualification=?, address=?, type=? where sno=?";//THIS IS QUERY I.E. IT GIVES WHICH FUNCTION TO DO IN OUR DATABASE,HERE IT "INSERTS"
            PreparedStatement myst=myconn.prepareStatement(q);//STATEMENT IIS PREPARED OF q THROUGH OUR CONNECTION AND STORED IN MYST
            myst.setString(1,name);//THIS PREPARED STATEMENT IS EMPTY,SO WE ADD STRINGS IN HERE,,,,HERE WE START FROM 1 AND NOT 0
            myst.setString(2,email);//THESE VALUES ARE INSERTED AT PLACE OF "?" IN OUR QUERY STATEMENT
            myst.setString(3,phone);
            myst.setString(4,gen);
            myst.setString(5,qual);
            myst.setString(6,add);
            myst.setString(7,type);
            myst.setString(8,sno);
            
            int count=myst.executeUpdate();//GIVES HOW MANY RECORDS ARE UPDATED IN DATABASE,HERE IT'S "1"

             if(count==1)
              {
                response.sendRedirect("listofstaff.jsp");
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