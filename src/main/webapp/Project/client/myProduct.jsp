<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="clientHeader.jsp"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="dot.java.moldel.*"%>
<div id="page-content" class="single-page">
	<div class="container">
		<%
		String msgc = "";
		msgc = request.getParameter("msgc");
		if (msgc != null) {
			if (msgc.equals("valid")) {
		%>
		<div class="heading">
			<h2 style="color: red">Product Removed</h2>
		</div>
		<%
		}
		if (msgc.equals("invalid")) {
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
					<li><a href="#">My Product</a></li>
				</ul>
			</div>
		</div>

		<%
		String proid = request.getParameter("proid");
		String bill = request.getParameter("bill");
		String email = (String) session.getAttribute("email");
		ResultSet rs2 = null;
		String query2 = "SELECT pro.`productName`, pro.`price`, pro.`imageAddress`, pro.`category`, uc.`product_id`, uc.`quantity`, uc.`total`, uc.`status` FROM `usercards` AS uc INNER JOIN `products` AS pro ON uc.`product_id` = pro.`id` WHERE  uc.`email` = ? AND uc.`product_id`= ? AND uc.`billNo` =?  AND uc.`address_id` IS  NOT NULL AND uc.`billNo` IS NOT NULL  AND uc.`orderedDate` IS NOT NULL  AND uc.`status` IS NOT NULL ; ";

		try {
			PreparedStatement ps2 = DB_Connection.getDBConPs(query2);
			ps2.setString(1, email);
			ps2.setString(2, proid);
			ps2.setString(3, bill);

			System.out.println(ps2);
			rs2 = SelectQuery.selectQuery(ps2);

			while (rs2.next()) {
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
							<h3>Product : 
								<a href="#"><%=rs2.getString(1)%></a>
							</h3>
						</div>
						<div class="name">
							<h3>Category : 
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

						</ul>
						<div class="name">
							<h3>
								<b> Status : </b>
								<%=rs2.getString(8)%>
							</h3>
						</div>
						<hr>
						<a
							href="${pageContext.request.contextPath}/Project/client/myOrders.jsp"
							class="btn pull-right btn-primary">Back</a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>

		<%
		}
		if (rs2.next()) {
		rs2.close();
		ps2.close();
		DB_Connection.DBClose();
		}

		} catch (Exception e) {
		System.out.println(e);
		}
		%>

	</div>
</div>

<%@include file="clientFooter.jsp"%>