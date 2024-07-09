<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (session.getAttribute("login") == null) {

	response.sendRedirect("index.jsp?msg=login");
}
%>
<%@include file="clientHeader.jsp"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="dot.java.moldel.*"%>
<div id="page-content" class="single-page">
	<div class="container">
		<%
		String msgc = "";
		msgc = request.getParameter("msg");
		if (msgc != null) {
			if (msgc.equals("mobileNumberChanged")) {
		%>
		<div class="heading">
			<h2 style="color: red">Mobile Number Updated</h2>
		</div>
		<%
		}
		if (msgc.equals("incurrectPassword")) {
		%>
		<div class="heading">
			<h2 style="color: red">Wrong Password</h2>
		</div>
		<%
		}
		if (msgc.equals("QuestionSecurityChanged")) {
		%>
		<div class="heading">
			<h2 style="color: red">Security Question Updated</h2>
		</div>
		<%}
		if (msgc.equals("PasswordChanged")) {
		%>
		<div class="heading">
			<h2 style="color: red">Password changed.</h2>
		</div>
		<%
		}if (msgc.equals("incorrectOldPassword")) {
			%>
		<div class="heading">
			<h2 style="color: red">Old Password incorrect.</h2>
		</div>
		<%
			} if (msgc.equals("newPasswordConfirim")) {
				%>
		<div class="heading">
			<h2 style="color: red">confirm password didn't match</h2>
		</div>
		<%
		 } if (msgc.equals("tryAgain")) { %>
		<div class="heading">
			<h2 style="color: red">something went wrong please try again</h2>
		</div>
		<%
	    }if (msgc.equals("Auth")) {
			%>
		<div class="heading">
			<h2 style="color: red">User data didn't matched</h2>
		</div>
		<%
		}if (msgc.equals("databaseError")) {
	 %>
		<div class="heading">
			<h2 style="color: red">Server error try again</h2>
		</div>
		<%
}
		}
		%>
		<div class="row">
			<div class="col-lg-12">
				<ul class="breadcrumb">
					<li><a
						href="${pageContext.request.contextPath}/Project/client/index.jsp">Home</a></li>
					<li><a href="#">My profile</a></li>
				</ul>
			</div>
		</div>
		<%
		ResultSet rs = null;
		double totalPriceAllProduct = 0;

		String query = "SELECT * FROM `user` WHERE `email`=?";
		String email = (String) session.getAttribute("email");

		try {
			PreparedStatement ps = DB_Connection.getDBConPs(query);
			ps.setString(1, email);
			System.out.println(ps);
			rs = SelectQuery.selectQuery(ps);

			while (rs.next()) {
		%>
		<div class="row">
			<div class="product well">
				<div class="col-md-3">
					<div class="image">
						<img
							src="${pageContext.request.contextPath}/productsImages/profile-user-icon.jpg" />
					</div>
				</div>
				<div class="col-md-9">
					<div class="caption">
						<div class="name">
							<h3>
								<b> Name:</b>
								<%=rs.getString(2)%>
							</h3>
						</div>
						<div class="name">
							<h3>
								<b> Email:</b>
								<%=rs.getString(3)%>
							</h3>
						</div>
						<div class="name">
							<h3>
								<b> Mobile Number:</b><%=rs.getString(4)%><a
									href="${pageContext.request.contextPath}/Project/client/changeNumber.jsp"
									class="btn btn-primary pull-right "> Update Mobile Number </a>
							</h3>
						</div>
						<div class="name">
							<h3>
								<b> Gender:</b>
								<%=rs.getString(5)%>
							</h3>
						</div>

						<div class="name ">
							<h3>
								<b> Security Question:</b><%=rs.getString(6)%>
								<a
									href="${pageContext.request.contextPath}/Project/client/changeSecurityQuestion.jsp?Userid=<%=rs.getString(1)%>"
									class="btn btn-primary pull-right "> Update Security
									Question </a>
							</h3>
							<a
								href="${pageContext.request.contextPath}/Project/client/changePassword.jsp?Userid=<%=rs.getString(1)%>"
								class="btn btn-warning pull-right">Change Password</a>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<%
		}
		if (rs.next()) {
		rs.close();
		ps.close();
		DB_Connection.DBClose();
		}

		} catch (Exception e) {
		System.out.println(e);
		}
		%>
	</div>
</div>

<%@include file="clientFooter.jsp"%>