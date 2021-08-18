  <!-- HERE WE COPY ONLY HEADER FILE FROM ANY PAGE THAT WE DOWNLOADED FROM W3 LAYOUTS.COM  -->
<!-- top header -->

<%
    if(session.getAttribute("name")==null || !session.getAttribute("usertype").toString().equalsIgnoreCase("admin"))//TO STRING IS DONE SINCE GETATTRIBUTE GIVES OBJECT
    {
        response.sendRedirect("login.jsp");
    }
    
    %>

<div class="header-top">
	<div class="container">
    <div class="row">
            <div class="col-sm-6">
                    <ul class="d-lg-flex header-w3_pvt">
                            <li class="mr-lg-3">
                                    <span class="fa fa-envelope-open"></span>
                                    <a href="mailto:rohitoberoi1849@gmail.com" class="">health123@gmail.com</a>
                            </li>
                            <li>
                                    <span class="fa fa-phone"></span>
                                    <p class="d-inline">Call Us 7888371247 </p>
                            </li>
                                    <li>

                        <p class="d-inline">  Welcome
                            <%
                                if(session.getAttribute("name")==null)//TAKES VALUE FROM SESSION USING ITS VARIABLE NAME
                                {
                                    out.print("Guest  ");
                                    out.print("<a href='signup.jsp'> Sign Up </a>");//SHOWS THIS IF SOMEONE IS NOT LOGGED IN
                                    out.print("<a href='login.jsp'> Login  </a>");
                                }
                                else
                                {
                                    out.print(session.getAttribute("name"));
                                    out.print("<a href='changepass.jsp'>         Change Password </a>");//ELSE GIVES OPTION TO CHANGE PASS OR LOGOUT
                                    out.print("<a href='signout.jsp'> Logout </a>");
                                }

                                %>
                        </p>
                                    </li>
                    </ul>
            </div>
            <div class="col-sm-6 header-right-w3_pvt">
                    <ul class="d-lg-flex header-w3_pvt justify-content-lg-end">
                            <li class="mr-lg-3">
                                    <span class=""><span class="fa fa-clock-o"></span>Mon - Fri : 8:30am to 9:30pm</span>
                            </li>
                            <li class="">
                                    <span class=""><span class="fa fa-clock-o"></span>Sat & Sun : 9:00am to 6:00pm</span>
                            </li>
                    </ul>
            </div>
    </div>
	</div>
</div>
<!-- //top header -->

<!-- //header -->
<header class="py-3">
	<div class="container">
			<div id="logo">
				<h1> <a href="adminhome.jsp"><span class="fa fa-stethoscope" aria-hidden="true"></span>Health Care Center</a></h1>
			</div>
		<!-- nav -->
		<nav class="d-lg-flex">

			<label for="drop" class="toggle"><span class="fa fa-bars"></span></label>
			<input type="checkbox" id="drop" />
			<ul class="menu mt-2 ml-auto">
				<li class="active"><a href="adminhome.jsp">Home</a></li>
				<li class=""><a href="listofmembers.jsp">List of Admins</a></li>
                                <li class=""><a href="listofuser.jsp">List of User</a></li>
                                <li class=""><a href="listofstaff.jsp">List of Staff</a></li>
                                <li class=""><a href="listofapp.jsp">List of Appointment</a></li>
                                <li class=""><a href="listoftimeslots.jsp">List of Time slots</a></li>
                                
			</ul>
			<div class="login-icon ml-2">
				<!here add the link to book appointment<a class="user" href=""> 
			</div>
		</nav>
		<div class="clear"></div>
		<!-- //nav -->
	</div>
</header>
<!-- //header -->

<!-- banner -->
<div class="innerpage-banner" id="home">
	<div class="inner-page-layer">
	</div>
</div>
<!-- //banner -->