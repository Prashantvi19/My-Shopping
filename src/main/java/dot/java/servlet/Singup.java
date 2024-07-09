package dot.java.servlet;

//package dot.java.moldel.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;

import dot.java.moldel.DB_Connection;
import dot.java.moldel.InsertData;

/**
 * Servlet implementation class Singup
 */
@WebServlet("/userSignup")
public class Singup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public Singup() {
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

		response.sendRedirect("Project/client/singup.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String msg = "invalid";
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");
		String quetion = request.getParameter("quetion");
		String ans = request.getParameter("ans");
		if (password.equals(repassword)) {
			try {
				String query = "INSERT INTO `user`(`name`, `email`, `mobileNumber`, `gender`, `question`, `answer`, `password`) VALUES (?,?,?,?,?,?,?);";
				PreparedStatement ps = DB_Connection.getDBConPs(query);
                 
				ps.setString(1, name);
				ps.setString(2, email);
				ps.setString(3, phone);
				ps.setString(4, gender);
				ps.setString(5, quetion);
				ps.setString(6, ans);
				ps.setString(7, password);
				msg = InsertData.insertData(ps);
				ps.close();
				DB_Connection.DBClose();
				msg = "registrationIsDone.";
				response.sendRedirect("Project/client/singup.jsp?msg=" + msg);
			}catch (Exception e) {
				System.out.println(e);
				msg = "SomethigEmpty.";
				response.sendRedirect("Project/client/singup.jsp?msg=" + msg);
			}
		}else {
			msg = "confermPassword.";
			response.sendRedirect("Project/client/singup.jsp?msg=" + msg);
		}

		

	}

}
