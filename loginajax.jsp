<%@page import="java.net.URL"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.BufferedReader"%>

<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.*"%>



<% 
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
    try              
        {
            String dbuname=getServletContext().getInitParameter("dbuname");//HERE WE USE SERVLET CONTEXT TO GET VALUE OF PARAMETERS INITIALISED IN init() BY SERVLET CONFIG
            String dburl=getServletContext().getInitParameter("dburl")     ;   
            String dbpass=getServletContext().getInitParameter("dbpass");
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn =  DriverManager.getConnection(dburl, dbuname, dbpass);
            try
            {
                String uname=request.getParameter("uname");
                String pass=request.getParameter("pass") + "@$$$#%%%%$#@$@$";
                String q = "select * from signup where (username=? or phonenumber=? or email=?) and password=md5(?)";//CATID IS AUTO INCREMENTED IN OUR TABLE
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, uname);
                myst.setString(2, uname);
                myst.setString(3, uname);
                myst.setString(4, pass);
                ResultSet myres = myst.executeQuery();
                if(myres.next())
                {
                    session.setAttribute("name",myres.getString("name"));
                    session.setAttribute("uname",myres.getString("username"));
                    session.setAttribute("phone",myres.getString("phonenumber"));
                    session.setAttribute("email",myres.getString("email"));
                    session.setAttribute("usertype",myres.getString("usertype"));
                    if(myres.getString("usertype").equalsIgnoreCase("admin"))
                    {
                        out.print("admin");
                    }
                    else
                    {
                        out.print("normal");
                    }
                }
                else
                {
                    out.print("incorrect");
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
                 else
                    {
                    out.print("human");
                    }
             }
                catch(Exception e)
                        {
                             out.print("Error in recaptcha" + e.getMessage());   
                        }
          
   
%>