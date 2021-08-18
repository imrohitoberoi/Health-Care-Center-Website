
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="dbvars.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Services</title>
        <%@include file="extfiles.jsp"%>
    </head>
    <body>
        <%@include file="header.jsp"%>
        
<section class="services py-5">
	<div class="container py-lg-5">
		<h3 class="heading text-center mb-5">Services </h3>
		<div class="row offer-grids">
			<div class="col-lg-4 col-md-6">
				<div class="ser1">
					<div class="bg-layer">
						<h4 class="">Specialized Doctors</h4>
						<p class="mt-3">Our all doctors are specialist registered in Medical Council of India with more than 12+ experience in medical field. Many have practised in countries like UK, USA.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 mt-md-0 mt-4">
				<div class="ser2">
					<div class="bg-layer">
						<h4 class="">Trained Faculty</h4>
						<p class="mt-3">We have a team of experienced people who take cares of our patients in the absence of doctors. Everyone here has experience in this field from more than 5 years.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 mt-lg-0 mt-4">
				<div class="ser3">
					<div class="bg-layer">
						<h4 class="">Easy To Meet</h4>
						<p class="mt-3">You can now book an appointment with our doctors at your home only either by calling us at the given contact number or booking online from our website.</p>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</section>
        <section class="join py-5">
	<div class="container py-lg-5 py-sm-3">
		<div class="row join_grids">
			<div class="col-lg-6">
				<img src="images/b.jpg" class="img-fluid" alt="" />
			</div>
			<div class="col-lg-6">
				<h4 class="mt-4">Make Your Appointment Today</h4>
				<p class="py-sm-4 py-3">We here provide a facility to book your appointment to meet our specialized doctors from your home only. </p>
				<a class="btn btn-banner text-capitalize" href="index.jsp" role="button">Book Now</a>
			</div>
		</div>
	</div>
</section>
        
        
        
        <%@include file="footer.jsp"%>
    </body>
</html>
