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

/**
 * Servlet implementation class ContactUser
 */
@WebServlet("/SubmitUserContact")
public class ContactUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactUser() {
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
		
		String subject = request.getParameter("subject");
		String email = request.getParameter("email");
		String message = request.getParameter("message");
		String msg ="";
		
		try {
			
		
		String query2 = "INSERT INTO `contactus`( `email`, `subject`, `message`) VALUES (?,?,?);";
		PreparedStatement ps2 = DB_Connection.getDBConPs(query2);
		ps2.setString(1, email);
		ps2.setString(2, subject);
		ps2.setString(3, message);
		System.out.println(ps2);
		msg = InsertData.insertData(ps2);
		
		if ("valid".equals(msg)) {
			msg="messageSubmit";
			response.sendRedirect("Project/client/contact.jsp?msg=" + msg);
		} else  {
			msg="messageFailed";
			response.sendRedirect("Project/client/contact.jsp?msg=" + msg);
		}
        
		} catch (Exception e) {
			System.out.println(e);
			msg = "messageFailedError";
			response.sendRedirect("Project/client/contact.jsp?msg=" + msg);
		}

}
	}
