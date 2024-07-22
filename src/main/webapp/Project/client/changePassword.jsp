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
					<li><a
						href="#">Change Password</a></li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3" style="margin-bottom: 30px;"></div>
			<div class="col-md-6">
				<div class="heading">
					<h2>Password Change.</h2>
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
						<input type="password" class="form-control"
							placeholder="Enter Old Password :" name="password" id="oldpassword"
							required>
							<input type="hidden" class="form-control" name="page" id="Userid" value ="changePassword">
					</div>

					<div class="form-group">
						<input type="password" class="form-control"
							placeholder="Password :" name="newPassword" id="newPassword" required>
					</div>
					<div class="form-group">
						<input type="password" class="form-control"
							placeholder="Retype Password :" name="reNewPassword" id="repassword"
							required>
					</div>
					
					<div class="form-group">
						<input type="submit" class="form-control btn btn-4" Value ="Submit">
					</div>
				</form>

			</div>
			<div class="col-md-3" style="margin-bottom: 30px;"></div>
		</div>
	</div>
</div>
<%@include file="clientFooter.jsp"%>