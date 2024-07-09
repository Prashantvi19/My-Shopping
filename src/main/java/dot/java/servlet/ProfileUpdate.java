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
import dot.java.moldel.SelectQuery;
import dot.java.moldel.InsertData;

/**
 * Servlet implementation class ProfileUpdate
 */
@WebServlet("/UpdateProfileByUser")
public class ProfileUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProfileUpdate() {
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

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		String password = request.getParameter("password");
		String page = request.getParameter("page");
		String query = "SELECT * FROM user WHERE email= ? AND password = ?;";
		String msg = "";
		String newPassword = "";
		String reNewPassword = "";
		ResultSet rs;
		try {
			PreparedStatement ps = DB_Connection.getDBConPs(query);
			ps.setString(1, email);
			ps.setString(2, password);
			rs = SelectQuery.selectQuery(ps);
			if (rs.next()) {

				if ("changeMobile".equals(page)) {

					String mobileNumber = request.getParameter("mobileNumber");
					String query2 = "UPDATE `user` SET `mobileNumber`= ? WHERE `email`= ? AND `password`= ?;";
					PreparedStatement ps2 = DB_Connection.getDBConPs(query2);
					ps2.setString(1, mobileNumber);
					ps2.setString(2, email);
					ps2.setString(3, password);
					System.out.println(ps2);
					msg = InsertData.insertData(ps2);

					if ("valid".equals(msg)) {
						msg = "mobileNumberChanged";
						response.sendRedirect("Project/client/profile.jsp?msg=" + msg);
					} else {
						msg = "incurrectPassword";
						response.sendRedirect("Project/client/profile.jsp?msg=" + msg);
					}
				} else if ("changeQuestionSecurity".equals(page)) {

					String quetion = request.getParameter("quetion");
					String ans = request.getParameter("ans");
					String query2 = "UPDATE `user` SET `question`=?,`answer`=? WHERE `email`= ? AND `password`= ?;";
					PreparedStatement ps2 = DB_Connection.getDBConPs(query2);
					ps2.setString(1, quetion);
					ps2.setString(2, ans);
					ps2.setString(3, email);
					ps2.setString(4, password);
					System.out.println(ps2);
					msg = InsertData.insertData(ps2);
					if ("valid".equals(msg)) {
						msg = "QuestionSecurityChanged";
						response.sendRedirect("Project/client/profile.jsp?msg=" + msg);
					} else {
						msg = "incurrectPassword";
						response.sendRedirect("Project/client/profile.jsp?msg=" + msg);
					}

					rs.close();
					ps.close();
					DB_Connection.DBClose();

				} else if ("changePassword".equals(page)) {
					newPassword = request.getParameter("newPassword");
					reNewPassword = request.getParameter("reNewPassword");
					if (((newPassword.equals("null") != true && newPassword != null && newPassword.isEmpty() == false
							&& newPassword.isBlank() == false)
							&& (reNewPassword.equals("null") != true && reNewPassword != null
									&& reNewPassword.isEmpty() == false && reNewPassword.isBlank() == false))
							&& reNewPassword.equals(newPassword)) {

						String query2 = "UPDATE `user` SET `password`= ? WHERE `email`= ? AND `password`= ?;";
						PreparedStatement ps2 = DB_Connection.getDBConPs(query2);
						ps2.setString(1, newPassword);
						ps2.setString(2, email);
						ps2.setString(3, password);
						System.out.println(ps2);
						msg = InsertData.insertData(ps2);
						if ("valid".equals(msg)) {
							msg = "PasswordChanged";
							response.sendRedirect("Project/client/profile.jsp?msg=" + msg);
						} else {
							msg = "incorrectOldPassword";
							response.sendRedirect("Project/client/profile.jsp?msg=" + msg);
						}
					} else {
						msg = "newPasswordConfirim";
						response.sendRedirect("Project/client/profile.jsp?msg=" + msg);
					}
					rs.close();
					ps.close();
					DB_Connection.DBClose();

				} else {
					msg = "tryAgain";
					response.sendRedirect("Project/client/profile.jsp?msg=" + msg);
				}
			} else {
				msg = "Auth";
				response.sendRedirect("Project/client/profile.jsp?msg=" + msg);
			}
		} catch (Exception e) {
			msg = "databaseError";
			System.out.println(e);
			response.sendRedirect("Project/client/profile.jsp?msg=" + msg);
		}

	}

}
