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
			
			ResultSet rs = st.executeQuery("SELECT * FROM Actuators");
			
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
	public static int getActCount() {
		List<Actuator> actuators = new ArrayList<Actuator>();
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM Actuators");
			
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
		return actuators.size();
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
			System.out.println("UPDATE Actuators SET ActName='"+ act.getActName() + "', ActState=" + act.getActState() + " WHERE ActID=" + act.getActID() + ";");
			int rs = st.executeUpdate("UPDATE Actuators SET ActName='"+ act.getActName() + "', ActState=" + act.getActState() + " WHERE ActID=" + act.getActID() + ";" );
			
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
			int rs = st.executeUpdate("INSERT INTO Actuators VALUES (" + act.getActID() + ", " + act.getActState() + ", '" + act.getActName() + "');" );	
			st.close();
			conn.close();
			
			if(act.getActID() < 2000) {//
				Alarm ala = new Alarm(act.getActID(), 0);
				insertAlarm(ala);
			}
			else if(act.getActID() < 3000) {
				BTLock lock = new BTLock(act.getActID(), 0, "abba00cae7dea870", "", "");
				insertBTLock(lock);
			}
			else if(act.getActID() < 4000) {//
				Curtain cur = new Curtain(act.getActID(), 90);
				insertCurtain(cur);
			}
			else if(act.getActID() < 5000) {//
				Humidifier hum = new Humidifier(act.getActID(), 500, 10);
				insertHumidifier(hum);
			}
			else {//
				Lamp lamp = new Lamp(act.getActID(), 1);
				insertLamp(lamp);
			}
			return (rs==0) ? false : true;
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return false;
	}
	
	public static boolean insertAlarm(Alarm ala) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();	
			int rs = st.executeUpdate("INSERT INTO Alarm VALUES (" + ala.getActID() + ", 0);" );	
			st.close();
			conn.close();
		
			
			return (rs==0) ? false : true;
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return false;
	}
	public static boolean insertBTLock(BTLock lock) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();	
			System.out.print("INSERT INTO BTLock VALUES (" + lock.getActID() + ", " + lock.getState() + ", '" + lock.getBTKey() + "', '" + lock.getTempKey()+ "', '"+lock.getTempKeyStartTime() +  "');");
			int rs = st.executeUpdate("INSERT INTO BTLock VALUES (" + lock.getActID() + ", " + lock.getState() + ", '" + lock.getBTKey() + "', '" + lock.getTempKey()+ "', '"+lock.getTempKeyStartTime() + "');");	
			st.close();
			conn.close();
			
			return (rs==0) ? false : true;
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return false;
	}
	public static boolean insertCurtain(Curtain cur) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();	
			System.out.print("INSERT INTO Curtain VALUES (" + cur.getActID() + ", " + cur.getCrack() + ");");
			int rs = st.executeUpdate("INSERT INTO Curtain VALUES (" + cur.getActID() + ", " + cur.getCrack() + ");");	
			st.close();
			conn.close();
			
			return (rs==0) ? false : true;
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return false;
	}
	public static boolean insertHumidifier(Humidifier hum) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();	
			System.out.print("INSERT INTO Humidifier VALUES (" + hum.getActID() + ", " + hum.getWaterVolume() + ", " + hum.getHSwitch() +  ");");
			int rs = st.executeUpdate("INSERT INTO Humidifier VALUES (" + hum.getActID() + ", " + hum.getWaterVolume() + ", " + hum.getHSwitch() +  ");");	
			st.close();
			conn.close();
			
			return (rs==0) ? false : true;
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return false;
	}
	
	public static boolean insertLamp(Lamp lamp) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();	
			System.out.print("INSERT INTO Lamp VALUES (" + lamp.getActID() + ", " + lamp.getMode() + ");");
			int rs = st.executeUpdate("INSERT INTO Lamp VALUES (" + lamp.getActID() + ", " + lamp.getMode() + ");");	
			st.close();
			conn.close();
			
			return (rs==0) ? false : true;
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return false;
	}
	public static int getVolumn(int aid) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();	
			ResultSet rs = st.executeQuery("SELECT * FROM Humidifier WHERE ActID=" + aid);
			rs.next();
			
			int volumn = rs.getInt("WaterVolume");
				
			rs.close();
			st.close();
			conn.close();
	
			return volumn;
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	return 0;
	}
}


