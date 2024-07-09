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
		<div class="row">
			<div class="col-lg-12">
				<ul class="breadcrumb">
					<li><a
						href="${pageContext.request.contextPath}/Project/client/index.jsp">Home</a></li>
					<li><a href="#">Add Address</a></li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-1" style="margin-bottom: 30px;"></div>
			<div class="col-md-10">
				<div class="heading">
					<h1 style="text: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address
						Select.</h1>
				</div>
				<%
				String email = (String) session.getAttribute("email");
				String product = request.getParameter("proId");

				String msg = request.getParameter("msg");
				if (msg != null) {

					if (msg.equals("invalidInAdress")) {
				%>
				<div class="heading">
					<h2 style="color: red">Something went wrong</h2>
				</div>
				<%
				}
				%>
				<%
				if (msg.equals("unExpectedError")) {
				%>
				<div class="heading">
					<h2 style="color: red">Unexpected Error</h2>
				</div>
				<%
				}
				if (msg.equals("addedNewAdress")) {
				%>
				<div class="heading">
					<h2 style="color: red">New Address added select and submit</h2>
				</div>
				<%
				}
				if (msg.equals("error")) {
				%>
				<div class="heading">
					<h2 style="color: red">Something went wrong</h2>
				</div>
				<%
				}if (msg.equals("Auth")) {
					%>
					<div class="heading">
						<h2 style="color: red">User data didn't match</h2>
					</div>
					<%
					}
				}
				%>
				<form id="ff2"
					action="${pageContext.request.contextPath}/addAddressInProduct"
					method="post">
					<%
					ResultSet rs = null;
					int count = 0;

					String query = "SELECT * FROM `addressusers` WHERE email = ?;";

					try {
						PreparedStatement ps = DB_Connection.getDBConPs(query);
						ps.setString(1, email);
						rs = SelectQuery.selectQuery(ps);
						while (rs.next()) {
							count++;
					%>

					<div class="form-check">

						<label id="flexCheckDefault" class="form-check-label"
							for="flexCheckDefault">Address(<%=count%>) :- <input
							name="address_id" class="form-check-input" type="radio"
							value="<%=rs.getString(1)%>">&nbsp;&nbsp; Address <%=rs.getString(2)%>,City
							<%=rs.getString(3)%>,State <%=rs.getString(4)%> Country <%=rs.getString(5)%>,Mobile
							Number <%=rs.getString(6)%></label>

					</div>
					<hr>

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
					<%
					if (count <= 0) {
					%>
					<div class="heading">
						<h2 style="color: red">No Address found please add new
							address</h2>
					</div>
					<%
					}
					%>
					<div class="form-group">
						<input type="hidden" name="product_id"
							class="form-control btn btn-success" value="<%=product%>">
						<input type="submit" class="form-control btn btn-success"
							value="Submit">


					</div>
					<div class="form-group">
						<a
							href="${pageContext.request.contextPath}/Project/client/address.jsp?proId=<%= product %>"
							class=" form-control btn btn-primary ">Add New Address?</a>
					</div>
				</form>

			</div>
			<div class="col-md-1" style="margin-bottom: 30px;"></div>
		</div>
	</div>
</div>
<%@include file="clientFooter.jsp"%>