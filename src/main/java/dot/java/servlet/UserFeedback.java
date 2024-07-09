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
 * Servlet implementation class UserFeedback
 */
@WebServlet("/UserFeedbackSubmit")
public class UserFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserFeedback() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		String name = request.getParameter("name");
		String feedback = request.getParameter("feedback");
		String msg ="";
		
		try {
			
		
		String query2 = "INSERT INTO `feedback`(`name`, `email`, `feedback`) VALUES (?,?,?);";
		PreparedStatement ps2 = DB_Connection.getDBConPs(query2);
		ps2.setString(1, name);
		ps2.setString(2, email);
		ps2.setString(3, feedback);
		System.out.println(ps2);
		msg = InsertData.insertData(ps2);
		
		if ("valid".equals(msg)) {
			msg="submitted";
			response.sendRedirect("Project/client/feedback.jsp?msg=" + msg);
		} else  {
			msg="notSubmit";
			response.sendRedirect("Project/client/feedback.jsp?msg=" + msg);
		}
        
		} catch (Exception e) {
			System.out.println(e);
			msg="error";
			response.sendRedirect("Project/client/feedback.jsp?msg=" + msg);
		}
		
	}

}
