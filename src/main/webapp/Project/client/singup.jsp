<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="clientHeader.jsp"%>
<div id="page-content" class="single-page">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<ul class="breadcrumb">
					<li><a
						href="${pageContext.request.contextPath}/Project/client/index.jsp">Home</a></li>
					<li><a href="#">SingUp</a></li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3" style="margin-bottom: 30px;"></div>
			<div class="col-md-6">
				<div class="heading">
					<h2>New User ? Create An Account.</h2>
				</div>
				<%
				String msg = request.getParameter("msg");
				if (msg != null) {
					if (msg.equals("registrationIsDone.")) {
				%>
				<div class="heading">
					<h2 style="color: red">Successfully SignUp, Thanks!</h2>
				</div>
				<%
				}
				%>
				<%
				if (msg.equals("SomethigEmpty")) {
				%>
				<div class="heading">
					<h2 style="color: red">Something went wrong or e-Mail ID
						already registered</h2>
				</div>
				<%
				}
				%>
				<%
				if (msg.equals("confermPassword")) {
				%>
				<div class="heading">
					<h2 style="color: red">Confirm password didn't match.</h2>
				</div>
				<%
				}
				}
				%>
				<form id="ff2"
					action="${pageContext.request.contextPath}/userSignup"
					method="post">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="First Name :"
							name="name" id="firstname" required>
					</div>
					<div class="form-group">
						<input type="email" class="form-control"
							placeholder="Email Address :" name="email" id="email" required>
					</div>
					<div class="form-group">
						<input type="number" class="form-control" placeholder="Mobile :"
							name="phone" id="phone" required>
					</div>
					<div class="form-group">
						<input name="gender" id="gender" type="radio" value="Male">
						Male <input value="Female" name="gender" id="gender" type="radio">
						Female
					</div>
					<div class="form-group">
						<input type="password" class="form-control"
							placeholder="Password :" name="password" id="password" required>
					</div>
					<div class="form-group">
						<input type="password" class="form-control"
							placeholder="Retype Password :" name="repassword" id="repassword"
							required>
					</div>
					<div class="form-group">
						<select name="quetion" required class="form-control">
							<option disabled selected>Please select a security
								question</option>
							<option
								value="In what town or city was your first full-time job?">
								In what town or city was your first full-time job?</option>
							<option value="What is your favorite movie?">What is
								your favorite movie?</option>
							<option value="What was your favorite sport in high school?">
								What was your favorite sport in high school?</option>
							<option value="What was your favorite school teacher’s name?">
								What was your favorite school teacher’s name?</option>
							<option value="What was your first car?">What was your
								first car?</option>
							<option value="What city were you born in?">What city
								were you born in?</option>
						</select>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Ans"
							name="ans" id="" required>
					</div>
					<div class="form-group">
						<input type="submit" class="form-control btn btn-4">
					</div>
					<div class="form-group">
						<a href="${pageContext.request.contextPath}/loginUser"
							class=" btn ">Login ?</a>
					</div>
				</form>

			</div>
			<div class="col-md-3" style="margin-bottom: 30px;"></div>
		</div>
	</div>
</div>
<%@include file="clientFooter.jsp"%>