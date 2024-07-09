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

import dot.java.moldel.DB_Connection;
import dot.java.moldel.InsertData;
import dot.java.moldel.SelectQuery;

/**
 * Servlet implementation class CartRemoveUpdateQuantity
 */
@WebServlet("/userCartUpdate")
public class CartRemoveUpdateQuantity extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartRemoveUpdateQuantity() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public static ResultSet priceFun(String email, String productId) {
		String query = "SELECT * FROM `usercards` WHERE `email`= ? AND product_id = ? AND `billNo` IS NULL    AND `orderedDate` IS NULL   AND `status` IS NULL ;";
		try {
			PreparedStatement ps = DB_Connection.getDBConPs(query);
			ps.setString(1, email);
			ps.setString(2, productId);
			System.out.println(ps);
			ResultSet rs = SelectQuery.selectQuery(ps);
			System.out.println(rs);
			return rs;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		String id = request.getParameter("proID");
		String operation = request.getParameter("op");

		String email = " ";
		String query3 = "";
		ResultSet rs = null;

		int price = 1;
		int quantity = 1;
		int total = 1;
		HttpSession session = request.getSession();

		String login = (String) session.getAttribute("login");
		if (login == null) {
			response.sendRedirect("Project/client/singin.jsp?msg=needLogin");
		} else if (login == "login") {
			email = (String) session.getAttribute("email");

			try {
				if ("in".equals(operation)) {
					rs = priceFun(email, id);

					if (rs.next()) {
						price = rs.getInt("price");
						quantity += rs.getInt("quantity");
						total = price * quantity;

						query3 = "UPDATE `usercards` SET `quantity` = ? ,`total`= ? , `price`= ? WHERE `email`= ? AND product_id = ? AND `billNo` IS NULL AND `orderedDate` IS NULL   AND `status` IS NULL ;";
						PreparedStatement ps3 = DB_Connection.getDBConPs(query3);
						ps3.setInt(1, quantity);
						ps3.setInt(2, total);
						ps3.setInt(3, price);
						ps3.setString(4, email);
						ps3.setString(5, id);

						System.out.println(ps3);
						String msg = InsertData.insertData(ps3);
						if (msg.equals("valid")) {
							msg = "quantityIncreased";
						}
						rs.close();
						ps3.close();

						response.sendRedirect("Project/client/cart.jsp?msg="+msg);}
					}else if ("dec".equals(operation)) {

						rs = priceFun(email, id);

						if (rs.next()) {
							price = rs.getInt("price");
							quantity = rs.getInt("quantity");
							if(quantity>1) {
								quantity = quantity - 1;	
							
							total = price * quantity;

							query3 = "UPDATE `usercards` SET `quantity` = ? ,`total`= ? , `price`= ? WHERE `email`= ? AND product_id = ? AND `billNo` IS NULL    AND `orderedDate` IS NULL   AND `status` IS NULL;";
							PreparedStatement ps3 = DB_Connection.getDBConPs(query3);
							ps3.setInt(1, quantity);
							ps3.setInt(2, total);
							ps3.setInt(3, price);
							ps3.setString(4, email);
							ps3.setString(5, id);

							System.out.println(ps3);
							String msg = InsertData.insertData(ps3);
							if (msg.equals("valid")) {
								msg = "quantityDicresed";
							}
							rs.close();
							ps3.close();
							response.sendRedirect("Project/client/cart.jsp?msg="+msg);
						}else {
							String msg ="quantityIsOne";
							response.sendRedirect("Project/client/cart.jsp?msg="+ msg);
						}
						}
						} else if ("re".equals(operation)) {
							query3 = "DELETE FROM `usercards` WHERE `email`= ? AND product_id = ? AND `billNo` IS NULL    AND `orderedDate` IS NULL   AND `status` IS NULL;";
							PreparedStatement ps3 = DB_Connection.getDBConPs(query3);
							ps3.setString(1, email);
							ps3.setString(2, id);

							System.out.println(ps3);
							String msg = InsertData.insertData(ps3);
							if (msg.equals("valid")) {
								msg = "ProductRemoved";
							}
							
							ps3.close();
							response.sendRedirect("Project/client/cart.jsp?msg="+msg);
						}else {
							response.sendRedirect("Project/client/cart.jsp?msg=invalid");
						}
					
				
			} catch (Exception e) {
				System.out.println(e);
				response.sendRedirect("Project/client/singin.jsp?msg=invalid");
			}
			DB_Connection.DBClose();

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
