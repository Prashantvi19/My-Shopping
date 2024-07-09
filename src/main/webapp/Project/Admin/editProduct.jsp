<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% if (session.getAttribute("Adminlogin") == null){

	response.sendRedirect("../client/singin.jsp?msg=login");
} %>
<%@ include file="headerAdmin.jsp"%>
<%@ page import="dot.java.moldel.*"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<div class="dashboard-ecommerce">
	<div class="container-fluid dashboard-content ">
		<!-- ============================================================== -->
		<!-- pageheader  -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12"></div>
			<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
				<div class="card">
					<h5 class="card-header">Edit Product</h5>
					<div class="card-body">

						<%
						String pager = request.getParameter("msg1");
						String id = request.getParameter("PrIn");
						ResultSet rs = null;

						String query = "SELECT * FROM products WHERE `id` = ?;";

						try {
							PreparedStatement ps = DB_Connection.getDBConPs(query);
							ps.setString(1, id);
							rs = SelectQuery.selectQuery(ps);
							while (rs.next() && id != null) {
						%>

						<form method="post"
							action="${pageContext.request.contextPath}/productEditAdmin"
							id="basicform">
							<div class="form-group">
								<input id="inputProductID" type="hidden" name="productID"
									data-parsley-trigger="change" required value="<%=id%>"
									placeholder="productID" class="form-control">
									<input id="inputProductID" type="hidden" name="pager"
									data-parsley-trigger="change" required value="<%=pager%>"
									placeholder="productID" class="form-control"> <label
									for="inputUserName">Product Name</label> <input
									value="<%=rs.getString(2)%>" id="inputUserName" type="text"
									name="productName" data-parsley-trigger="change" required
									placeholder="Enter Product Name" class="form-control">
							</div>
							<div class="form-group">
								<label for="inputEmail">Category</label> <input id="inputEmail"
									value="<%=rs.getString(3)%>" type="text" name="category"
									data-parsley-trigger="change" required
									placeholder="Enter Category" class="form-control">
							</div>

							<div class="form-group">
								<label for="inputPassword">Price</label> <input
									value="<%=rs.getString(4)%>" id="inputPassword" type="number"
									placeholder="Product Price" required name="price"
									class="form-control">
							</div>
							<div class="form-group">
								<label for="inputRepeatPassword">Active Status</label> <select
									id="inputRepeatPassword" data-parsley-equalto="#inputPassword"
									required name="activeStatus" class="form-control">
									<option value="<%=rs.getString(5)%>" disabled>Select
										Active Status</option>
									<option value="yes">YES</option>
									<option value="no">NO</option>
								</select>

							</div>
							<div class="row">
								<div class="col-sm-12 pl-0 ">
									<p class="text-center ">
									<input type="submit" class="btn btn-space btn-primary"
											value="Submit">
									<% if(pager.equals("index")){ %>
										 <a href="${pageContext.request.contextPath}/Project/Admin/index.jsp?msg=canceled"
											class="btn btn-space btn-secondary">Cancel</a>
										<% }else if(pager.equals("lfep")){ %>
										<a href="${pageContext.request.contextPath}/Project/Admin/LsitForEditPage.jsp?msg=canceled"
											class="btn btn-space btn-secondary">Cancel</a>
											<% } %>
									</p>
								</div>
							</div>
						</form>
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
			</div>
			<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12"></div>
		</div>
		<%@ include file="footerAdmin.jsp"%>