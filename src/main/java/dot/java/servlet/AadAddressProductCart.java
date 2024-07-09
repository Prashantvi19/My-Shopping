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
 * Servlet implementation class AadAddressProductCart
 */
@WebServlet("/addAddressInProduct")
public class AadAddressProductCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AadAddressProductCart() {
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		String product_id = request.getParameter("product_id");
		String address_id = request.getParameter("address_id");
		String email = "";
		String msg = "";
		String msgc = "";
		HttpSession session = request.getSession();

		String login = (String) session.getAttribute("login");
		if (login == null) {
			response.sendRedirect("Project/client/singin.jsp?msg=needLogin");
		} else if (login == "login") {
			email = (String) session.getAttribute("email");

			String query3 = "";

			try {
				
				
				if("doneCountAdd".equals(product_id)) {
					
					query3 = "UPDATE `usercards` SET `address_id`= ? WHERE `email`= ? AND `billNo` IS NULL    AND `orderedDate` IS NULL   AND `status` IS NULL";
					PreparedStatement ps3 = DB_Connection.getDBConPs(query3);
					ps3.setString(1, address_id);
					ps3.setString(2, email);
					System.out.println(ps3);
					msgc = "AllPro";
					 msg = InsertData.insertData(ps3);
					if (msg.equals("valid")) {
						msg = "Upvalid";
					}
					ps3.close();
					
				}else{
				query3 = "UPDATE `usercards` SET `address_id`= ? WHERE `email`= ? AND product_id = ? AND `billNo` IS NULL    AND `orderedDate` IS NULL   AND `status` IS NULL ;";
				PreparedStatement ps3 = DB_Connection.getDBConPs(query3);
				ps3.setString(1, address_id);
				ps3.setString(2, email);
				ps3.setString(3, product_id);
				System.out.println(ps3);				
			    msg = InsertData.insertData(ps3);
			    
				if (msg.equals("valid")) {
					msgc = "AddressUpdate";
					ps3.close();
				}

				}
				

				response.sendRedirect("Project/client/cart.jsp?msg=" + msg);

			} catch (Exception e) {
				System.out.println(e);
				response.sendRedirect("Project/client/addAddressInProduct.jsp?msg=invalidInAdress");
			}
			DB_Connection.DBClose();

		} else {
			response.sendRedirect("Project/client/addAddressInProduct.jsp?msg=unExpectedError");
		}

	}

}
