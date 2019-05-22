package ie.ucd.comp2004J;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SensorDAO {
	
	public static List<Sensor> getAllSensors(int PageNum) {
		List<Sensor> Sensors = new ArrayList<Sensor>();
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM Sensors ORDER BY SensorID LIMIT " + (PageNum-1)*5 + ", 5");
			
			while(rs.next()) {
				
				
				int SensorID = rs.getInt("SensorID");
				String SenName = rs.getString("SenName");
				int SenState = rs.getInt("SenState");
				@SuppressWarnings("deprecation")
				String UpdateTime = rs.getTime("UpdateTime").toGMTString();
				String UpdateData = rs.getString("UpdateData");
				int ActID = rs.getInt("ActID");
				String Unit = rs.getString("Unit");
				
				
				Sensor e = new Sensor(ActID, Unit, ActID, Unit, Unit, ActID, Unit, Unit);
				
				Sensors.add(e);
			}
			
			rs.close();
			st.close();
			conn.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Sensors;
	}
	
	/////////////////////////////////////////////
	public static int getPageNum() {
		List<Sensor> Sensors = new ArrayList<Sensor>();
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM employee");
			
			while(rs.next()) {
				int SensorID = rs.getInt("SensorID");
				String SenName = rs.getString("SenName");
				int SenState = rs.getInt("SenState");
				@SuppressWarnings("deprecation")
				String UpdateTime = rs.getTime("UpdateTime").toGMTString();
				String UpdateData = rs.getString("UpdateData");
				int ActID = rs.getInt("ActID");
				String Unit = rs.getString("Unit");
				
				
				Sensor e = new Sensor(ActID, Unit, ActID, Unit, Unit, ActID, Unit, Unit);
				
				Sensors.add(e);
			}
			
			rs.close();
			st.close();
			conn.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return (int) Math.ceil(Sensors.size()/5.0);
	}


	public static boolean deleteSensorByID(int SensorID) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();	
			int rs = st.executeUpdate("DELETE FROM Sensors WHERE SensorID=" + SensorID);
			
			st.close();
			conn.close();
			
			return (rs==0) ? false : true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	//TODO Question 5
	public static boolean insertSensor(Sensor e) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();	
			int rs = st.executeUpdate("INSERT INTO Sensors VALUES (" + e.getActID() + ", " + e.getSenName() + ", " + e.getSenState() + ", " + );
			
			st.close();
			conn.close();
			
			return (rs==0) ? false : true;
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return false;
	}
}

