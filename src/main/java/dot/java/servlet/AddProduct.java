package dot.java.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import dot.java.moldel.*;

@WebServlet("/productAddAdmin")
@MultipartConfig

/**
 * Servlet implementation class AddProduct
 */
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProduct() {
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

		response.sendRedirect("Project/Admin/addProduct.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		String msg = " ";
		try (PrintWriter out = response.getWriter()) {
			Part part = request.getPart("productImage");
			String fileName = part.getSubmittedFileName();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmss");
			String timestamp = dateFormat.format(new Date());
			fileName = timestamp + fileName;

//		String path = getServletContext().getRealPath("/"+"productsImages/"+ File.separator + fileName);
			String path = "E:/git/JavaEclipse/my_shopping/src/main/webapp/productsImages" + File.separator + fileName;
			InputStream inSt = part.getInputStream();
			boolean test = FileAddAdress.proUploadFile(inSt, path);
//			boolean test = false;
			System.out.println(path + " tst return" + test);

			if (test) {
				String productName = request.getParameter("productName");
				String category = request.getParameter("category");
				String price = request.getParameter("price");
				String activeStatus = request.getParameter("activeStatus");
				String imagePath = fileName;

				String query = "INSERT INTO `products`( `productName`, `category`, `price`, `activeStatus`, `imageAddress`) VALUES (?,?,?,?,?);";

				try {
					PreparedStatement ps = DB_Connection.getDBConPs(query);
					ps.setString(1, productName);
					ps.setString(2, category);
					ps.setString(3, price);
					ps.setString(4, activeStatus);
					ps.setString(5, imagePath);
					msg = InsertData.insertData(ps);

					ps.close();
					DB_Connection.DBClose();
					response.sendRedirect("Project/Admin/addProduct.jsp?msg=" + msg);

				} catch (Exception e) {
					System.out.println(e);
					response.sendRedirect("Project/Admin/addProduct.jsp?msg=invalid");
				}
			} else {
				response.sendRedirect("Project/Admin/addProduct.jsp?msg=fileError");
			}
//		System.out.println(query +" "+ imagePath+" "+ msg+" "+ inSt+" "+ "productID "+ path + " " + test);

		}

	}

}
