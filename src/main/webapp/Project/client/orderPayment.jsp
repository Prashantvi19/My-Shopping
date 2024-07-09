<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% if (session.getAttribute("login") == null){

	response.sendRedirect("index.jsp?msg=login");
} %>
<%@include file="clientHeader.jsp"%>
<div id="page-content" class="single-page">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<ul class="breadcrumb">
					<li><a
						href="${pageContext.request.contextPath}/Project/client/index.jsp">Home</a></li>
					<li><a
						href="#">Order Payment</a></li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6" style="margin-bottom: 30px;">
				<div class="row">
					<div class="pricedetails">
<%
								String total = request.getParameter("total");
								String shippingCharge = request.getParameter("shippingCharge");
								String discount = request.getParameter("discount");
								String discountPer = request.getParameter("discountPer");
								String payment = request.getParameter("payment");
								String addrress = request.getParameter("addrress");

								if (request.getParameter("proID").isEmpty() == true || request.getParameter("ordOp").isEmpty() == true 
										|| request.getParameter("total").isEmpty() == true || request.getParameter("payment") .isEmpty() == true 
										|| request.getParameter("discountPer").isEmpty() == true  || request.getParameter("shippingCharge").isEmpty() == true 
										|| request.getParameter("discount").isEmpty() == true ) {
								%>
								<div class="heading">
									<h2 style="color: red">Something is skip</h2>
								</div>
								<%
								}
								if (addrress.equals("null") == true || addrress == null || addrress.isEmpty() == true || addrress.isBlank() == true) {
								%>
								<div class="heading">
									<h2 style="color: red">Please add delivery Address</h2>
								</div>
								<%
								}
								%>


						<div class="col-md-4 col-md-offset-8">

							<table>
								
								<h6>Price Details</h6>
								<tr>
									<td>Total</td>
									<td><%=payment%></td>
								</tr>
								<tr>
									<td>Discount</td>
									<td><%=discount%></td>
								</tr>
								<tr>
									<td>Delivery</td>
									<td><%=shippingCharge%></td>
								</tr>
								<tr style="border-top: 1px solid #333">
									<td><h5>TOTAL:</h5></td>
									<td><%=total%></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="heading">
					<h2>Fill Payment Details</h2>
				</div>
				<form name="form1" id="ff1"
					action="${pageContext.request.contextPath}/placeOrderProduct"
					method="post">
					<div class="form-group">
						<label id="flexCheckDefault" class="form-check-label"
							for="TansactionId"> payment "2321344@paymentID" and Enter
							the Transaction ID </label> <input type="text" class="form-control"
							placeholder="Enter Payment Transaction ID:" name="transactionID"
							id="TansactionId"> <span><i>Note: If you
								select cash on delivery option so It is Mandatory to blank input
								field </i></span>
					</div>

					<div class=" form-group ">
						<label id="flexCheckDefault" for="TansactionId">Select
							Payment Option</label><br> <select class="form-control"
							name="paymentOption" id="pay">
							<option value="Cash On Delivery">Cash On Delivery</option>
							<option value="Pay Online">Pay Online</option>
						</select>
					</div>

					<div class="form-group">
						<input type="hidden" value="<%=request.getParameter("ordOp")%>"
							name="ordOp" id="password" required> <input type="hidden"
							value="<%=request.getParameter("proID")%>" name="proID"
							id="password" required> <input type="hidden"
							value="<%=total%>" name="total" id="password" required> <input
							type="hidden" value="<%=shippingCharge%>" name="shippingCharge"
							id="password"> <input type="hidden" value="<%=discount%>"
							name="discount" id="password"> <input type="hidden"
							value="<%=discountPer%>" name="discountPer" id="password">

						<input type="hidden" value="<%=payment%>" name="payment"
							id="password"> <input type="hidden" value="<%=addrress%>"
							name="addrress" id="password">

					</div>
					<%
					if (addrress.equals("null") != true && addrress != null && addrress.isEmpty() == false && addrress.isBlank() == false) {
					%>
					<div class="form-group">
						<input type="submit" class="form-control btn btn-4" value="Submit">
					</div>
					<%
					}
					%>
					<div class="form-group">
						<a
							href="${pageContext.request.contextPath}/Project/client/cart.jsp"
							class=" form-control btn btn-danger ">Cancel Order</a>
					</div>
				</form>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
</div>
<%@include file="clientFooter.jsp"%>