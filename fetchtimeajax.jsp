<%@page import="java.sql.*"%>
<%@include file="dbvars.jsp" %>
<% try              
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn =  DriverManager.getConnection(dburl, dbuname, dbpass);
            try
            {
                String q = "select * from timeslot where sno not in"
                        + "(select sno from appointment where date=? and SubcatID=?)";//CATID IS AUTO INCREMENTED IN OUR TABLE
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, request.getParameter("date"));
                myst.setString(2, request.getParameter("doc"));
                ResultSet myres = myst.executeQuery();
                if(myres.next())
                {
                  
                 do
                 {
                  out.print("<option value='"+myres.getString("sno")+"'>" + myres.getString("time") + "</option>");                      
                 }
                 while(myres.next());//JAVA CODE IS ALWAYS IN DOUBLE QUOTES(HERE, myres.getString)
                    out.print("</select>");
                     //out.print("Your app id is "+myres.getString("sno")+".");
                    
                }
                else
                {
                    out.print("<option value=''>No Time slot available</option>");
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