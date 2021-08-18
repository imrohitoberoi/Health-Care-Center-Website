 <%@page import="java.util.Properties"%>
 <%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
 
 
 
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
        <%@include file="extfiles.jsp"%> <!WE CALL EXTFILES USING THIS FUNCTION TO CALL OTHER FILES>
    </head>
    <body>
        <%@include file="header.jsp"%><!WE CALL HEADER FILE HERE>
<section class="mail pt-lg-5 pt-4">
	<div class="container pt-lg-5">
		<h2 class="heading text-center mb-sm-5 mb-4">Contact Us </h2>
		<div class="row agileinfo_mail_grids">
			<div class="col-lg-8 agileinfo_mail_grid_right">
				<form action="#" method="post">
					<div class="row">
						<div class="col-md-6 wthree_contact_left_grid pr-md-0">
							<div class="form-group">
								<input type="text" name="name" class="form-control" placeholder="Name" required="">
							</div>
							<div class="form-group">
								<input type="email" name="email" class="form-control" placeholder="Email" required="">
							</div>
						</div>
						<div class="col-md-6 wthree_contact_left_grid">
							<div class="form-group">
								<input type="text" name="phone" class="form-control" placeholder="Phone Number" required="">
							</div>
							<div class="form-group">
								<input type="text" name="subject" class="form-control" placeholder="Subject" required="">
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<textarea name="message" placeholder="Message" class="form-control" required=""></textarea>
							</div>
						</div>
						<div class="col-md-12">
							<div class="submit-buttons">
								<button name="s1" type="submit" class="btn">Submit</button>
							</div>
						</div>
					</div>
				</form>
                            <%
     String n="",ph="",em="",msg="",sub="";
 if(request.getParameter("s1")!=null)
 {

 n=request.getParameter("name");
 ph=request.getParameter("phone");
 em=request.getParameter("email");
 msg=request.getParameter("message");
 sub=request.getParameter("subject");
 try
 {
 
 Properties props = new Properties();
 props.put("mail.smtp.host", "smtp.gmail.com");
 props.put("mail.smtp.socketFactory.port", "465");
 props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
 props.put("mail.smtp.auth", "true");
 props.put("mail.smtp.port", "465");

 Session session2 = Session.getInstance(props,
 new javax.mail.Authenticator() {
 protected PasswordAuthentication getPasswordAuthentication() {
 return new PasswordAuthentication("rohitoberoi1849@gmail.com","rohitoberoi007");//Real gmail id and password req here (For authentication)
 }
 });
 
 Message message = new MimeMessage(session2);
 message.addHeader("Content-type", "text/html; charset=UTF-8");
 message.setFrom(new InternetAddress("rohitoberoi1849@gmail.com"));//From mail(You have to fix until you buy hosting)
 InternetAddress[] replAddresses = { new InternetAddress(em) };
 message.setReplyTo(replAddresses);//With this when you reply, the mail of sender is automatically setted in To block
 message.setRecipients(Message.RecipientType.TO,InternetAddress.parse("rohitoberoi1848@gmail.com"));//To
 message.setSubject(sub);
 
 message.setText("Name:-" + n + "\nPhone:-" + ph + "\nEmail ID:- " + em + "\nMessage:-" + msg);//Content of msg
 Transport.send(message);

 }
 catch (Exception e)
 {
    out.print("Error in sending mail " + e.getMessage());
 }
 }
 %>
 
			</div>
			<div class="col-lg-4 col-md-6 mt-lg-0 mt-4 contact-info">
				<h4 class="mb-4">Address Information</h4>
				<p><span class="fa mr-2 fa-map-marker"></span>Civil Lines, New Delhi</p>
				<p class="phone py-2"><span class="fa mr-2 fa-phone"></span>Phone : 7888371247</p>
				<p><span class="fa mr-2 fa-envelope"></span>Email : health123@gmail.com</p>
				
				<h4 class="my-4">Book Your Appointment</h4>
				<p class="phone"><span class="fa mr-2 fa-phone"></span>Call us at 7888371247</p>
			</div>
		</div>
	</div>
	</br>
 <div class="map mt-1">
		<iframe src="https://www.google.com/maps/embed/v1/place?q=New%20Delhi&key=AIzaSyBKt4s92qJJQPe1KfzQZSZjRDQ-6RA65LM"></iframe>
			
	</div>
</section>
    <%@include file="footer.jsp"%>
    </body>
    </html>
<!-- //contact -->