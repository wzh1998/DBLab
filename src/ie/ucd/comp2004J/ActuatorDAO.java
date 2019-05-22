package ie.ucd.comp2004J;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class ActuatorDAO {
	
	public static List<Actuator> getAllActuators(int PageNum) {
		List<Actuator> actuators = new ArrayList<Actuator>();
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM Actuators ORDER BY ActID LIMIT " + (PageNum-1)*5 + ", 5");
			
			while(rs.next()) {
				int ActID = rs.getInt("ActID");
				String ActName = rs.getString("ActName");
				int ActState = rs.getInt("ActState");
				Actuator act = new Actuator(ActID, ActName, ActState);
				
				actuators.add(act);
			}
			
			rs.close();
			st.close();
			conn.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return actuators;
	}
	
	public static int getPageNum() {
		List<Actuator> actuators = new ArrayList<Actuator>();
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM Actuator");
			
			while(rs.next()) {
				int ActID = rs.getInt("ActID");
				String ActName = rs.getString("ActName");
				int ActState = rs.getInt("ActState");
				Actuator act = new Actuator(ActID, ActName, ActState);
				
				actuators.add(act);
			}
			
			rs.close();
			st.close();
			conn.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return (int) Math.ceil(actuators.size()/5.0);
	}
	
	public static Actuator getActuatorByID(int aid) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();	
			ResultSet rs = st.executeQuery("SELECT * FROM Actuators WHERE ActID=" + aid);
			rs.next();
			
			int ActID = rs.getInt("ActID");
			String ActName = rs.getString("ActName");
			int ActState = rs.getInt("ActState");
			Actuator act = new Actuator(ActID, ActName, ActState);
				
			rs.close();
			st.close();
			conn.close();
	
			return act;
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	return null;
	}
	

	public static boolean deleteActuatorByID(int aid) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();	
			int rs = st.executeUpdate("DELETE FROM Actuators WHERE ActID=" + aid);
			
			st.close();
			conn.close();
			
			return (rs==0) ? false : true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	

	public static boolean updateActuator(Actuator act) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();	
			int rs = st.executeUpdate("UPDATE Actuators SET ActID='"+ act.getActID() + "', ActName='" + act.getActName() + "', ActState=" + act.getActState() + ";" );
			
			st.close();
			conn.close();
			return (rs==0) ? false : true;
		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return false;
	}
	

	public static boolean insertActuator(Actuator act) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();	
			System.out.print("INSERT INTO Actuators VALUES (" + act.getActID() + ", " + act.getActState() + " , '" + act.getActName() + "');");
			int rs = st.executeUpdate("INSERT INTO Actuators VALUES (" + act.getActID() + ", " + act.getActState() + " , '" + act.getActName() + "');" );	
			st.close();
			conn.close();
			
			return (rs==0) ? false : true;
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return false;
	}
}

