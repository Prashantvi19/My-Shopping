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
 * Servlet implementation class UserAddAddress
 */
@WebServlet("/addressuserAdd")
public class UserAddAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAddAddress() {
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
		doGet(request, response);
	
		
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		String mobileNumber = request.getParameter("mobileNumber");
		String product = request.getParameter("product");
		
		 System.out.println(product);
		HttpSession session = request.getSession();
		
		String email = " ";
		String login = (String) session.getAttribute("login");
		
		if (login == null) {
			response.sendRedirect("Project/client/singin.jsp");
		} else if (login == "login") {
			email = (String) session.getAttribute("email");

			try {
				String query3 = "INSERT INTO `addressusers`(`address`, `city`, `state`, `country`, `mobileNumber`, `email`) VALUES (?,?,?,?,?,?);";
				PreparedStatement ps3 = DB_Connection.getDBConPs(query3);
				ps3.setString(1, address);
				ps3.setString(2, city);
				ps3.setString(3, state);
				ps3.setString(4, country);
				ps3.setString(5, mobileNumber);
				ps3.setString(6, email);

				System.out.println(ps3);
				String msg = InsertData.insertData(ps3);
				if (msg.equals("valid")) {
					msg = "addedNewAdress";
				}
				
				ps3.close();
				DB_Connection.DBClose();
				response.sendRedirect("Project/client/addAddressInProduct.jsp?proId="+product+"&msg="+msg);
				} catch (Exception e) {
				System.out.println(e);
				
				String msg = "error";
				response.sendRedirect("Project/client/address.jsp?msg="+ msg);
			}	

		}else{
			String msg = "Auth";
			response.sendRedirect("Project/client/address.jsp?msg="+ msg);
		}
		
		
		
		
	}

}
