package ie.ucd.comp2004J;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDAO {
	
	public static User login(String username, String password) {
		Connection conn = null;
		
		try {
			conn = JDBCTool.getConnection();
		
			String information = "SELECT * FROM Users WHERE FName=? AND Password=?";
			
			PreparedStatement ps = conn.prepareStatement(information);
			
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			
		
			if(rs.next()) {
				
				String un = rs.getString("FName");
				String p = rs.getString("Password");
				String email = rs.getString("Mail");
				User u = new User(un,p,email);
				return u;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			if(conn!=null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		return null;
	}
	

}
