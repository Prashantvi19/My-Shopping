<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% if (session.getAttribute("login") == null){

	response.sendRedirect("index.jsp?msg=login");
} %>

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
			if (msgc.equals("productsOrderCancled")) {
		%>
		<div class="heading">
			<h2 style="color: red">Order Canceled Successfully</h2>
		</div>
		<%
		}
		if (msgc.equals("somethingwrong")) {
		%>
		<div class="heading">
			<h2 style="color: red">Something went wrong</h2>
		</div>
		<%
		}
		if (msgc.equals("Upvalid")) {
		%>
		<div class="heading">
			<h2 style="color: red">Product already added quantity increased
			</h2>
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
					<li><a
						href="#">My Orders</a></li>
				</ul>
			</div>
		</div>
		<%
		ResultSet rs = null;
		ResultSet rs2 = null;
		int count = 1;
		String bill = "";
		String status = "cancled";
		String email = (String) session.getAttribute("email");
		try {
			String query = "SELECT * FROM `orderbill` AS ob INNER JOIN `addressusers` AS au ON ob.`addressId` = au.`id` AND ob.`email` = au.`email` WHERE ob.`email`=? AND au.`email`=? AND ob.`status` IS NOT NULL ;";
			PreparedStatement ps = DB_Connection.getDBConPs(query);
			ps.setString(1, email);
			ps.setString(2, email);
		
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
						<% bill = rs.getString(11); %>
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

							<th class="text-center" colspan="7"><a
								href="${pageContext.request.contextPath}/Project/client/myInvoice.jsp?billid=<%=rs.getString(1)%>&bill=<%=rs.getString(11)%>"
								class="btn btn-primary">Invoice Generate</a></th>

							<th class="text-center" colspan="6">
							<% if(status.equals(rs.getString(13))){ %>
							  Order Canceled
							<% }else if("Delivered".equals(rs.getString(13))){ %>
							Order Delivered
							<% }else {%>
							<a href="${pageContext.request.contextPath}/cancledOrderByUser?billid=<%=rs.getString(1)%>&bill=<%=rs.getString(11)%>"
								class="btn btn-primary">Cancel Order</a>
								
								<% }%>
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
											<th scope="col">Product</th>
										</tr>
									</thead>
									<tbody>
										
									<%
										try {
											
											String query2 = "SELECT * FROM `usercards` AS us INNER JOIN `products` AS p ON us.`product_id` = p.`id` WHERE `us`.`billNo` = ? AND `us`.`email` = ?  AND `us`.`status` IS NOT NULL AND `us`.`address_id` IS NOT NULL  AND `us`.`billNo` IS NOT NULL  AND `us`.`orderedDate` IS NOT NULL ;";
											PreparedStatement ps2 = DB_Connection.getDBConPs(query2);
											ps2.setString(1, bill);
											ps2.setString(2, email);

											System.out.println(ps2);
											rs2 = SelectQuery.selectQuery(ps2);
											int prCount = 1;
											while (rs2.next()) {
										%>
										<tr>
											<td scope="row"><%=prCount++%></td>
											<td><%=rs2.getString(12)%></td>
											<td><%=rs2.getString(13)%></td>											
											<td><%=rs2.getString(5)%></td>
											<td><%=rs2.getString(4)%></td>
											<td><%=rs2.getString(6)%></td>
											<td class=" text-center"><a
												href="${pageContext.request.contextPath}/Project/client/myProduct.jsp?proid=<%=rs2.getString(3)%>&bill=<%=bill%>"
												class="btn btn-primary">Visit </a></td>
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

<%@include file="clientFooter.jsp"%>