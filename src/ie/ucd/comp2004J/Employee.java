package ie.ucd.comp2004J;

public class Employee {
	
	private int empno;
	private String name;
	private String job;
	private float salary;
	private int deptno;
	
	
	public Employee(int empno, String name, String job, float salary, int deptno) {
		super();
		this.empno = empno;
		this.name = name;
		this.job = job;
		this.salary = salary;
		this.deptno = deptno;
	}


	public int getEmpno() {
		return empno;
	}


	public void setEmpno(int empno) {
		this.empno = empno;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getJob() {
		return job;
	}


	public void setJob(String job) {
		this.job = job;
	}


	public float getSalary() {
		return salary;
	}


	public void setSalary(float salary) {
		this.salary = salary;
	}


	public int getDeptno() {
		return deptno;
	}


	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	
	
	public String toString() {
//		return this.empno+"\t\t"+this.name+"\t\t"+this.job+ "\t\t"+this.salary+ "\t\t"+this.deptno;
		String p1 = String.format("%04d %s", this.empno, this.name);
		int dif = 16 - this.name.length();
		for(;dif>0;dif--) p1 = p1 + " &nbsp;";
		
		String p2 = this.job;
		for(dif=12-this.job.length();dif>0;dif--) p2 = p2 + " &nbsp;";
		
		String p3 = String.format("%.1f %d", this.salary, this.deptno);
		return (p1+p2+p3);
	}
	

}
