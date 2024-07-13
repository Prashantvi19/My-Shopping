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
								<li class="breadcrumb-item active" aria-current="page">Delivered Order List</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<%
		String msg = request.getParameter("msg");
		String msg2 = request.getParameter("msg2");
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
		if (msg.equals("OrderedBillUpdate") && msg2.equals("userCartUpdated") ) {
		%>
		<div class="heading">
			<h2 style="color: red">Order delivered status updated </h2>
		</div>
		<%
		}
		%>
		<%
		if (msg.equals("OrderedBillUpdate")==false && msg2.equals("userCartUpdated") == false) {
		%>
		<div class="heading">
			<h2 style="color: red">Something went wrong.</h2>
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
			ResultSet rs2 = null;
			int count = 1;
			String bill = "";
			String status = "cancled";
			String email = (String) session.getAttribute("email");
			try {
				String query = "SELECT * FROM `orderbill` AS ob INNER JOIN `addressusers` AS au ON ob.`addressId` = au.`id` AND ob.`email` = au.`email` WHERE ob.`status` = 'Delivered' AND ob.`status` IS NOT NULL ;";
				PreparedStatement ps = DB_Connection.getDBConPs(query);

				System.out.println(ps);
				rs = SelectQuery.selectQuery(ps);

				while (rs.next()) {
			%>
			<div class="row">
				<div class="product well col-12 " style="overflow-x: auto">
					<table
						class="table table-responsive{-sm|-md|-lg|-xl|-xxl} table-bordered table-sm table-hover table-striped">
						<thead>
							<tr>

								<th scope="col">S.No</th>
								<th scope="col">Bill Number</th>
								<th scope="col">Email</th>
								<th scope="col">Order Date</th>
								<th scope="col">Delivery Date</th>
								<th scope="col">Discount(%)</th>
								<th scope="col">Discount</th>
								<th scope="col">Shipping Charge</th>
								<th scope="col">Total Amount</th>
								<th scope="col">Bill Pay</th>
								<th scope="col">Order Status</th>
								<th scope="col">Transaction ID</th>
								<th scope="col">Payment method</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<%
								bill = rs.getString(11);
								%>
								<td scope="row"><%=count++%></td>
								<td><%=rs.getString(11)%></td>
								<td><%=rs.getString(2)%></td>
								<td><%=rs.getString(3)%></td>
								<td><%=rs.getString(4)%></td>
								<td><%=rs.getString(8)%></td>
								<td><%=rs.getString(9)%></td>
								<td><%=rs.getString(10)%></td>
								<td><%=rs.getString(5)%></td>
								<td><%=rs.getString(7)%></td>
								<td><%=rs.getString(13)%></td>
								<td><%=rs.getString(12)%></td>
								<td><%=rs.getString(6)%></td>

							</tr>
							<tr>
								<th scope="col" colspan="2">Address :</th>
								<td colspan="10"><%=rs.getString(16)%>,<%=rs.getString(17)%>,<%=rs.getString(18)%>,<%=rs.getString(19)%>,<%=rs.getString(20)%></td>

							</tr>
							<tr>



								<th class="text-center" colspan="13">
									<%
									if (status.equals(rs.getString(13))) {
									%> Order Canceled <%
									} else if ("Delivered".equals(rs.getString(13))) {
									%> Order Delivered <%
									} else {
									%> <a
									href="${pageContext.request.contextPath}/deleveredStatusUpdateByAdmin?billid=<%=rs.getString(1)%>&bill=<%=rs.getString(11)%>"
									class="btn btn-primary">Delivered</a> <% } %>
								</th>


							</tr>
							<tr>
								<td colspan="13">
									<table
										class="table table-responsive{-sm|-md|-lg|-xl|-xxl} table-bordered">

										<thead>
											<tr>
												<th colspan="7">Product:</th>

											</tr>

											<tr>
												<th scope="col">S.No</th>
												<th scope="col">Product Name</th>
												<th scope="col">Category</th>
												<th scope="col">Actual Price</th>
												<th scope="col">Quantity</th>
												<th scope="col">Total</th>

											</tr>
										</thead>
										<tbody>

											<%
											try {

												String query2 = "SELECT * FROM `usercards` AS us INNER JOIN `products` AS p ON us.`product_id` = p.`id` WHERE `us`.`billNo` = ?  AND `us`.`status` IS NOT NULL AND `us`.`address_id` IS NOT NULL  AND `us`.`billNo` IS NOT NULL  AND `us`.`orderedDate` IS NOT NULL ;";
												PreparedStatement ps2 = DB_Connection.getDBConPs(query2);
												ps2.setString(1, bill);

												System.out.println(ps2);
												rs2 = SelectQuery.selectQuery(ps2);
												int prCount = 1;
												while (rs2.next()) {
											%>
											<tr>
												<td scope="row"><%=prCount++%></td>
												<td><%=rs2.getString(12)%></td>
												<td><%=rs2.getString(13)%></td>
												<td><%=rs2.getString(4)%></td>
												<td><%=rs2.getString(5)%></td>
												<td><%=rs2.getString(6)%></td>

											</tr>
											<%
											}

											if (rs2.next()) {
											rs2.close();
											ps2.close();

											}

											} catch (Exception e) {
											System.out.println(e);
											}
											%>
										</tbody>
									</table>
								</td>
						</tbody>
					</table>
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


	<%@ include file="footerAdmin.jsp"%>