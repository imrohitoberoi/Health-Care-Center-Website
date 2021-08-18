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
                    out.print("<option value=''>Choose Subcategory</option>");
                    do
                    {
                        out.print("<option value='"+myres.getString("subcatid")+"'>" + myres.getString("subcatname") + "</option>");
                    }while(myres.next());//JAVA CODE IS ALWAYS IN DOUBLE QUOTES(HERE, myres.getString)
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