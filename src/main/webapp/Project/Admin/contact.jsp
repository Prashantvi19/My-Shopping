<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% if (session.getAttribute("Adminlogin") == null){

	response.sendRedirect("../client/singin.jsp?msg=login");
} %>
<%@ include file="headerAdmin.jsp"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="dot.java.moldel.*"%>

<div class="dashboard-ecommerce">
	<div class="container-fluid dashboard-content ">
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="page-header">
					<h2 class="pageheader-title">Admin Dashboard</h2>
					<div class="page-breadcrumb">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"
									class="breadcrumb-link">Admin Dashboard</a></li>
								<li class="breadcrumb-item active" aria-current="page">Home
									Page</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
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
			<h2 style="color: red">Something went wrong</h2>
		</div>
		<%
		}
		%>
		<%
		if (msg.equals("valid")) {
		%>
		<div class="heading">
			<h2 style="color: red">Product Successfully Updated</h2>
		</div>
		<%
		}
		if (msg.equals("canceled")) {
		%>
		<div class="heading">
			<h2 style="color: red">Product Update canceled</h2>
		</div>
		<%
		}
		}
		%>
		<!-- ============================================================== -->
		<!-- pageheader  -->
		<!-- ============================================================== -->

		<div class="container">

			<%
			ResultSet rs = null;

			String email = (String) session.getAttribute("email");
			String query = "SELECT * FROM `contactus` ORDER BY `contactus`.`id` DESC";
			%>
			<div class="row">
				<div class="product well col-12 " style="overflow-x: auto">

					<table
						class="table table-responsive{-sm|-md|-lg|-xl|-xxl} table-bordered table-sm table-hover table-striped">
						<thead>
							<tr>

								<th scope="col">S.No</th>

								<th scope="col">Email</th>
								<th scope="col">Subject</th>
								<th scope="col">Message</th>
							</tr>
						</thead>
						<tbody>
							<%
							try {
								PreparedStatement ps = DB_Connection.getDBConPs(query);

								System.out.println(ps);
								rs = SelectQuery.selectQuery(ps);
								int sn = 1;
								while (rs.next()) {
							%>
							<tr>
								<td scope="row"><%=sn++%></td>
								<td><%=rs.getString(2)%></td>
								<td><%=rs.getString(3)%></td>
								<td><%=rs.getString(4)%></td>

							</tr>
							<%
							}
							%>
						</tbody>
					</table>


				</div>
				<%
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

		<%@ include file="footerAdmin.jsp"%>