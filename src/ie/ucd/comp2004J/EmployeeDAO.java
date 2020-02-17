package ie.ucd.comp2004J;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {
	
	public static List<Employee> getAllEmployees(int PageNum) {
		List<Employee> employees = new ArrayList<Employee>();
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM employee ORDER BY empno LIMIT " + (PageNum-1)*5 + ", 5");
			
			while(rs.next()) {
				int empno = rs.getInt("empno");
				String name = rs.getString("name");
				String job = rs.getString("job");
				float salary = rs.getFloat("salary");
				int deptno = rs.getInt("deptno"); 
				Employee e = new Employee(empno, name, job, salary, deptno);
				
				employees.add(e);
			}
			
			rs.close();
			st.close();
			conn.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return employees;
	}
	public static int getPageNum() {

		List<Employee> employees = new ArrayList<Employee>();
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM employee");
			
			while(rs.next()) {
				int empno = rs.getInt("empno");
				String name = rs.getString("name");
				String job = rs.getString("job");
				float salary = rs.getFloat("salary");
				int deptno = rs.getInt("deptno"); 
				Employee e = new Employee(empno, name, job, salary, deptno);
				
				employees.add(e);
			}
			
			rs.close();
			st.close();
			conn.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return (int) Math.ceil(employees.size()/5.0);
	}
	//TODO Question 2
	public static Employee getEmployeeByID(int eid) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();	
			ResultSet rs = st.executeQuery("SELECT * FROM employee WHERE empno=" + eid);
			rs.next();
			
			int empno = rs.getInt("empno");
			String name = rs.getString("name");
			String job = rs.getString("job");
			float salary = rs.getFloat("salary");
			int deptno = rs.getInt("deptno"); 
			Employee e = new Employee(empno, name, job, salary, deptno);
				
			rs.close();
			st.close();
			conn.close();
	
			return e;
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	return null;
	}
	
	//TODO Question 3
	public static boolean deleteEmployeeByID(int eid) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();	
			int rs = st.executeUpdate("DELETE FROM employee WHERE empno=" + eid);
			
			st.close();
			conn.close();
			
			return (rs==0) ? false : true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//TODO Question 4
	public static boolean updateEmployee(Employee e) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();	
			int rs = st.executeUpdate("UPDATE employee SET name='"+ e.getName() + "', job='" + e.getJob() + "', salary=" + e.getSalary() + ", deptno=" + e.getDeptno()  + " WHERE empno=" + e.getEmpno() + ";" );
			
			st.close();
			conn.close();
			return (rs==0) ? false : true;
		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return false;
	}
	
	//TODO Question 5
	public static boolean insertEmployee(Employee e) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();	
			int rs = st.executeUpdate("INSERT INTO employee VALUES (" + e.getEmpno() + ", '" + e.getName()+ "' , '" + e.getJob() + "' ,"  + e.getSalary() + "," + e.getDeptno()  + ");" );	
			
			st.close();
			conn.close();
			
			return (rs==0) ? false : true;
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return false;
	}
}

