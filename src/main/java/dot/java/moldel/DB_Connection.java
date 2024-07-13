package dot.java.moldel;
//Db Connection
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DB_Connection {
	public static PreparedStatement getDBConPs(String query) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshoppingdb", "root", "");
			PreparedStatement ps = con.prepareStatement(query);
			return ps;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public static void DBClose() {
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshoppingdb", "root", "");
			con.close();

		} catch (Exception e) {
			System.out.println(e);

		}
	}
}