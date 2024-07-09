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
 * Servlet implementation class UserCanceleOrder
 */
@WebServlet("/cancledOrderByUser")
public class UserCanceleOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserCanceleOrder() {
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
		String billid = request.getParameter("billid");
		String bill = request.getParameter("bill");
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		String msg = null;
		String msg2 = null;
		String status = "cancled";
		String query = "UPDATE `orderbill` SET `status`=? WHERE `email`= ? AND `billNo`=? AND `id`=? ;";
		String query2 = "UPDATE `usercards` SET `status` = ? WHERE `email` = ? AND `billNo` = ?;";

		try {
			PreparedStatement ps = DB_Connection.getDBConPs(query);
			ps.setString(1, status);
			ps.setString(2, email);
			ps.setString(3, bill);
			ps.setString(4, billid);

			System.out.println(ps);
			msg = InsertData.insertData(ps);

			ps.close();
			if (msg.equals("valid")) {

				PreparedStatement ps2 = DB_Connection.getDBConPs(query2);
				ps2.setString(1, status);
				ps2.setString(2, email);
				ps2.setString(3, bill);

				System.out.println(ps2);
				msg2 = InsertData.insertData(ps2);

				if (msg2.equals("valid")) {
					msg = "productsOrderCancled";
				}

				ps2.close();
			}
			DB_Connection.DBClose();

			response.sendRedirect("Project/client/myOrders.jsp?msg=" + msg );

		} catch (Exception e) {
			System.out.println(e);
			msg = "somethingwrong";
			response.sendRedirect("Project/client/myOrders.jsp?msg=" + msg);
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
