<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Online Shopping Application - Feature Breakdown</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="styles.css">
<style type="text/css">
body {
	background-color: #f8f9fa;
}

.client-side-features {
	background-color: #e9ecef;
	padding: 20px;
	border-radius: 5px;
}

.admin-panel-features {
	background-color: #e2e3e5;
	padding: 20px;
	border-radius: 5px;
}

h2 {
	margin-top: 20px;
}

h3 {
	margin-top: 15px;
}

ul {
	list-style-type: none;
	padding-left: 0;
}

li {
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-12 m-4">
				<ul class="nav nav-tabs text-center">
					<li class=""><a class=" btn btn-primary "
						href="${pageContext.request.contextPath}/Project/client/index.jsp">Back
							to Home Page</a></li>
				</ul>
			</div>
		</div>
		<div class="row">

			<!-- Client-Side Features -->
			<div class="col-md-6 client-side-features">
				<h2>Client-Side Features</h2>
				<h3>Index Page</h3>
				<ul>
					<li><b>Add to Cart:</b>Users can add products to their cart
						with a single click.</li>
					<li><b>Quantity Increment:</b>If a product is added multiple
						times, the quantity in the cart is increased instead of creating
						duplicate entries.</li>
					<li><b>Product Search:</b>Users can search for products by
						name or category.</li>
					<li><b>Cart Indicator:</b>Logged-in users can view the total
						number of items in their cart.</li>
				</ul>
				<h3>My Cart Page</h3>
				<ul>
					<li><b>Remove Product:</b>Users can remove individual items
						from their cart.</li>
					<li><b>Place Order:</b>Users can place an order for all or
						selected items in the cart.</li>
					<li><b>Quantity Adjustment:</b>Users can increase or decrease
						the quantity of items in their cart.</li>
					<li><b>Add Address:</b>Users can add shipping addresses for
						individual or all products in the cart.</li>
				</ul>
				<h3>Order Page</h3>
				<ul>
					<li><b>Order History:</b>Users can view their order history,
						including delivered, canceled, and processing orders.</li>
					<li><b>Order Cancellation:</b>Users can cancel orders (within
						a specified timeframe).</li>
					<li><b>Order Details:</b>Users can view details of specific
						orders.</li>
					<li><b>Invoice Generation:</b>Users can generate and print
						invoices for completed orders.</li>
				</ul>
				<h3>My Profile Page</h3>
				<ul>
					<li><b>User Information:</b>Users can view their personal
						information (name, email, mobile number, security question).</li>
					<li><b>Mobile Number Update:</b>Users can update their mobile
						number.</li>
					<li><b>Security Question Change:</b>Users can change their
						security question.</li>
					<li><b>Password Change:</b>Users can change their password.</li>
				</ul>
				<h3>Additional Features</h3>
				<ul>
					<li><b>Feedback:</b>Logged-in users can provide feedback.</li>
					<li><b>Contact Us:</b>Users can contact customer support.</li>
					<li><b>User Authentication:</b>Users can sign in, sign up, or
						log out.</li>
				</ul>
			</div>
			<!-- Admin Panel Features -->
			<div class="col-md-6 admin-panel-features">
				<h2>Admin Panel Features</h2>
				<h3>Home Page</h3>
				<ul>
					<li><b>Product Listing:</b>Displays all active products with
						editable details.</li>
					<li><b>Product Search:</b>Admin can search for products by
						name or category.</li>
					<li><b>Product Deactivation:</b>Admin can deactivate products,
						removing them from user carts and preventing new additions.</li>
				</ul>
				<h3>Product Management Page</h3>
				<ul>
					<li><b>Product Listing:</b>Displays all products, including
						active and inactive ones.</li>
					<li><b>Product Editing:</b>Admin can edit product details
						(price, name, category, status) for both active and inactive
						products.</li>
					<li><b>Product Activation/Deactivation:</b>Admin can activate
						or deactivate products.</li>
				</ul>
				<h3>Add Product Page</h3>
				<ul>
					<li><b>Product Creation:</b>Admin can add new products to the
						inventory.</li>
				</ul>
				<h3>Order Management</h3>
				<ul>
					<li><b>Received Orders:</b>Displays all orders that have been
						placed.</li>
					<li><b>Delivered Orders:</b>Displays all orders that have been
						delivered.</li>
					<li><b>Canceled Orders:</b>Displays all orders that have been
						canceled.</li>
					<li><b>Order Fulfillment:</b>Admin can mark orders as
						delivered.</li>
				</ul>
				<h3>Feedback and Contact</h3>
				<ul>
					<li><b>Feedback Management:</b>Admin can view and manage user
						feedback.</li>
					<li><b>Contact Inquiries:</b>Admin can view and respond to
						customer inquiries.</li>
				</ul>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>