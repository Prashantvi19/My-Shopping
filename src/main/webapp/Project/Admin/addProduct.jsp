<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (session.getAttribute("Adminlogin") == null) {

	response.sendRedirect("../client/singin.jsp?msg=login");
}
%>
<%@ include file="headerAdmin.jsp"%>
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
								<li class="breadcrumb-item active" aria-current="page"> Add Product</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- pageheader  -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12"></div>
			<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
				<div class="card">
					<h5 class="card-header">Add Product</h5>
					<div class="card-body">
						<%
						String msg = request.getParameter("msg");
						if (msg != null) {
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
							<h2 style="color: red">Product Successfully Added</h2>
						</div>
						<%
						}if (msg.equals("fileError")) {
							%>
							<div class="heading">
								<h2 style="color: red">Product photo error</h2>
							</div>
							<%
							}
						}
						%>
						<form method="post"
							action="${pageContext.request.contextPath}/productAddAdmin"
							id="basicform" enctype='multipart/form-data'
							data-parsley-validate="">
							<div class="form-group">
								<label for="inputUserName">Product Name</label> <input
									id="inputUserName" type="text" name="productName"
									data-parsley-trigger="change" required
									placeholder="Enter Product Name" class="form-control">
							</div>
							<div class="form-group">
								<label for="inputEmail">Category</label> <input id="inputEmail"
									type="text" name="category" data-parsley-trigger="change"
									required placeholder="Enter Category" class="form-control">
							</div>
							<div class="form-group">
								<label for="inputPassword">Price</label> <input
									id="inputPassword" type="number" placeholder="Product Price"
									required name="price" class="form-control">
							</div>
							<div class="form-group">
								<label for="inputRepeatPassword">Active Status</label> <select
									id="inputRepeatPassword" data-parsley-equalto="#inputPassword"
									required name="activeStatus" class="form-control">
									<option selected disabled>Select Active Status</option>
									<option value="yes">YES</option>
									<option value="no">NO</option>
								</select>

							</div>
							<div class="form-group">
								<label for="inputUserName">Product Image</label> <input
									id="inputUserName" type="file" name="productImage"
									data-parsley-trigger="change" required class="form-control">
							</div>
							<div class="row">
								<div class="col-sm-6 pl-0">
									<p class="text-right">
										<input type="submit" class="btn btn-space btn-primary"
											value="Submit"> <a
											href="${pageContext.request.contextPath}/Project/Admin/addProduct.jsp"
											class="btn btn-space btn-secondary">Cancel</a>
									</p>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12"></div>
		</div>
		<%@ include file="footerAdmin.jsp"%>