
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="dbvars.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gallery</title>
        <%@include file="extfiles.jsp"%>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <section class="gallery py-5" id="gallery">
	<div class="container py-lg-5">
		<h2 class="heading text-center mb-sm-5 mb-4">Gallery</h2>
		<div class="row news-grids text-center">
			<div class="col-md-3 col-6 gal-img">
				<img src="images/gallery1.jpg" alt="portfolio image" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 gal-img">
				<img src="images/gallery2.jpg" alt="portfolio image" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 gal-img">
				<img src="images/gallery3.jpg" alt="portfolio image" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 gal-img">
				<img src="images/gallery4.jpg" alt="portfolio image" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 gal-img">
				<img src="images/gallery5.jpg" alt="portfolio image" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 gal-img">
				<img src="images/gallery6.jpg" alt="portfolio image" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 gal-img">
				<img src="images/gallery1.jpg" alt="portfolio image" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 gal-img">
				<img src="images/gallery2.jpg" alt="portfolio image" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 gal-img">
				<img src="images/gallery3.jpg" alt="portfolio image" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 gal-img">
				<img src="images/gallery4.jpg" alt="portfolio image" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 gal-img">
				<img src="images/gallery5.jpg" alt="portfolio image" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 gal-img">
				<img src="images/gallery6.jpg" alt="portfolio image" class="img-fluid">
			</div>
		</div>
                </div>
</section>
        
        <section class="appointment text-center py-5">
	<div class="container py-sm-3">
		<h4>make your dream smile a reality</h4>
		<p class="mt-3">Click Here To Book Your Appointment Today</p>
		<a href="index.jsp">Book an Appointment</a>
	</div>
</section>
        
        <%@include file="footer.jsp"%>
    </body>
</html>
