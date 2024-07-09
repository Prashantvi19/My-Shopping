package dot.java.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import dot.java.moldel.*;

/**
 * Servlet implementation class PlaceOrder
 */
@WebServlet("/placeOrderProduct")

public class PlaceOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PlaceOrder() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		boolean tridEmpty = true;

		String ordOp = request.getParameter("ordOp");
		String proID = request.getParameter("proID");
		String payment = request.getParameter("payment");
		String discount = request.getParameter("discount");
		String shippingCharge = request.getParameter("shippingCharge");
		String discountPer = request.getParameter("discountPer");
		String total = request.getParameter("total");
		String addrress = request.getParameter("addrress");
		String paymentOption = request.getParameter("paymentOption");
		String transactionID = request.getParameter("transactionID");
		String status = "Order is processing";

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmss");
		String billNo = dateFormat.format(new Date());

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");

		if (paymentOption.equals("Pay Online") == true) {
			if (transactionID.equals("null") == true || transactionID == null || transactionID.isEmpty() == true
					|| transactionID.isBlank() == true) {
				tridEmpty = false;
			}
		}

		if (addrress != null && tridEmpty == true) {

			if (transactionID.equals("null") == true || transactionID == null || transactionID.isEmpty() == true
					|| transactionID.isBlank() == true) {
				transactionID = "Cash";

			}
			try {
				if ("allDonePay".equals(ordOp)) {

					String query = "INSERT INTO `orderbill`(`email`, `orderDate`, `delivaryDate`, `payment`, `billPaid`, `discountPer`, `discount`, `shippingCharge`, `billNo`, `transactionId`, `status`, `addressId`,`paymentMethod`) VALUES (?,now(),DATE_ADD(orderDate,INTERVAL 7 DAY),?,?,?,?,?,?,?,?,?,?);";
					PreparedStatement ps = DB_Connection.getDBConPs(query);
					ps.setString(1, email);
					ps.setString(2, payment);
					ps.setString(3, total);
					ps.setString(4, discountPer);
					ps.setString(5, discount);
					ps.setString(6, shippingCharge);
					ps.setString(7, billNo);
					ps.setString(8, transactionID);
					ps.setString(9, status);
					ps.setString(10, addrress);
					ps.setString(11, paymentOption);

					System.out.println(ps);
					String msg = InsertData.insertData(ps);

					ps.close();

					if (msg.equals("valid")) {
						String query2 = "UPDATE `usercards` SET   `orderedDate` = NOW(),    `billNo` = ?,     `status` = ? WHERE    `billNo` IS NULL    AND `orderedDate` IS NULL   AND `status` IS NULL   AND `email` = ?;";
						PreparedStatement ps2 = DB_Connection.getDBConPs(query2);

						ps2.setString(1, billNo);
						ps2.setString(2, status);
						ps2.setString(3, email);

						System.out.println(ps2);
						String msg2 = InsertData.insertData(ps2);
						if (msg2.equals("valid")) {
							msg = "productsOrdered";
						}

						ps2.close();
					}
					response.sendRedirect("Project/client/cart.jsp?msg=" + msg);
				} else if ("od".equals(ordOp)) {
					String query = "INSERT INTO `orderbill`(`email`, `orderDate`, `delivaryDate`, `payment`, `billPaid`, `discountPer`, `discount`, `shippingCharge`, `billNo`, `transactionId`, `status`, `addressId`, `paymentMethod`) VALUES (?,now(),DATE_ADD(orderDate,INTERVAL 7 DAY),?,?,?,?,?,?,?,?,?,?);";
					PreparedStatement ps = DB_Connection.getDBConPs(query);
					ps.setString(1, email);
					ps.setString(2, payment);
					ps.setString(3, total);
					ps.setString(4, discountPer);
					ps.setString(5, discount);
					ps.setString(6, shippingCharge);
					ps.setString(7, billNo);
					ps.setString(8, transactionID);
					ps.setString(9, status);
					ps.setString(10, addrress);
					ps.setString(11, paymentOption);

					System.out.println(ps);
					String msg = InsertData.insertData(ps);

					ps.close();

					if (msg.equals("valid")) {
						String query2 = "UPDATE `usercards` SET   `orderedDate` = NOW(),    `billNo` = ?,     `status` = ? WHERE    `billNo` IS NULL AND `orderedDate` IS NULL   AND `status` IS NULL   AND `email` = ? AND `product_id` = ? ;";
						PreparedStatement ps2 = DB_Connection.getDBConPs(query2);

						ps2.setString(1, billNo);
						ps2.setString(2, status);
						ps2.setString(3, email);
						ps2.setNString(4, proID);

						System.out.println(ps2);
						String msg2 = InsertData.insertData(ps2);
						if (msg2.equals("valid")) {
							msg = "productOrdered";
						}
						ps2.close();
					}
					response.sendRedirect("Project/client/cart.jsp?msg=" + msg);
				} else {
					String msg = "backenError";
					response.sendRedirect("Project/client/cart.jsp?msg=" + msg);
				}
			} catch (Exception e) {
				System.out.println(e);
				String msg = "DatabaseError";
				response.sendRedirect("Project/client/cart.jsp?msg=" + msg);
			}
		} else {
			String msg = "adressOrTransactionId";
			response.sendRedirect("Project/client/cart.jsp?msg=" + msg);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
