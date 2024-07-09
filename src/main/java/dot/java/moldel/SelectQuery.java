package dot.java.moldel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SelectQuery {

		public static ResultSet selectQuery(PreparedStatement ps) {

			ResultSet rs ;

			try {

				rs  = ps.executeQuery();
				System.out.println( "Result fetch Succesfuly");

			} catch (Exception e) {
				System.out.println(e);
				return null;
			}
			

			return rs;
		
	}

}
