
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="dbvars.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us</title>
        <%@include file="extfiles.jsp"%>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <section class="about py-5">
	<div class="container py-md-3">
		<h2 class="heading text-center mb-sm-5 mb-4">About Us </h2>
		<div class="row">
			<div class="col-lg-8">
				<h4 class="about-left">Be Gentle With The Strongest!</h4>
				<p class="mt-sm-4 mt-3">
				Our Health Care Center is the major provider of acute, maternity, sub-acute and specialist services in India’s rapidly growing outer north.

Services are provided through our four main campuses:
Health Care Center, Apollo Hospital, Mumbai Central.

Our emergency department treats over 107,000 patients each year, cares for over 94,000 patients admitted to hospital, and assists with the delivery of over 4,000 babies each year.

Our Health Care Center includes three of the state’s six growth areas. The swift development of new suburbs in the north will see our population grow by 17% (69,000 people) in the next five years alone, and by over 58% (more than 228,000 people) by 2031.

Our Health Care Center cares for a diverse community, born in more than 185 countries, who speak over 106 different languages and follow over 90 different religions or beliefs.

Our Health Care Center has over 5,300 dedicated professional staff and has annual revenue turnover of over $500 million.
				</p>
                                
                        </div></div></div>                                
       </section>
        
        <section class="appointment text-center py-5">
	<div class="container py-sm-3">
		<h4>make your dream smile a reality</h4>
		<p class="mt-3">Click here To Book Your Appointment Today</p>
		<a href="index.jsp">Book an Appointment</a>
	</div>
</section>
    <%@include file="footer.jsp"%>
    </body>
</html>
