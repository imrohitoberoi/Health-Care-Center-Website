<%@page import="java.sql.*"%>
<%@include file="dbvars.jsp" %>
<% try              
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn =  DriverManager.getConnection(dburl, dbuname, dbpass);
            try
            {
                String q = "select * from manageprod where subcatid=?";//CATID IS AUTO INCREMENTED IN OUR TABLE
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, request.getParameter("scid"));
                ResultSet myres = myst.executeQuery();
                if(myres.next())
                {
                    out.print("<h2>Already added in Subcategory</h2>");
                    out.print("<table class='table table-striped'>"
                            + "<tr>"
                            + "<th>Picture</th>"
                            + "<th>Name</th>"
                            + "<th>Rate</th>"
                            + "<th>Stock</th>"
                            + "<th>Discount</th>"
                            + "<th>Description</th>"
                            + "<th>Update</th><th>Delete</th></tr>");
                    do
                    {
                        out.print("<tr>"
                                + "<td><img src='uploads/" + myres.getString("prodpic") + "'height='75'></td>"
                                        + "<td>"+ myres.getString("name") + "</td>"
                                                + "<td>"+ myres.getString("rate") + "</td>"
                                                        + "<td>"+ myres.getString("stock") + "</td>"
                                                                + "<td>"+ myres.getString("discount") + "</td>"
                                                                        + "<td>"+ myres.getString("description") + "</td>"
                                        + "<td><a href='updateprod.jsp?pid=" + myres.getString("prodid") + "' style='color:black'>Update</a></td>"
                                                + "<td><a class='dellink' href='' id=" + myres.getString("prodid") + "' style='color:black'>Delete</a></td></tr>");
                    }while(myres.next());//JAVA CODE IS ALWAYS IN DOUBLE QUOTES(HERE, myres.getString)
                    out.print("</table>");
                }
                else
                {
                    out.print("<option value=''>No Sub-Category found</option>");
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