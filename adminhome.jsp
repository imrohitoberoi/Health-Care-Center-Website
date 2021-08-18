
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
        <%@include file="extfiles.jsp"%> <!WE CALL EXTFILES USING THIS FUNCTION TO CALL OTHER FILES>
    </head>
    <body>
        <%@include file="adminheader.jsp"%><!WE CALL HEADER FILE HERE>
        
    <div class="container py-md-3" align="center">
        <h2>Admin Home</h2><!IN BETWEEN HEADER AND FOOTER WE PUT OUR MAIN CONTENT OF THAT PAGE EITHER BY CALLING OTHER PAGE OR MY WRITING CODE HERE>
        </div>
       <table align="center">
           <tr>
                <tr> <th> <li class=""><a href="managecat.jsp">Manage Specialization</a></li><th/><tr/>
                <tr> <th> <li class=""><a href="managesubcat.jsp">Manage Doctor</a></li><th/>
                <tr> <th> <li class=""><a href="addadmin.jsp">Add Admin</a></li><th/><tr/>
                <tr> <th> <li class=""><a href="addmember.jsp">Add User</a></li><th/><tr/>
                <tr> <th> <li class=""><a href="addstaff.jsp">Add Staff</a></li><th/><tr/>
                <tr> <th> <li class=""><a href="addtimeslots.jsp">Add Time slot</a></li><th/><tr/>
                <tr> <th> <li class=""><a href="searchmem.jsp">Search Admin/User</a></li><th/><tr/>
                <tr> <th> <li class=""><a href="searchstaff.jsp">Search Staff</a></li><th/><tr/>
         </table>
    </br>
        <%@include file="footer.jsp"%>
    </body>
</html>
