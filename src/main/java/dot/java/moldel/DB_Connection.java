package dot.java.moldel;

//Db Connection
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DB_Connection {

	public static PreparedStatement getDBConPs(String query) {
		String userName = "My_shopping";
		String password = "myshopping@12345";
		String dbName = "My_shopping_DB";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbName, userName, password);
			PreparedStatement ps = con.prepareStatement(query);
			return ps;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public static void DBClose() {
		String userName = "My_shopping";
		String password = "myshopping@12345";
		String dbName = "My_shopping_DB";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbName, userName, password);
			con.close();

		} catch (Exception e) {
			System.out.println(e);

		}
	}
}