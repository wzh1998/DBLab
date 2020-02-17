package ie.ucd.comp2004J;

import java.security.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import java.text.*;

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
				java.sql.Timestamp UpdateTime_t = rs.getTimestamp("UpdateTime");	
				Date date = new Date(UpdateTime_t.getTime());
                SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
				String UpdateTime = sdf.format(date);
				
				String UpdateData = rs.getString("UpdateData");
				int ActID = rs.getInt("ActID");
				String Unit = rs.getString("Unit");
				String Type = rs.getString("Type");
				String Room = rs.getString("Room");
				
				Sensor e = new Sensor(SensorID, SenName, SenState, UpdateTime, UpdateData, ActID, Unit, Type, Room);
				
				Sensors.add(e);
			}
//			while(rs.next()) {
//				
//				int SensorID = rs.getInt("SensorID");
//				String SenName = rs.getString("SenName");
//				int SenState = rs.getInt("SenState");
//				@SuppressWarnings("deprecation")
//				String UpdateTime = rs.getTime("UpdateTime").toGMTString();
//				String UpdateData = rs.getString("UpdateData");
//				int ActID = rs.getInt("ActID");
//				
//				String Unit = rs.getString("Unit");
//				String Type = rs.getString("Type");
//				String Room = rs.getString("Room");
//				
//				Sensor e = new Sensor(SensorID, SenName, SenState, UpdateTime, UpdateData, ActID, Unit, Type, Room);
//				
//				Sensors.add(e);
//			}
			
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
			
			ResultSet rs = st.executeQuery("SELECT * FROM Sensors");
			
			while(rs.next()) {
				int SensorID = rs.getInt("SensorID");
				String SenName = rs.getString("SenName");
				int SenState = rs.getInt("SenState");
				@SuppressWarnings("deprecation")
				java.sql.Timestamp UpdateTime_t = rs.getTimestamp("UpdateTime");
				
					
				Date date = new Date(UpdateTime_t.getTime());
				String UpdateTime = date.toString();
				
				String UpdateData = rs.getString("UpdateData");
				int ActID = rs.getInt("ActID");
				String Unit = rs.getString("Unit");
				String Room = rs.getString("Room");
				
				Sensor e = new Sensor(ActID, Unit, ActID, Unit, Unit, ActID, Unit, Unit, Room);
				
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

	public static int getSenCount() {
		List<Sensor> Sensors = new ArrayList<Sensor>();
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM Sensors");
			
			while(rs.next()) {
				int SensorID = rs.getInt("SensorID");
				String SenName = rs.getString("SenName");
				int SenState = rs.getInt("SenState");
				@SuppressWarnings("deprecation")
				java.sql.Timestamp UpdateTime_t = rs.getTimestamp("UpdateTime");
				
					
				Date date = new Date(UpdateTime_t.getTime());
				String UpdateTime = date.toString();
				
				String UpdateData = rs.getString("UpdateData");
				int ActID = rs.getInt("ActID");
				String Unit = rs.getString("Unit");
				String Room = rs.getString("Room");
				
				Sensor e = new Sensor(ActID, Unit, ActID, Unit, Unit, ActID, Unit, Unit, Room);
				
				Sensors.add(e);
			}
			
			rs.close();
			st.close();
			conn.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Sensors.size();
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
			int rs = st.executeUpdate("INSERT INTO Sensors VALUES (" + e.getSensorID() + ", '" + e.getSenName() + "', " + e.getSenState() + ", '" + e.createTime() + "', '" + e.getUpdateData() + "', " + e.getActID() + ", '" + e.getUnit() + "', '" + e.getType() + "', '" + e.getRoom() + "');");
			
			st.close();
			conn.close();
			
			return (rs==0) ? false : true;
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return false;
	}

	public static boolean updateSensor(Sensor sen) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();	
			int rs = st.executeUpdate("UPDATE Sensors SET SenName='" + sen.getSenName() + "', SenState=" + sen.getSenState() + ", UpdateTime='" + sen.createTime() + "', UpdateData='" + sen.getUpdateData() + "', ActID=" + sen.getActID() + ", Unit='" + sen.getUnit() + "', Type='" + sen.getType() + "', Room='" + sen.getRoom() + "' WHERE SensorID=" + sen.getSensorID() + ";" );
			
			st.close();
			conn.close();
			return (rs==0) ? false : true;
		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return false;
	}

	
	public static List<Sensor> getHumidity() {
		List<Sensor> Sensors = new ArrayList<Sensor>();

		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT * from Sensors WHERE Type='HUMIDITY SENSORS'");
			while(rs.next()) {
				
				int SensorID = rs.getInt("SensorID");
				String SenName = rs.getString("SenName");
				int SenState = rs.getInt("SenState");
				@SuppressWarnings("deprecation")
				java.sql.Timestamp UpdateTime_t = rs.getTimestamp("UpdateTime");	
				Date date = new Date(UpdateTime_t.getTime());
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
				String UpdateTime = sdf.format(date);	
			
				String UpdateData = rs.getString("UpdateData");
				int ActID = rs.getInt("ActID");
				String Unit = rs.getString("Unit");
				String Type = rs.getString("Type");
				String Room = rs.getString("Room");
			
				Sensor e = new Sensor(SensorID, SenName, SenState, UpdateTime, UpdateData, ActID, Unit, Type, Room);
			
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
	
	public static List<Sensor> getIllumination() {
		List<Sensor> Sensors = new ArrayList<Sensor>();
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
		
			ResultSet rs = st.executeQuery("SELECT * from Sensors WHERE Type='ILLUMINATION SENSORS'");
			while(rs.next()) {
				
				int SensorID = rs.getInt("SensorID");
				String SenName = rs.getString("SenName");
				int SenState = rs.getInt("SenState");
				@SuppressWarnings("deprecation")
				java.sql.Timestamp UpdateTime_t = rs.getTimestamp("UpdateTime");	
				Date date = new Date(UpdateTime_t.getTime());
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
				String UpdateTime = sdf.format(date);	
			
				String UpdateData = rs.getString("UpdateData");
				int ActID = rs.getInt("ActID");
				String Unit = rs.getString("Unit");
				String Type = rs.getString("Type");
				String Room = rs.getString("Room");
			
				Sensor e = new Sensor(SensorID, SenName, SenState, UpdateTime, UpdateData, ActID, Unit, Type, Room);
			
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
	public static List<Sensor> getTemperatureByRoom(String room) {
		List<Sensor> Sensors = new ArrayList<Sensor>();
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
		
			ResultSet rs = st.executeQuery("SELECT * from Sensors WHERE Type='TEMPERATURE SENSORS' AND Room='" + room + "'; ");
			while(rs.next()) {
				
				int SensorID = rs.getInt("SensorID");
				String SenName = rs.getString("SenName");
				int SenState = rs.getInt("SenState");
				@SuppressWarnings("deprecation")
				java.sql.Timestamp UpdateTime_t = rs.getTimestamp("UpdateTime");	
				Date date = new Date(UpdateTime_t.getTime());
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
				String UpdateTime = sdf.format(date);	
			
				String UpdateData = rs.getString("UpdateData");
				int ActID = rs.getInt("ActID");
				String Unit = rs.getString("Unit");
				String Type = rs.getString("Type");
				String Room = rs.getString("Room");
			
				Sensor e = new Sensor(SensorID, SenName, SenState, UpdateTime, UpdateData, ActID, Unit, Type, Room);
			
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
	public static List<Sensor> getSensorsByRoom(String room) {
		List<Sensor> Sensors = new ArrayList<Sensor>();
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM Sensors WHERE Room='" + room + "';");
			while(rs.next()) {
				int SensorID = rs.getInt("SensorID");
				String SenName = rs.getString("SenName");
				int SenState = rs.getInt("SenState");
				@SuppressWarnings("deprecation")
				java.sql.Timestamp UpdateTime_t = rs.getTimestamp("UpdateTime");	
				Date date = new Date(UpdateTime_t.getTime());
                SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
				String UpdateTime = sdf.format(date);
				
				String UpdateData = rs.getString("UpdateData");
				int ActID = rs.getInt("ActID");
				String Unit = rs.getString("Unit");
				String Type = rs.getString("Type");
				String Room = rs.getString("Room");
				
				Sensor e = new Sensor(SensorID, SenName, SenState, UpdateTime, UpdateData, ActID, Unit, Type, Room);
				
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
}

