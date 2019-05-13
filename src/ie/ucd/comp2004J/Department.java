package ie.ucd.comp2004J;

public class Department {
	
	private int deptno;
	private String deptname;
	private String office;
	private String division;
	private int managerno;
	
	
	
	
	public Department(int deptno, String deptname, String office, String division, int managerno) {
		super();
		this.deptno = deptno;
		this.deptname = deptname;
		this.office = office;
		this.division = division;
		this.managerno = managerno;
	}
	
	
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public String getOffice() {
		return office;
	}
	public void setOffice(String office) {
		this.office = office;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public int getManagerno() {
		return managerno;
	}
	public void setManagerno(int managerno) {
		this.managerno = managerno;
	}
	
	

}
