package dot.java.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dot.java.moldel.*;
@WebServlet("/ForgotPassword")
/**
 * Servlet implementation class ForgotPassword
 */
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.sendRedirect("Project/client/forgetPassword.jsp");	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String msg = "invalid";
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");
		String quetion = request.getParameter("quetion");
		String ans = request.getParameter("ans");
		if (password.equals(repassword)) {
			try {
				String query1 = "SELECT * FROM  `user` WHERE `email` = ? AND `mobileNumber` = ? AND `question` = ? AND  `answer`= ?;";
				PreparedStatement ps1 = DB_Connection.getDBConPs(query1);
				
				ps1.setString(1, email);
				ps1.setString(2, phone);
				ps1.setString(3, quetion);
				ps1.setString(4, ans);
				System.out.println(ps1);
				ResultSet rs = SelectQuery.selectQuery(ps1);
				
				if(rs.next()) {
					System.out.println("Result Done");
				String query = "UPDATE `user` SET  `password` = ? WHERE  `email` = ? AND `mobileNumber` = ? AND `question` = ? AND  `answer`= ?";
				PreparedStatement ps = DB_Connection.getDBConPs(query);				
				ps.setString(1, password);
				ps.setString(2, email);
				ps.setString(3, phone);
				ps.setString(4, quetion);
				ps.setString(5, ans);
				System.out.println(ps);
				msg = InsertData.insertData(ps);
				ps1.close();
				ps.close();
				DB_Connection.DBClose();
				}
				msg = "valid";
				response.sendRedirect("Project/client/forgetPassword.jsp?msg=" + msg);
			}catch (Exception e){
				System.out.println(e);
				msg = "invalid";
				response.sendRedirect("Project/client/forgetPassword.jsp?msg=" + msg);
			}
		}else {
			msg = "Confirm Passwords didn't match.";
			response.sendRedirect("Project/client/forgetPassword.jsp?msg=" + msg);
		}
		
	}

}
