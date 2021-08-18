<%@page import="java.sql.*"%>
<%@include file="dbvars.jsp" %>
<% try              
    
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn =  DriverManager.getConnection(dburl, dbuname, dbpass);
            try
            {
                String q = "select * from signup where username=?";
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, request.getParameter("un"));
                ResultSet myres = myst.executeQuery();
                if(myres.next())
                {
                    out.print("Username already exists");
                }
                else
                {
                    out.print("Username available");
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