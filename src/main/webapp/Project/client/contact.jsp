<%@include file="clientHeader.jsp"%>
<div id="page-content" class="single-page">
	<div class="container">
		<div class="row">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a
							href="${pageContext.request.contextPath}/Project/client/index.jsp">Home</a></li>
						<li><a href="#">Contact Us</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<%
				String msg = request.getParameter("msg");
				if (msg != null) {
					if (msg.equals("messageSubmit")) {
				%>
				<div class="heading">
					<h2 style="color: red">Message Submitted.</h2>
				</div>
				<%
				}
				if (msg.equals("messageFailed")) {
				%>
				<div class="heading">
					<h2 style="color: red">Something Is Wrong.</h2>
				</div>
				<%
				}
				if (msg.equals("messageFailedError")) {
				%>
				<div class="heading">
					<h2 style="color: red">Server Error. Please try after
						sometime.</h2>
				</div>
				<%
				}
				}
				%>
				<div class="col-lg-12">
					<div class="heading">
						<h1>CONTACT US</h1>
					</div>
				</div>

				<div class="col-md-6" style="margin-bottom: 20px;">
					<form name="form1" id="ff" method="post"
						action="${pageContext.request.contextPath }/SubmitUserContact">
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Enter Message email *" name="email" id="name"
								required
								data-validation-required-message="Please enter your name.">
						</div>
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Enter Message Subject *" name="subject" id="email"
								required
								data-validation-required-message="Please enter your email address.">
						</div>

						<div class="form-group">
							<textarea class="form-control" placeholder="Your Message *"
								name="message" id="message" required
								data-validation-required-message="Please enter a message."></textarea>
						</div>
						<button type="submit" class="btn btn-1">Send Message</button>
					</form>
				</div>
				<div class="col-md-6">
					<p>
						<span class="glyphicon glyphicon-home"></span> indore,mp,india
						452010
					</p>
					<p>
						<span class="glyphicon glyphicon-earphone"></span> +9163XXXXXX34
					</p>
					<p>
						<span class="glyphicon glyphicon-envelope"></span> info@gmail.com
					</p>
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d58898.29359852054!2d75.83144924315695!3d22.685706935346115!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sindore%20it%20park%20location!5e0!3m2!1sen!2sin!4v1720101971093!5m2!1sen!2sin"
						width="95%" height="230" frameborder="0" style="border: 0"></iframe>
				</div>
			</div>
			<%@include file="clientFooter.jsp"%>