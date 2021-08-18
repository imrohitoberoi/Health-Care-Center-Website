<%@page import="org.json.JSONObject"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="dbvars.jsp" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <%@include file="extfiles.jsp"%>
        <script src="js/jquery.js"></script>
        <script src="jars/admin_15_46_01_2017_09_23_recaptcha4j-0.0.7"></script>
        <script src='https://www.google.com/recaptcha/api.js'></script>
        <script>
            $(document).ready(function()
            {
                $('#form1').submit(function(e)
                {
                    e.preventDefault();
                    $.ajax({
                        type:'post',
                        url:'loginajax.jsp',
                        data:$("#form1").serialize(),
                        success:function(reslt){
                            if($.trim(reslt)=="admin")
                            {
                                window.location="adminhome.jsp";
                            }
                            else if($.trim(reslt)=="incorrect")
                            {
                                $('#msgdiv').html("Incorrect Username/Password");
                            }
                            else if($.trim(reslt)=="normal")
                            {
                                window.location="index.jsp";
                            }
                            else if($.trim(reslt)=="human")
                            {
                                $('#msgdiv').html("Confirm you are human");
                            }
                        },
                        error:function(e)
                        {
                            $('#msgdiv').html("error in ajax");
                        }                   
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
<h2 class="heading text-center mb-sm-5 mb-4">Login </h2>
<div class="row agileinfo_mail_grids">
<div class="col-lg-8 agileinfo_mail_grid_right">
	<form name="form1" id="form1" method="post">
	<div class="row">
<div class="col-md-12">	
	<div class="form-group">
		<input type="text" name="uname" class="form-control" placeholder="Username or Phone no. or Email id" required="">
		</div>
		</div>
	<div class="col-md-12">
	<div class="form-group">
          <input type="password" name="pass" placeholder="Password" class="form-control" required="">
           </div>
		</div>
            
            <div class="col-md-12">
                <div class="g-recaptcha" data-sitekey="6LemR7UUAAAAAOW91oD2DwFUgqfy6CejNuGqtDVQ"></div>
                </br>
		</div>
            
            
	<div class="col-md-12">
	<div class="submit-buttons">
		<input type="submit" name="s1" class="btn" value="Submit">
                <div id="msgdiv"></div>
		</div>
		</div>
		</div>
    <%  //THIS WHOLE CODE ONWARDS WILL NOT WORK SINCE WE ARE USING AJAX FOR LOGIN PAGE,IF NO AJAX, USE THIS CODE
       if(request.getParameter("s1")!=null)
         {
             try {
                String url = "https://www.google.com/recaptcha/api/siteverify?"
                + "secret=6LemR7UUAAAAAO1OdIOQyx-4_7gEsDoaENkiel-A"
                + "&response=" + request.getParameter("g-recaptcha-response");
                InputStream res = new URL(url).openStream();
                BufferedReader rd = new BufferedReader(new InputStreamReader(res, Charset.forName("UTF-8")));

                StringBuilder sb = new StringBuilder();
                int cp;
                while ((cp = rd.read()) != -1) {
                sb.append((char) cp);
                }
                String jsonText = sb.toString();
                res.close();

                JSONObject json = new JSONObject(jsonText);
                if(json.getBoolean("success")==true)
                {
                        out.print(jsonText);
//               String un=request.getParameter("uname");
//                String pass=request.getParameter("pass") + "@$$$#%%%%$#@$@$";
//           try
//             {  //FIRSTLY CONNECTION MUST BE MADE TO CHECK IF THIS UNAME AND PASS EXISTS IN DATABASE
//               Class.forName("com.mysql.jdbc.Driver");//CALLS DRIVER,,YOU HAVE TO ADD LIBRARY NAMED "MYSQL JDBC DRIVER" 
//               Connection myconn=DriverManager.getConnection(dburl,dbuname,dbpass);//CONNECTION
//              try
//               {
//                //HERE THE ADDED STRING MUST BE SAME IN LOGIN PAGE OR ANY OTHER PAGE WHERE YOU WANT TO LOG IN 
//                                              
//                String q="select * from signup where (username=? or phonenumber=? or email=?) and password=md5(?)";//THIS STATEMENT IS VERY IMP SINCE IT SELECTS EVERYTHING(*) FROM SIGN UP(NAME OF OUR DATABASE)
//                //"WHERE" - HERE IT IS CONDITION THAT IS CHECKED IN THE DATABASE IF IT MATCHES 
//                //executeUpdate works on insert,update or delete AND NOT ON SELECT SO WE USE RESULTSET(IT IS VERY SIMILAR TO ITERATOR)
//                PreparedStatement myst=myconn.prepareStatement(q);//Creates a PreparedStatement object for sending parameterized SQL statements to the database.
//                myst.setString(1,un);//THESE VALUES ARE INSERTED AT ?
//                myst.setString(2,un);
//                myst.setString(3,un);//un CAN BE ANYTHING SO ITS COMPARED AS UNAME,PHONE OR EMAIL AND IF ANY ONE MATCHES,,ITS TRUE
//                myst.setString(4,pass);//Sets the designated parameter to the given Java String value
//
//                ResultSet myres=myst.executeQuery();//RETURNS DATA PRODUCED BY THE QUERY AS A SET CALLED RESULTSET
//                                                    
//                if(myres.next()==true)//HERE IT CHECKS IF THERE IS NEXT LINE OR NOT,,EVEN IF THERE IS ONE LINE(IT IS IN CASE PRIMARY KEYWORD, SINCE IT IS UNIQUE e.g. username here, as there is unique username for everyone so there will be one line only)
//                   //IT HAS INITIAL CURSOR BEFORE THE FIRST LINE                    
//                 {
//                    request.getSession().setAttribute("name", myres.getString("name"));//IF LOGIN SUCCESSFUL THEN IT TAKES ALL COLUMNS FROM DATABASE AND DECLARE THEIR VALUES IN "SESSION VARIABLES" SO THEY CAN BE USED EVERYWHERE
//                    request.getSession().setAttribute("phone", myres.getString("phonenumber"));
//                    request.getSession().setAttribute("uname", myres.getString("username"));//""IMPORTANT""-SINCE myres NOW CONTAIN ALL COLUMS OF SELECTED USER SO WE CAN CALL ALL ITS VALUES USING myres.getString("column name/index") 
//                    request.getSession().setAttribute("email", myres.getString("email"));
//                    if(myres.getString("usertype").equalsIgnoreCase("admin"))// WE CAN GET CONTENT OF ANY COLUMN IN OUR TABLE BY USING myres.getString("column name/column index")
//                    {
//                        response.sendRedirect("adminhome.jsp");// HERE IF ITS "ADMIN",,ADMINHOME.JSP IS OPENED
//                    }
//                    
//                    else//OTHERWISE IT SENDS TO PAGE FOR NORMAL PEOPLE
//                    {
//                     response.sendRedirect("index.jsp");//sends us to another page if login successful
//                     }
//                 }
//                else
//                 {
//                  out.print("Incorrect username or password.");
//                 }
//           }
//                catch(Exception e)
//                 {
//                   out.print("Error occured " + e.getMessage());   
//                 }
//                finally
//                 {
//                   myconn.close();
//                 }
//           }
//          catch(Exception e)
//          {
//           out.print("Connection failed - " + e.getMessage());   
//           }
                }
                 else
                    {
                    out.print("Confirm you are human");
                    }
             }
                catch(Exception e)
                        {
                             out.print("Error in recaptcha" + e.getMessage());   
                        }
         } 
                          %>
				</form>
			</div>
		</div>
	</div>
	
</section>
<!-- //contact -->

        
        
        
        <%@include file="footer.jsp"%>
    </body>
</html>
