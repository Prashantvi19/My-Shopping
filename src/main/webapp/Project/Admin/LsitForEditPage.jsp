<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (session.getAttribute("Adminlogin") == null) {

	response.sendRedirect("../client/singin.jsp?msg=login");
}
%>
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
								<li class="breadcrumb-item active" aria-current="page">Edit active and non-active product</li>
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
		if (msg.equals("ProductDidn'tEdit")) {
		%>
		<div class="heading">
			<h2 style="color: red">Something went wrong</h2>
		</div>
		<%
		}
		%>
		<%
		if (msg.equals("ProductEdit")) {
		%>
		<div class="heading">
			<h2 style="color: red">Product Successfully Updated</h2>
		</div>
		<%
		}
		if (msg.equals("failed")) {
		%>
		<div class="heading">
			<h2 style="color: red">Server Error</h2>
		</div>
		<%
		}
		if (msg.equals("ProductEditButUserCartStillShow")) {
		%>
		<div class="heading">
			<h2 style="color: red">The product has been updated, but it was
				not removed from the user cart.</h2>
		</div>
		<%
		}
		}
		%>
		<!-- ============================================================== -->
		<!-- pageheader  -->
		<!-- ============================================================== -->
		<div class="row">
			<%
			ResultSet rs = null;

			String query = "SELECT * FROM products;";

			try {
				PreparedStatement ps = DB_Connection.getDBConPs(query);
				rs = SelectQuery.selectQuery(ps);
				while (rs.next()) {
			%>

			<div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-12">
				<div class="product-thumbnail">

					<div class="product-img-head">
						<div class="product-img">
							<img
								src="${pageContext.request.contextPath}/productsImages/<%=rs.getString(6)%>"
								alt="" class="img-fluid">
						</div>
						<div class="ribbons"></div>
						<div class="ribbons-text">New</div>
						<div class="">
							<a href="#" class="product-wishlist-btn"><i
								class="fas fa-heart"></i></a>
						</div>
					</div>
					<div class="product-content">
						<div class="product-content-head">
							<h3 class="product-title">
								Product:
								<%=rs.getString(2)%></h3>

							<h3 class="product-title">
								Product Category :
								<%=rs.getString(3)%></h3>
							<h3 class="product-title">
								Product RS :
								<%=rs.getString(4)%></h3>

							<h3 class="product-title">
								Product Active Status :<%=rs.getString(5)%></h3>
							<div class="product-rating d-inline-block">
								<i class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i>
								<i class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i>
								<i class="fa fa-fw fa-star"></i>
							</div>

						</div>

						<div class="product-btn">
							<a
								href="${pageContext.request.contextPath}/Project/Admin/editProduct.jsp?PrIn=<%=rs.getInt(1)%>&msg1=lfep"
								class="btn btn-primary">Edit Product</a> </div>

					</div>
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
		<%@ include file="footerAdmin.jsp"%>