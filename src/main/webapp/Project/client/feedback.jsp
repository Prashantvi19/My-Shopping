<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% if (session.getAttribute("login") == null){

	response.sendRedirect("index.jsp?msg=login");
} %>
<%@include file="clientHeader.jsp"%>
<div id="page-content" class="single-page">
	<div class="container">
		<div class="row">
			<div class="row">
			<%
			String msg = request.getParameter("msg");
			if (msg != null) {
				if (msg.equals("submitted")) {
			%>
			<div class="heading">
				<h2 style="color: red">Thanks! for feedback Us.</h2>
			</div>
			<%
			}
			if (msg.equals("notSubmit")) {
			%>
			<div class="heading">
				<h2 style="color: red">Something is wrong.</h2>
			</div>
			<%
			}
			if (msg.equals("error")) {
			%>
			<div class="heading">
				<h2 style="color: red">Server Error.</h2>
			</div>
			<%
			}
			}
			%>
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a
							href="${pageContext.request.contextPath}/Project/client/index.jsp">Home</a></li>
						<li><a href="#">Feedback</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="heading text-center">
						<h1>Feedback</h1>
					</div>
				</div>
				<div class="col-md-3"></div>
				<div class="col-md-6" style="margin-bottom: 20px;">
					<form name="form1" id="ff" method="post"
						action="${pageContext.request.contextPath}/UserFeedbackSubmit">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Your Name *"
								name="name" id="name" required
								data-validation-required-message="Please enter your name.">
						</div>

						<div class="form-group">
							<textarea class="form-control" placeholder="type here feedback *"
								name="feedback" id="message" required
								data-validation-required-message="Please enter a message."></textarea>
						</div>
						<button type="submit" class="btn btn-1">Send Feedback</button>
					</form>
				</div>
				<div class="col-md-3"></div>
			</div>
			<%@include file="clientFooter.jsp"%>