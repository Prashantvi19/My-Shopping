
<%@include file="clientHeader.jsp"%>
<div id="page-content" class="single-page">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<ul class="breadcrumb">
					<li><a
						href="${pageContext.request.contextPath}/Project/client/index.jsp">Home</a></li>
					<li><a href="#">Login</a></li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<%
				String msg = request.getParameter("msg");
				if (msg != null) {
					if (msg.equals("needLogin")) {
				%>
				<div class="heading">
					<h2 style="color: red">Please log in before proceeding.</h2>
				</div>
				<%
				}
				if (msg.equals("invalidEmailPassword")) {
				%>
				<div class="heading">
					<h2 style="color: red">Email or password is wrong.</h2>
				</div>
				<%
				}
				if (msg.equals("invalid")) {
				%>
				<div class="heading">
					<h2 style="color: red">Server Error.</h2>
				</div>
				<%
				}
				}
				%>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<script type="text/javascript">
					function submitForm() {
						// document.getElementById("ff11").submit();
					}

					// window.onload = function() { submitForm();  };
				</script>


			</div>

			<div class="col-md-6" style="margin-bottom: 30px;">
				<div class="heading">
					<h2>Login</h2>
				</div>
				<form name="form1" id="ff1"
					action="${pageContext.request.contextPath}/loginUser" method="post">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Username :"
							name="email" id="email" required>
					</div>
					<div class="form-group">
						<input type="password" class="form-control"
							placeholder="Password :" name="password" id="password" required>
					</div>
					<div class="form-group">
						<input type="submit" class="form-control btn btn-4" value="Login">
					</div>
					<div class="form-group">
						<a
							href="${pageContext.request.contextPath}/Project/client/forgetPassword.jsp"
							class=" btn ">Forgot Your Password ?</a> <a
							href="${pageContext.request.contextPath}/userSignup"
							class=" btn ">SignUp ?</a>
					</div>
				</form>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
</div>
<%@include file="clientFooter.jsp"%>