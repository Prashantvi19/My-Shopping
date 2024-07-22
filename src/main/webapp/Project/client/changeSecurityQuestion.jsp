<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% if (session.getAttribute("login") == null){

	response.sendRedirect("index.jsp?msg=login");
} %>
<%@include file="clientHeader.jsp"%>
<div id="page-content" class="single-page">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<ul class="breadcrumb">
					<li><a
						href="${pageContext.request.contextPath}/Project/client/index.jsp">Home</a></li>
					<li><a href="#"> Security </a></li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3" style="margin-bottom: 30px;"></div>
			<div class="col-md-6">
				<div class="heading">
					<h2>Change Security Question</h2>
				</div>
				<%
				String msg = request.getParameter("msg");
				if (msg != null) {
					if (msg.equals("Passwords do not match.")) {
				%>
				<div class="heading">
					<h2 style="color: red"><%=msg%></h2>
				</div>
				<%
				}
				%>
				<%
				if (msg.equals("invalid")) {
				%>
				<div class="heading">
					<h2 style="color: red">Something went wrong or user is not
						registered</h2>
				</div>
				<%
				}
				%>
				<%
				if (msg.equals("valid")) {
				%>
				<div class="heading">
					<h2 style="color: red">Successfully forgot password, Thanks!</h2>
				</div>
				<%
				}
				
				}
				%>
				<form id="ff2"
					action="${pageContext.request.contextPath}/UpdateProfileByUser"
					method="post">
					
					<div class="form-group">
					<input type="hidden" class="form-control" placeholder="Enter Mobile Number :" name="Userid" id="Userid" vlalue ="<%= request.getParameter("Userid")%>">
						<input type="password" class="form-control"
							placeholder="Password :" name="password" id="password" required>
							<input type="hidden" class="form-control" name="page" id="Userid" value ="changeQuestionSecurity">
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
					
				</form>

			</div>
			<div class="col-md-3" style="margin-bottom: 30px;"></div>
		</div>
	</div>
</div>
<%@include file="clientFooter.jsp"%>