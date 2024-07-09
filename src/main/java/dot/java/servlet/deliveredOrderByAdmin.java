package dot.java.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.PreparedStatement;

import dot.java.moldel.DB_Connection;
import dot.java.moldel.InsertData;

/**
 * Servlet implementation class deliveredOrderByAdmin
 */
@WebServlet("/deleveredStatusUpdateByAdmin")
public class deliveredOrderByAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public deliveredOrderByAdmin() {
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
//		HttpSession session = request.getSession();
//		String email = (String) session.getAttribute("email");
		String msg = null;
		String msg2 = null;
		String status = "Delivered";
		String query = "UPDATE `orderbill` SET `status`=? WHERE `billNo`=? AND `id`=? ;";
		String query2 = "UPDATE `usercards` SET `status` = ? WHERE `billNo` = ?;";

		try {
			PreparedStatement ps = DB_Connection.getDBConPs(query);
			ps.setString(1, status);
			ps.setString(2, bill);
			ps.setString(3, billid);

			System.out.println(ps);
			msg = InsertData.insertData(ps);

			if (msg.equals("valid")) {
				msg = "OrderedBillUpdate";

			}

			ps.close();

			PreparedStatement ps2 = DB_Connection.getDBConPs(query2);
			ps2.setString(1, status);
			ps2.setString(2, bill);

			System.out.println(ps2);
			msg2 = InsertData.insertData(ps2);
			if (msg2.equals("valid")) {
				msg2 = "userCartUpdated";
			}
			ps2.close();
			DB_Connection.DBClose();

			response.sendRedirect("Project/Admin/recievedOrders.jsp?msg=" + msg + "&msg2=" + msg2);

		} catch (Exception e) {
			System.out.println(e);
			response.sendRedirect("Project/Admin/recievedOrders.jsp?msg=invalid&msg2=invalid");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doGet(request, response);

	}

}
