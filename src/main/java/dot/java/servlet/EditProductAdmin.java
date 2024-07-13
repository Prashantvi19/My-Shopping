package dot.java.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;

import dot.java.moldel.DB_Connection;
import dot.java.moldel.InsertData;

@WebServlet("/productEditAdmin")
/**
 * Servlet implementation class editProduct
 */
public class EditProductAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditProductAdmin() {
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
		response.sendRedirect("Project/Admin/editProduct.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String msg = " ";
		String productName = request.getParameter("productName");
		String category = request.getParameter("category");
		String price = request.getParameter("price");
		String activeStatus = request.getParameter("activeStatus");
		String productID = request.getParameter("productID");
		String pager = request.getParameter("pager");

		String query = "UPDATE `products` SET `productName` = ?, `category` = ? , `price` = ? , `activeStatus` = ? WHERE `id` = ? ;";

		try {
			PreparedStatement ps = DB_Connection.getDBConPs(query);
			ps.setString(1, productName);
			ps.setString(2, category);
			ps.setString(3, price);
			ps.setString(4, activeStatus);
			ps.setString(5, productID);

			System.out.println(
					productName + " " + category + " " + price + " " + activeStatus + " " + productID + " " + ps);
			msg = InsertData.insertData(ps);
			if (msg.equals("valid")) {
				if (activeStatus.equals("no")) {
					String query2 = "DELETE FROM `usercards` WHERE `product_id`=? AND `billNo`IS NULL AND `orderedDate` IS NULL AND `status` IS NULL;";
					PreparedStatement ps2 = DB_Connection.getDBConPs(query2);
					ps2.setString(1, productID);

					System.out.println(activeStatus + " " + productID + " " + ps2);
					msg = InsertData.insertData(ps2);

					msg = "ProductEdit";

				} else if (activeStatus.equals("yes")) {
					msg = "ProductEdit";
				} else {
					msg = "ProductEditButUserCartStillShow";
				}
			} else {
				msg = "ProductDidn'tEdit";
			}
			ps.close();
			DB_Connection.DBClose();
			if ("index".equals(pager)) {
				response.sendRedirect("Project/Admin/index.jsp?msg=" + msg);
			} else {
				response.sendRedirect("Project/Admin/LsitForEditPage.jsp?msg=" + msg);
			}

		} catch (Exception e) {
			msg = "failed";
			System.out.println(e);
			if ("index".equals(pager)) {
				response.sendRedirect("Project/Admin/index.jsp?msg=" + msg);
			} else {
				response.sendRedirect("Project/Admin/LsitForEditPage.jsp?msg=" + msg);
			}
		}

		System.out.println(productName + " " + category + " " + price + " " + activeStatus + " " + productID);
	}

}
