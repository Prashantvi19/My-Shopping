package dot.java.moldel;

import java.sql.PreparedStatement;
//import dot.java.moldel.DB_Connection;

public class InsertData {
	public static String insertData(PreparedStatement ps) {
		int query = 0;

		String msg = "invalid";

		try {

			query = ps.executeUpdate();
			System.out.println(query + "Insert Succesfuly");
			ps.close();
		} catch (Exception e) {
			System.out.println(e);
			return msg;
		}
		if (query > 0) {
			msg = "valid";
		} else {
			msg = "invalid";
		}

		return msg;
	}
}
