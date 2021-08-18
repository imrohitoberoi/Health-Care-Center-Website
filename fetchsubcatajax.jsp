<%@page import="java.sql.*"%>
<%@include file="dbvars.jsp" %>
<% try              
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn =  DriverManager.getConnection(dburl, dbuname, dbpass);
            try
            {
                String q = "select * from managesubcat where catid=?";//CATID IS AUTO INCREMENTED IN OUR TABLE
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, request.getParameter("catid"));
                ResultSet myres = myst.executeQuery();
                if(myres.next())
                {
                    out.print("<h2>Already added Doctors</h2></br>");
                    out.print("<table class='table table-striped'>"
                            + "<tr>"
                            + "<th>Picture</th>"
                            + "<th>Name</th>"
                            + "<th>Qualification</th>"
                            + "<th>Update</th><th>Delete</th></tr>");
                    do
                    {
                        out.print("<tr>"
                                + "<td><img src='uploads/" + myres.getString("subcatpic") + "'height='75'></td>"
                                        + "<td>"+ myres.getString("subcatname") + "</td>"
                                        + "<td>"+ myres.getString("qual") + "</td>"        
                                        + "<td><a href='updatesubcat.jsp?scid=" + myres.getString("subcatid") + "' style='color:black'>Update</a></td>"
                                                + "<td><a class='dellink' href='' id=" + myres.getString("subcatid") + "' style='color:black'>Delete</a></td></tr>");
                    }while(myres.next());//JAVA CODE IS ALWAYS IN DOUBLE QUOTES(HERE, myres.getString)
                    out.print("</table>");
                }
                else
                {
                    out.print("<option value=''>No Doctor found</option>");
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