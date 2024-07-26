
<%@ page import="java.io.IOException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="dot.java.moldel.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description"
	content="Free Bootstrap Themes by Zerotheme dot com - Free Responsive Html5 Templates">
<meta name="author" content="https://www.Zerotheme.com">

<title>My Shopping</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

<!-- Custom CSS -->
<link rel="stylesheet" href="css/style.css">


<!-- Custom Fonts -->
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="fonts/font-slider.css" type="text/css">

<!-- jQuery and Modernizr-->
<script src="js/jquery-2.1.1.js"></script>


<!-- Core JavaScript Files -->
<script src="js/bootstrap.min.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->
<%
String logins = (String) session.getAttribute("login");
String emails = (String) session.getAttribute("email");
String totalCart = "0";

if ("login".equals(logins)) {
	String query = "SELECT count(`id`) as totalcart FROM `usercards` WHERE `email`= ? AND `status` IS NULL AND `billNo` IS NULL AND `orderedDate` IS NULL;";
	ResultSet rss;
	try {
		PreparedStatement pss = DB_Connection.getDBConPs(query);
		pss.setString(1, emails);
		System.out.println(pss);
		rss = SelectQuery.selectQuery(pss);
		if (rss.next()) {
	totalCart = rss.getString("totalcart");
	rss.close();
	pss.close();
	DB_Connection.DBClose();
		}
	} catch (Exception e) {
		System.out.println(e);
		response.sendRedirect("Project/client/singin.jsp?msg=invalid");
	}
}

String url = " ";
String lavel = " ";
String sec = (String) session.getAttribute("login");
if (session.getAttribute("login") != null) {
	url = "../Admin/logout.jsp?msg=client";
	lavel = "Logout";

} else {
	url = "../client/singin.jsp";
	lavel = "Login";

}
%>
</head>

<body>
	<!--Top-->
	<nav id="top">
		<div class="container">
			<div class="row">
				<div class="col-xs-6">
					<select class="language">
						<option value="English" selected>English</option>
						<option value="France">France</option>
						<option value="Germany">Germany</option>
					</select> <select class="currency">
						<option value="USD" selected>USD</option>
						<option value="EUR">EUR</option>
						<option value="DDD">DDD</option>
					</select>
				</div>
				<div class="col-xs-6">
					<ul class="top-link">
						<li><a href="<%=url%>"> <span
								class="glyphicon glyphicon-user"></span> <%=lavel%>
						</a></li>
						<li><a
							href="${pageContext.request.contextPath}/Project/client/contact.jsp"><span
								class="glyphicon glyphicon-envelope"></span>Contact</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<!--Header-->
	<header>
		<div class="container">
			<div class="row">
				<div class="col-md-1">
					<div id="logo">
						<img
							src="${pageContext.request.contextPath}/productsImages/myShopping logo.png" />
					</div>
				</div>
				<div class="col-md-11 text-right">
					<div class="phone">
						<span class="glyphicon glyphicon-earphone"></span>+9182*****76
					</div>
					<div class="mail">
						<span class="glyphicon glyphicon-envelope"></span>infojava@gmail.com
					</div>
					<form class="form-search"
						action="${pageContext.request.contextPath}/Project/client/index.jsp"
						method="get">
						<input class="form-control" type="hidden" name="rif"
							value="searchResult"> <input type="text" name="produact"
							placeholder="Search.." class="input-medium search-query">
						<button type="submit" class="btn">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</form>
				</div>
				<div id="cart">
					<a class="btn btn-cart"
						href="${pageContext.request.contextPath}/Project/client/cart.jsp"><span
						class="glyphicon glyphicon-shopping-cart"></span>My CART<strong><%=totalCart%></strong></a>
				</div>
			</div>
		</div>
	</header>
	<!--Navigation-->
	<nav id="menu" class="navbar">
		<div class="container">
			<div class="navbar-header">
				<span id="heading" class="visible-xs">Categories</span>
				<button type="button" class="btn btn-navbar navbar-toggle"
					data-toggle="collapse" data-target=".navbar-ex1-collapse">
					<i class="fa fa-bars"></i>
				</button>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav">
					<li><a
						href="${pageContext.request.contextPath}/Project/client/index.jsp">Home</a></li>
					<li><a
						href="${pageContext.request.contextPath}/Project/client/myOrders.jsp">My
							Orders</a></li>
					<li><a
						href="${pageContext.request.contextPath}/Project/client/profile.jsp">My
							Profile</a></li>
					<li><a
						href="${pageContext.request.contextPath}/Project/client/contact.jsp">Contact
							Us</a></li>
					<li><a
						href="${pageContext.request.contextPath}/Project/client/feedback.jsp">Feedback</a></li>
					<li><a
						href="${pageContext.request.contextPath}/Project/client/aboutUs.jsp">About
							Us</a></li>
				</ul>
			</div>
		</div>
	</nav>