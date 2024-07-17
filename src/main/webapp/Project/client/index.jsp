<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="clientHeader.jsp"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="dot.java.moldel.*"%>

<div id="page-content" class="home-page">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<!-- Carousel -->
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators hidden-xs">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						<li data-target="#carousel-example-generic" data-slide-to="3"></li>
					</ol>
					<!-- Wrapper for slides -->
					<div class="carousel-inner">
						<div class="item active">
							<img src="images/main-banner1-1440x550.jpg" alt="First slide">
							<!-- Static Header -->
							<div class="header-text hidden-xs">
								<div class="col-md-12 text-center"></div>
							</div>
							<!-- /header-text -->
						</div>
						<div class="item">
							<img
								src="${pageContext.request.contextPath}/productsImages/photos_shopping/slider-2.jpg"
								alt="Second slide">
							<!-- Static Header -->
							<div class="header-text hidden-xs">
								<div class="col-md-12 text-center"></div>
							</div>
							<!-- /header-text -->
						</div>
						<div class="item">
							<img src="images/main-banner2-1440x550.jpg" alt="Second slide">
							<!-- Static Header -->
							<div class="header-text hidden-xs">
								<div class="col-md-12 text-center"></div>
							</div>
							<!-- /header-text -->
						</div>

						<div class="item">
							<img
								src="${pageContext.request.contextPath}/productsImages/photos_shopping/slider-1.jpg"
								alt="Second slide">
							<!-- Static Header -->
							<div class="header-text hidden-xs">
								<div class="col-md-12 text-center"></div>
							</div>
							<!-- /header-text -->
						</div>

					</div>
					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
				<!-- /carousel -->
			</div>
		</div>
		<div class="row">
			<div class="banner">
				<div class="col-sm-4">
					<img src="images/sub-banner1.jpg" />
				</div>
				<div class="col-sm-4">
					<img src="images/sub-banner2.png" />
				</div>
				<div class="col-sm-4">
					<img src="images/sub-banner3.png" />
				</div>
			</div>
		</div>
		<div class="row">
			<ul class="nav nav-tabs">
				<li class="active"><a href="${pageContext.request.contextPath}/Project/client/index.jsp">Refresh</a></li>
			</ul>
			<div class="tab-content">
				<%
				String msgc = "";
				msgc = request.getParameter("msg");
				if (msgc != null) {
					if (msgc.equals("productAdded")) {
				%>
				<div class="heading">
					<h2 style="color: red">Product Successfully Added</h2>
				</div>
				<%
				}
				if (msgc.equals("addToCartException")) {
				%>
				<div class="heading">
					<h2 style="color: red">Something went wrong</h2>
				</div>
				<%
				}
				if (msgc.equals("productQuantity")) {
				%>
				<div class="heading">
					<h2 style="color: red">Product already added quantity
						increased</h2>
				</div>
				<%
				}
				if (msgc.equals("login")) {
				%>
				<div class="heading">
					<h2 style="color: red">Please log in before proceeding.</h2>
				</div>
				<%
				}
				}
				%>
				<div id="featured" class="tab-pane fade in active">
					<div class="products">

						<div class="row">


							<%
							String rif = null;
							rif = request.getParameter("rif");
							if (rif != null) {
								String produact = request.getParameter("produact");
								int z = 0;
								if (rif.equals("searchResult") && rif != null) {

									ResultSet rs = null;

									String query = "SELECT * FROM `products` WHERE `activeStatus` = 'yes' AND (`productName` LIKE '%" + produact
									+ "%' OR `category` LIKE '%" + produact + "%');";

									try {
								PreparedStatement ps = DB_Connection.getDBConPs(query);
								rs = SelectQuery.selectQuery(ps);
								while (rs.next()) {
									z += 1;
							%>

							<div class="col-sm-4">
								<div class="product">
									<div class="image">
										<a href="#"><img
											src="${pageContext.request.contextPath}/productsImages/<%=rs.getString(6)%>" /></a>
										<ul class="buttons">
											<li><a class="btn btn-2 cart"
												href="${pageContext.request.contextPath}/addpocartproduct?product=<%=rs.getString(1)%>"><span
													class="glyphicon glyphicon-shopping-cart"></span></a>
										</ul>
									</div>
									<div class="caption">
										<div class="name">
											<h3>
												<a href="#"><%=rs.getString(2)%></a>
											</h3>
										</div>
										<div class="name">
											<h3>
												<a href="#">Category : <%=rs.getString(3)%></a>
											</h3>
										</div>
										<div class="price"><%=rs.getString(4)%><span>RS400</span>
										</div>
										<div class="rating">
											<span class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star-empty"></span>
										</div>
									</div>
								</div>
							</div>
							<%
							}
							if (z <= 0) {
							%>
							<div class="heading">
								<h2 style="color: red">No Results</h2>
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

							}
							} else {
							ResultSet rs = null;

							String query = "SELECT * FROM `products` WHERE `activeStatus` = 'yes';";

							try {
							PreparedStatement ps = DB_Connection.getDBConPs(query);
							rs = SelectQuery.selectQuery(ps);
							while (rs.next()) {
							%>
							<div class="col-sm-3">
								<div class="product">
									<div class="image">
										<a href="#"><img
											src="${pageContext.request.contextPath}/productsImages/<%=rs.getString(6)%>" /></a>
										<ul class="buttons">
											<li><a class="btn btn-2 cart"
												href="${pageContext.request.contextPath}/addpocartproduct?product=<%=rs.getString(1)%>"><span
													class="glyphicon glyphicon-shopping-cart"></span></a>
										</ul>
									</div>
									<div class="caption">
										<div class="name">
											<h3>
												<a href="#"><%=rs.getString(2)%></a>
											</h3>
										</div>
										<div class="name">
											<h3>
												<a href="#">Category : <%=rs.getString(3)%></a>
											</h3>
										</div>
										<div class="price"><%=rs.getString(4)%><span>RS400</span>
										</div>
										<div class="rating">
											<span class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star-empty"></span>
										</div>
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
							}
							%>
							<!-- end inner row -->
							<div class="clear"></div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="row">
			<div class="banner">
				<div class="col-sm-6">
					<img src="images/sub-banner4.jpg" />
				</div>
				<div class="col-sm-6">
					<img src="images/sub-banner5.jpg" />
				</div>
			</div>
		</div>
	</div>
</div>
<!-- <a id ="autoloadd" href="${pageContext.request.contextPath}/Project/client/profile.jsp">loadpage</a> -->
<script type="text/javascript">
	// Function to automatically click the anchor tag
	function autoClickAnchor() {
		document.getElementById("autoload").click();
	}

	// Add an event listener to call the function when the page loads
	//   window.onload = autoClickAnchor;
</script>

<%@ include file="clientFooter.jsp"%>