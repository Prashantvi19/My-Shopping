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

import dot.java.moldel.*;

/**
 * Servlet implementation class login
 */
@WebServlet("/loginUser")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
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

		response.sendRedirect("Project/client/singin.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		if (email.equals("adminjava@gmail.com") && password.equals("admin@12345")) {
			HttpSession session = request.getSession();
			session.setAttribute("name","adminjava");
			session.setAttribute("email", "adminjava@gmail.com");
			session.setAttribute("mobileNumber", "1234567890");
			session.setAttribute("gender", "admin");
			session.setAttribute("login", "login");
			session.setAttribute("Adminlogin", "Adminlogin");
			response.sendRedirect("Project/Admin/index.jsp?msg=valid");
		} else {
			String query = "SELECT * FROM user WHERE email= ? AND password = ?;";
			ResultSet rs;
			try {
				PreparedStatement ps = DB_Connection.getDBConPs(query);
				ps.setString(1, email);
				ps.setString(2, password);
				rs = SelectQuery.selectQuery(ps);
				if (rs.next()) {
					HttpSession session = request.getSession();
					session.setAttribute("name", rs.getString("name"));
					session.setAttribute("email", rs.getString("email"));
					session.setAttribute("mobileNumber", rs.getString("mobileNumber"));
					session.setAttribute("gender", rs.getString("gender"));
					session.setAttribute("login", "login");
					rs.close();
					ps.close();
					DB_Connection.DBClose();
					
					response.sendRedirect("Project/client/index.jsp?");

				} else {
					response.sendRedirect("Project/client/singin.jsp?msg=invalidEmailPassword");
				}
			} catch (Exception e) {
				System.out.println(e);
				response.sendRedirect("Project/client/singin.jsp?msg=invalid");
			}

		}
	}
}
