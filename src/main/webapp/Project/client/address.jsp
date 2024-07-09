<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% if (session.getAttribute("login") == null){

	response.sendRedirect("index.jsp?msg=login");
} %>
<%@include file="clientHeader.jsp" %>
<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.html">Home</a></li>
						<li><a href="account.html">Account</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
			<div class="col-md-3">
	
			<% String product = (String)request.getParameter("proId"); %>
			

				</div>
				<div class="col-md-6" style="margin-bottom: 30px;">
					<div class="heading"><h2>Add Address</h2></div>
					<form name="form1" id="ff1" action="${pageContext.request.contextPath}/addressuserAdd" method="post">
					
					
					<input type="hidden" name = "product" class="form-control btn btn-success" value="<%=product%>">
					
						 <div class="form-group">
							<input type="text" class="form-control" placeholder="Enter Address :" name="address" id="address" required>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Enter City :" name="city" id="city" required>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Enter State :" name="state" id="state" required>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Enter Country :" name="country" id="country" required>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Enter Mobile Number :" name="mobileNumber" id="mobileNumber" required>
						</div>
						<div class="form-group">
							<input type="submit" class="form-control btn btn-4" value ="Submit Address">
						</div>						
					</form>
				</div>
				<div class="col-md-3">
				</div>
			</div>
		</div>
	</div>
	<%@include file="clientFooter.jsp" %>