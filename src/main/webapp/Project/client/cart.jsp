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
		int count = 0;
		double total = 0;
		double shippingCharge = 160;
		double discount = 0;
		double discountPer = 15.5;
		double payment = 0;
		String addrress = "";

		String OrderID = "";
		String msgc = "";
		msgc = request.getParameter("msg");
		if (msgc != null) {
			if (msgc.equals("ProductRemoved")) {
		%>
		<div class="heading">
			<h2 style="color: red">Product Removed Successfully</h2>
		</div>
		<%
		}
		if (msgc.equals("invalid")) {
		%>
		<div class="heading">
			<h2 style="color: red">Something went wrong.</h2>
		</div>
		<%
		}
		if (msgc.equals("AddressUpdate")) {
		%>
		<div class="heading">
			<h2 style="color: red">Address Update Successfully.</h2>
		</div>
		<%
		}if (msgc.equals("quantityIncreased")) {
			%>
		<div class="heading">
			<h2 style="color: red">Quantity Increased. </h2>
		</div>
		<%
		}if (msgc.equals("quantityDicresed")) {
			%>
		<div class="heading">
			<h2 style="color: red">Quantity Decreased. </h2>
		</div>
		<%
		}if (msgc.equals("quantityIsOne")) {
			%>
		<div class="heading">
			<h2 style="color: red">Quantity can't be decreased below one. </h2>
		</div>
		<%
		}if (msgc.equals("productsOrdered")) {
			%>
		<div class="heading">
			<h2 style="color: red">Products ordered. </h2>
		</div>
		<%
		}if (msgc.equals("productOrdered")) {
			%>
		<div class="heading">
			<h2 style="color: red">Product ordered. </h2>
		</div>
		<%
		}if (msgc.equals("backenError")) {
			%>
		<div class="heading">
			<h2 style="color: red">Server Error please try again. </h2>
		</div>
		<%
		}if (msgc.equals("DatabaseError")) {
			%>
		<div class="heading">
			<h2 style="color: red">Database error please try again. </h2>
		</div>
		<%
		}if (msgc.equals("adressOrTransactionId")) {
			%>
		<div class="heading">
			<h2 style="color: red">Address or transaction ID is missing. Please add a delivery address or, if you have selected the online payment option, submit the payment transaction ID. </h2>
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
					<li><a href="#">My Cart</a></li>
				</ul>
			</div>
		</div>
		<%
		ResultSet rs = null;
		double totalPriceAllProduct = 0;

		String query = "SELECT pro.productName, pro.price, pro.imageAddress, pro.category,"
				+ " uc.product_id, uc.quantity, uc.total,"
				+ "ad.address, ad.city, ad.state, ad.country, ad.mobileNumber, uc.address_id"
				+ " FROM usercards AS uc INNER JOIN products AS pro ON uc.product_id = pro.id INNER JOIN addressusers AS ad ON uc.address_id = ad.id AND uc.email = ad.email WHERE uc.email = ? AND uc.`billNo` IS NULL    AND uc.`orderedDate` IS NULL   AND uc.`status` IS NULL ";
		String email = (String) session.getAttribute("email");

		try {
			PreparedStatement ps = DB_Connection.getDBConPs(query);
			ps.setString(1, email);
			System.out.println(ps);
			rs = SelectQuery.selectQuery(ps);

			while (rs.next()) {
				addrress = rs.getString(13);
				totalPriceAllProduct += rs.getInt(7);
				count++;
				OrderID += (String) rs.getString(5);
		%>

		<div class="row">
			<div class="product well">
				<div class="col-md-3">
					<div class="image">
						<img
							src="${pageContext.request.contextPath}/productsImages/<%= rs.getString(3)%>" />
					</div>
				</div>
				<div class="col-md-9">
					<div class="caption">
						<div class="name">
							<h3>
								<a href="#"><%=rs.getString(1)%></a>
							</h3>
						</div>
						<div class="name">
							<h3>
								<a href="#"><%=rs.getString(4)%></a>
							</h3>
						</div>
						<div class="price">
							Rs
							<%=rs.getString(2)%><span>$98</span>
						</div>
						<ul class="info">
							<li>Quantity : <%=rs.getString(6)%>
							</li>
							<li>Total Rs : <%=rs.getString(7)%></li>
							<%
							payment = rs.getInt(7);
							if (payment != 0) {
								discount = (discountPer / 100)* payment;
								total = payment - discount + shippingCharge;
							}
							%>
						</ul>
						<a
							href="${pageContext.request.contextPath}/userCartUpdate?proID=<%=rs.getString(5)%>&op=dec"
							class="btn btn-primary"> - </a>&nbsp;&nbsp;<label>
							Quantity </label>&nbsp;&nbsp;<a
							href="${pageContext.request.contextPath}/userCartUpdate?proID=<%=rs.getString(5)%>&op=in"
							class="btn btn-primary"> + </a>
						<hr>
						<h6>
							Address:
							<%=rs.getString(8)%>,<%=rs.getString(9)%>,<%=rs.getString(10)%>,<%=rs.getString(11)%>,<%=rs.getString(12)%></h6>
						<a
							href="${pageContext.request.contextPath}/Project/client/addAddressInProduct.jsp?proId=<%=rs.getString(5)%>"
							class="btn btn-primary">Add new/Other Address </a>
						<hr>
						<span class="btn btn-primary pull-right"><a
							href="${pageContext.request.contextPath}/Project/client/orderPayment.jsp?proID=<%=rs.getString(5)%>&ordOp=od&payment=<%=rs.getString(7)%>&discount=<%=discount%>&shippingCharge=<%=shippingCharge%>&discountPer=<%=discountPer%>&total=<%=total%>&addrress=<%=addrress%>"
							class="btn btn-success">Order</a> <a
							href="${pageContext.request.contextPath}/userCartUpdate?proID=<%=rs.getString(5)%>&op=re"
							class="btn btn-3 pull-right">REMOVE</a> </span>
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
		<%
		ResultSet rs2 = null;
		String query2 = "SELECT pro.productName, pro.price, pro.imageAddress, pro.category,"
				+ " uc.product_id, uc.quantity, uc.total,uc.address_id"
				+ " FROM usercards AS uc INNER JOIN products AS pro ON uc.product_id = pro.id WHERE uc.email = ? AND uc.address_id IS NULL AND uc.`billNo` IS NULL    AND uc.`orderedDate` IS NULL   AND uc.`status` IS NULL ; ";

		try {
			PreparedStatement ps2 = DB_Connection.getDBConPs(query2);
			ps2.setString(1, email);
			System.out.println(ps2);
			rs2 = SelectQuery.selectQuery(ps2);

			while (rs2.next()) {
				addrress = rs2.getString(8);
				totalPriceAllProduct += rs2.getInt(7);
				OrderID += (String) rs2.getString(5);
				count++;
		%>

		<div class="row">
			<div class="product well">
				<div class="col-md-3">
					<div class="image">
						<img
							src="${pageContext.request.contextPath}/productsImages/<%=rs2.getString(3)%>" />
					</div>
				</div>
				<div class="col-md-9">
					<div class="caption">
						<div class="name">
							<h3>
								<a href="#"><%=rs2.getString(1)%></a>
							</h3>
						</div>
						<div class="name">
							<h3>
								<a href="#"><%=rs2.getString(4)%></a>
							</h3>
						</div>
						<div class="price">
							Rs
							<%=rs2.getString(2)%><span>$98</span>
						</div>
						<ul class="info">
							<li>Quantity : <%=rs2.getString(6)%>
							</li>
							<li>Total Rs : <%=rs2.getString(7)%></li>

							<%
							payment = rs2.getInt(7);
							if (payment != 0) {
								discount = (discountPer / 100)* payment;
								total = payment - discount + shippingCharge;
							}
							%>
						</ul>
						<a
							href="${pageContext.request.contextPath}/userCartUpdate?proID=<%=rs2.getString(5)%>&op=dec"
							class="btn btn-primary"> - </a>&nbsp;&nbsp;<label>
							Quantity </label>&nbsp;&nbsp;<a
							href="${pageContext.request.contextPath}/userCartUpdate?proID=<%=rs2.getString(5)%>&op=in"
							class="btn btn-primary"> + </a>
						<hr>
						<a
							href="${pageContext.request.contextPath}/Project/client/addAddressInProduct.jsp?proId=<%=rs2.getString(5)%>"
							class="btn btn-primary">Add new/Other Address </a>
						<hr>
						<span class="btn btn-primary pull-right"><a
							href="${pageContext.request.contextPath}/Project/client/orderPayment.jsp?proID=<%=rs2.getString(5)%>&ordOp=od&payment=<%=rs2.getString(7)%>&discount=<%=discount%>&shippingCharge=<%=shippingCharge%>&discountPer=<%=discountPer%>&total=<%=total%>&addrress=<%=addrress%>"
							class="btn btn-success">Order</a> <a
							href="${pageContext.request.contextPath}/userCartUpdate?proID=<%=rs2.getString(5)%>&op=re"
							class="btn btn-3 pull-right">REMOVE</a> </span>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>

		<%
		}
		if (rs.next()) {
		rs.close();
		ps2.close();
		DB_Connection.DBClose();
		}

		} catch (Exception e) {
		System.out.println(e);
		}
		if (totalPriceAllProduct != 0) {		     
		total = totalPriceAllProduct - discount + shippingCharge;
		}
		%>


		<%
		if (count <= 0) {
		%>
		<div class="heading">
			<h2 style="color: red">Empty Cart, Please add products</h2>
		</div>

		<div class="row">
			<div class="col-md-4 col-md-offset-8 ">
				<center>
					<a
						href="${pageContext.request.contextPath}/Project/client/index.jsp"
						class="btn btn-1">Continue To Shopping</a>
				</center>
			</div>
		</div>
		<%
		} else {
		%>
		<div class="row">
			<div class="col-md-4  ">
				<a
					href="${pageContext.request.contextPath}/Project/client/addAddressInProduct.jsp?proId=doneCountAdd"
					class="btn btn-primary">Add Address for all </a>

			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-8 ">
				<center>
					<a
						href="${pageContext.request.contextPath}/Project/client/index.jsp"
						class="btn btn-1">Continue To Shopping</a>
				</center>
			</div>
		</div>
		<div class="row">
			<div class="pricedetails">
				<div class="col-md-4 col-md-offset-8">
					<table>
						<h6>Price Details</h6>
						<tr>
							<td>Total</td>
							<td><%=totalPriceAllProduct%></td>
						</tr>
						<tr>
							<td>Discount 15.5%</td>
							<td><%=discount%></td>
						</tr>
						<tr>
							<td>Delivery Charges</td>
							<td><%=shippingCharge%></td>
						</tr>
						<tr style="border-top: 1px solid #333">
							<td><h5>TOTAL:</h5></td>
							<td><%=total%></td>
						</tr>
					</table>
					<center>
						<a
							href="${pageContext.request.contextPath}/Project/client/orderPayment.jsp?ordOp=allDonePay&proID=<%=OrderID%>&payment=<%=totalPriceAllProduct%>&discount=<%=discount%>&shippingCharge=<%=shippingCharge%>&discountPer=<%=discountPer%>&total=<%=total%>&addrress=<%=addrress%>"
							class="btn btn-1">Order All Add Products</a>
					</center>
				</div>
			</div>
		</div>
		<%
		}
		%>
	</div>
</div>

<%@include file="clientFooter.jsp"%>