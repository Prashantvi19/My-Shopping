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
 * Servlet implementation class AddToCart
 */
@WebServlet("/addpocartproduct")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddToCart() {
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
		
		
		 
		String productId = request.getParameter("product");
		String email = " ";
		HttpSession session = request.getSession();

		String login = (String) session.getAttribute("login");
		if (login == null) {
			response.sendRedirect("Project/client/singin.jsp?msg=needLogin");
		}else if (login == "login") {
			email =  (String) session.getAttribute("email");
			
			String query = "";
			String query1 = "";
			String query3 = "";
			String query4 = "";
			
			int price = 0;
			int quantity = 1;
			int total = 1;

			try {

				query1 = "SELECT * FROM `products` WHERE `id` = ? ;";
				PreparedStatement ps1 = DB_Connection.getDBConPs(query1);

				ps1.setString(1, productId);
				ResultSet rs1 = SelectQuery.selectQuery(ps1);				
				
				if (rs1.next()) {
                    price = rs1.getInt("price");
                    
                }
				System.out.println(rs1);
				System.out.println(ps1);
				ps1.close();
				
				
				query = "SELECT * FROM `usercards` WHERE `email`= ? AND product_id = ? AND `billNo` IS NULL AND `orderedDate` IS NULL AND `status` IS NULL;";
				
				PreparedStatement ps = DB_Connection.getDBConPs(query);
				ps.setString(1, email);
				ps.setString(2, productId);
				System.out.println(ps);
				ResultSet rs = SelectQuery.selectQuery(ps);
				System.out.println(rs);
				
				if (rs.next()) {
					quantity += rs.getInt("quantity");
					total = price * quantity;
					
					query3 = "UPDATE `usercards` SET `quantity` = ? ,`total`= ? , `price`= ? WHERE `email`= ? AND product_id = ? AND `billNo` IS NULL    AND `orderedDate` IS NULL   AND `status` IS NULL;";
					PreparedStatement ps3 = DB_Connection.getDBConPs(query3);
					ps3.setInt(1, quantity);
					ps3.setInt(2, total);
					ps3.setInt(3, price);
					ps3.setString(4, email);
					ps3.setString(5, productId);
					
					System.out.println(ps3);
					String msg = InsertData.insertData(ps3);
					if (msg.equals("valid")) {
						msg = "productQuantity";
					}
					rs.close();
					ps3.close();					
					response.sendRedirect("Project/client/index.jsp?msg=" + msg);
					
				} else {
					
					quantity = 1;
					total = price * quantity;
					query4 = "INSERT INTO `usercards`( `quantity` ,`total` ,  `email` , product_id , `price`) VALUE (?,?,?,?,?);";
					PreparedStatement ps4 = DB_Connection.getDBConPs(query4);
					ps4.setInt(1, quantity);
					ps4.setInt(2, total);
					ps4.setString(3, email);
					ps4.setString(4, productId);
					ps4.setInt(5, price);
					
					
					System.out.println(ps4);
					String msg = InsertData.insertData(ps4);
					
					if (msg.equals("valid")) {
						msg="productAdded";
					}
					
					ps4.close();
					
					response.sendRedirect("Project/client/index.jsp?msg="+msg);
				}
			} catch (Exception e) {
				System.out.println(e);
				response.sendRedirect("Project/client/index.jsp?msg=addToCartException");
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
