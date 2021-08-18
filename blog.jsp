
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="dbvars.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog</title>
        <%@include file="extfiles.jsp"%>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <section class="feedback" id="testimonials">
	<div class="feedback-layer py-5">
		<div class="container py-lg-5">
		<h3 class="heading text-center mb-sm-5 mb-4">Testimonials</h3>
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="feedback-info">
						<div class="feedback-top p-4">
							<span class="fa fa-quote-right"></span> 
							<p>Cartilage is a permanent tissue with very minimal healing potential. It is the best shock absorber of nature. Friction between two layers of cartilage while moving is about a hundred times slower than two pieces of ice sliding over each other.The first surgery involves the arthroscopy and harvesting the cartilage, while the second surgery involves re-implanting the harvested cartilage. </p>
							<div class="clearfix"></div>
						</div>
						<div class="feedback-grids">
							<div class="feedback-img">
								<img src="images/ser1.jpg" class="img-fluid" alt="">
							</div>
							<div class="feedback-img-info">
								<h5>Brian Lee</h5>
								<p class="font-italic">- March 8, 2019.</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 mt-md-0 mt-5">
					<div class="feedback-info">
						<div class="feedback-top p-4">
							<span class="fa fa-quote-right"></span> 
							<p>Pounding headache, nausea, light sensitivity and vomiting are all the annoying symptoms of a migraine. They can cause absolutely incapacitating pain and even completely immobilize a person at times. This Clinic is a comprehensive multi-disciplinary centre that uses a collaborative approach to treat experienced, complex or difficult-to- treat headache conditions. The pain can be localised in some cases whereas sometimes it may affect the entire head. </p>
							<div class="clearfix"></div>
						</div>
						<div class="feedback-grids">
							<div class="feedback-img">
								<img src="images/ser2.jpg" class="img-fluid" alt="">
							</div>
							<div class="feedback-img-info">
								<h5>Sunny </h5>
								<p class="font-italic">- April 29, 2019.</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 mt-lg-0 mt-5">
					<div class="feedback-info">
						<div class="feedback-top p-4">
							<span class="fa fa-quote-right"></span> 
							<p> Approximately, 90,000 CABGs are performed yearly in India, with 99% success rates. Our Hospitals perform the highest number of heart surgeries and minimally invasive heart surgeries in India, “MICS is the future of heart surgery. It’s safe, effective and delivers outstanding patient comfort and outcomes. It’s the best thing to happen to heart surgery in the last two decades”</p>
							<div class="clearfix"></div>
						</div>
						<div class="feedback-grids">
							<div class="feedback-img">
								<img src="images/ser3.jpg" class="img-fluid" alt="">
							</div>
							<div class="feedback-img-info">
								<h5>Mark Jane</h5>
								<p class="font-italic">- May 3, 2019.</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
		
            
            </br>
            
         
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="feedback-info">
						<div class="feedback-top p-4">
							<span class="fa fa-quote-right"></span> 
							<p> I was a sportsman in my younger days and was very fit. The rigours of studying medicine made me bid goodbye to sports and I have consistently put on weight around my belly, and despite my best efforts, the accumulated fat refuses to go. It is critical to avoid the fat around the belly. But here in this hospital service I was able to control all my unfavourable conditions.</p>
							<div class="clearfix"></div>
						</div>
						<div class="feedback-grids">
							<div class="feedback-img">
								<img src="images/aa1.jpg" class="img-fluid" alt="">
							</div>
							<div class="feedback-img-info">
								<h5>Jack Johnson</h5>
								<p class="font-italic">- May 30, 2019.</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 mt-md-0 mt-5">
					<div class="feedback-info">
						<div class="feedback-top p-4">
							<span class="fa fa-quote-right"></span> 
							<p>Keeping your joints & bones healthy as well as understanding what can damage them is important for all of us regardless of our age or lifestyle. To know how healthy your joints are, take the joint age test today and if you are experiencing persistent pain, please consult an Orthopaedician at the earliest. </p>
							<div class="clearfix"></div>
						</div>
						<div class="feedback-grids">
							<div class="feedback-img">
								<img src="images/aa2.jpg" class="img-fluid" alt="">
							</div>
							<div class="feedback-img-info">
								<h5>Neil mait</h5>
								<p class="font-italic">- June 3, 2019.</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 mt-lg-0 mt-5">
					<div class="feedback-info">
						<div class="feedback-top p-4">
							<span class="fa fa-quote-right"></span> 
							<p> Regenerative Therapy is a translational branch of medicine which deals with the technique of re-engineering, replacing and regenerating human cells, organs and tissues in order to establish routine human bodily functions.Our highly developed medical procedures OSSRON and CHONDRON are both autologous cell therapies which renew damaged cells, tissues and organs as well as naturally heal bone defects.</p>
							<div class="clearfix"></div>
						</div>
						<div class="feedback-grids">
							<div class="feedback-img">
								<img src="images/aa3.jpg" class="img-fluid" alt="">
							</div>
							<div class="feedback-img-info">
								<h5>Dennis</h5>
								<p class="font-italic">- June 19, 2019.</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
		
            </div>
            
            		</div>

	
</section>                <!--TESTIMONIAL ENDS-->
        
<section class="blog py-5">
	<div class="container py-md-5 py-3">
		<h3 class="heading text-center mb-sm-5 mb-4">Latest News </h3>
		<div class="row blog-grids">
			<div class="col-lg-7 mb-lg-5 blog-img1">
                            </br></br>
				<img src="images/blog22.jpg" alt="" class="img-fluid"/>
			</div>
			<div class="col-lg-5 mb-lg-5 mb-4">
				<h5>June 29, 2019.</h5>
				<h4 class="my-3">Common Mistakes Done in Equipment Planning </h4>
                                
				<p class="my-3">Hospital equipment planning has to be given prime importance right from the hospital planning and execution  stages in order to ensure the smooth functioning and efficiency of the hospital.  On one hand, all types of medical equipment are expensive while on the other hand, they become quickly outdated with newer versions arriving in the market. The hospital must not only be well-equipped with the latest equipment and also have trained technicians to operate these newest machines. All these challenges can cause errors inadvertently and this cannot be afforded by the hospital.  </p>
				
			</div>
			<div class="col-lg-5 mb-lg-0 mb-4">
				<h5>July 7, 2019.</h5>
				<h4 class="my-3">Patient-Doctor Ratio in India</h4>
                                
				<p class="my-3">The ideal patient-doctor ratio recommended by the WHO is 1000:1 and India can achieve this only by 2024. The Indian healthcare industry is progressing by leaps and bounds with 2500 hospitals to be set up in the next 5 years. Yet on the downside, 600 million people in rural areas have no access to healthcare. In cities, healthcare units struggle to maintain hospital patient satisfaction due to the quick turnover of doctors and specialists and poor patient-doctor relationship. </p>
                                
				
			</div>
			<div class="col-lg-7 blog-img2">
                            </br></br>
				<img src="images/blog11.jpg" alt="" class="img-fluid"/>
			</div>
		</div>
	</div>
</section>




        <%@include file="footer.jsp"%>
    </body>
</html>
