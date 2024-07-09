
<footer>
	<div class="top-footer">
		<div class="container">
			<div class="row">

				<div class="col-md-12 text-center">
					<%
					if (session.getAttribute("login") != null) {
					%>
					<div class="subcribe-form form-group">
						<a href="${pageContext.request.contextPath}/Project//Admin/logout.jsp" class="btn btn-4">Logout</a>
					</div>
					<%
					} else {
					%>
					<div class="subcribe-form form-group">
						<a href="${pageContext.request.contextPath}/Project/client/singin.jsp" class="btn btn-4">Login</a> <a href="${pageContext.request.contextPath}/Project/client/singup.jsp"
							class="btn btn-4">SingUp</a>
					</div>
					<%
					}
					%>

				</div>

			</div>
		</div>
	</div>
	<div class="container">
		<div class="wrap-footer">
			<div class="row">
				<div class="col-md-3 col-footer footer-1">
					<h4>My Shopping</h4>
					<p>Our goal at My Shopping is to provide the best user
						experience, making your shopping easy and time-efficient, ensuring
						the best products are delivered to your home.</p>
				</div>
				<div class="col-md-3 col-footer footer-2">
					<div class="heading">
						<h4>Customer Services</h4>
					</div>
					<ul>

						<li><a  href="${pageContext.request.contextPath}/Project/client/index.jsp">Home</a></li>
						<li><a
							href="${pageContext.request.contextPath}/Project/client/myOrders.jsp">My
								Orders</a></li>

						<li><a
							href="${pageContext.request.contextPath}/Project/client/cart.jsp"><span></span>My
								CART</a></li>

					</ul>
				</div>
				<div class="col-md-3 col-footer footer-3">
					<div class="heading">
						<h4>My Account</h4>
					</div>
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/Project/client/profile.jsp">My
								Profile</a></li>
						<li><a
							href="${pageContext.request.contextPath}/Project/client/contact.jsp">Contact
								Us</a></li>
						<li><a
							href="${pageContext.request.contextPath}/Project/client/feedback.jsp">Feedback</a></li>
					</ul>
				</div>
				<div class="col-md-3 col-footer footer-4">
					<div class="heading">
						<h4>Contact Us</h4>
					</div>
					<ul>
						<li><span class="glyphicon glyphicon-home"></span>indore,mp,india
							452010</li>
						<li><span class="glyphicon glyphicon-earphone"></span>+9163XXXXXX34</li>
						<li><span class="glyphicon glyphicon-envelope"></span>info@gmail.com</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="copyright">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					Copyright © 2024 <i> <a
						href="${pageContext.request.contextPath}/Project/client/index.jsp">
							My Shopping</a>.
					</i> All rights reserved.and developed by <b>Prashant Vishwakarma.</b>
				</div>
				<div class="col-md-4">
					<div class="pull-right">
						<ul>
							<li><img src="images/visa-curved-32px.png" /></li>
							<li><img src="images/paypal-curved-32px.png" /></li>
							<li><img src="images/discover-curved-32px.png" /></li>
							<li><img src="images/maestro-curved-32px.png" /></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<script>
	$(document).ready(function() {
		$(".nav-tabs a").click(function() {
			$(this).tab('show');
		});
		$('.nav-tabs a').on('shown.bs.tab', function(event) {
			var x = $(event.target).text(); // active tab
			var y = $(event.relatedTarget).text(); // previous tab
			$(".act span").text(x);
			$(".prev span").text(y);
		});
	});
</script>
</body>
</html>
