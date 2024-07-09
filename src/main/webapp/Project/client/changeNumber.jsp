<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% if (session.getAttribute("login") == null){

	response.sendRedirect("index.jsp?msg=login");
} %>
<%@include file="clientHeader.jsp" %>
<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a
						href="${pageContext.request.contextPath}/Project/client/index.jsp">Home</a></li>
					<li><a
						href="#">Change Mobile Number</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
			<div class="col-md-3">
				</div>
				<div class="col-md-6" style="margin-bottom: 30px;">
					<div class="heading"><h2>Change Mobile Number</h2></div>
					<form name="form1" id="ff1" action="${pageContext.request.contextPath}/UpdateProfileByUser" method="post">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Enter Mobile Number :" name="mobileNumber" id="mobileNumber" required>
							<input type="hidden" class="form-control" name="page" id="Userid" value ="changeMobile">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="Enter Password :" name="password" id="password" required>
						</div>
						<div class="form-group">
							<input type="submit" class="form-control btn btn-4" value ="Submit">
						</div>
						<div class="form-group">
							<a href="${pageContext.request.contextPath}/Project/client/forgetPassword.jsp" class=" btn " >Forgot Your Password ?</a>
						</div>
					</form>
				</div>
				<div class="col-md-3">
				</div>
			</div>
		</div>
	</div>
	<%@include file="clientFooter.jsp" %>