package ie.ucd.comp2004J;


public class Sensor {
	
	private int SensorID;
	private String SenName;
	private int SenState;
	private String UpdateTime;
	private String UpdateData;
	private int ActID;
	private String Unit;
	private String Type;
	
	
	public Sensor(int SensorID, String SenName, int SenState, String UpdateTime, String UpdateData, int ActID, String Unit, String Type) {
		super();
		this.SensorID = SensorID;
		this.SenName = SenName;
		this.SenState = SenState;
		this.UpdateTime = UpdateTime;
		this.UpdateData = UpdateData;
		this.ActID = ActID;
		this.Unit = Unit;
		this.Type = Type;
		
	}


	public int getSensorID() {
		return SensorID;
	}


	public String getSenName() {
		return SenName;
	}


	public int getSenState() {
		return SenState;
	}


	public String getUpdateTime() {
		return UpdateTime;
	}


	public String getUpdateData() {
		return UpdateData;
	}

	public int getActID() {
		return ActID;
	}


	public String getUnit() {
		return Unit;
	}


	public String getType() {
		return Type;
	}

	
	
	public String toString() {
		return this.SensorID+ "\t\t" +this.SenName + "\t\t" + this.SenState + "\t\t" + this.UpdateTime + "\t\t" + this.UpdateData + "\t\t" + this.ActID + "\t\t" + this.Unit + "\t\t" + this.Type;
//		return this.empno+"\t\t"+this.name+"\t\t"+this.job+ "\t\t"+this.salary+ "\t\t"+this.deptno;
//		String p1 = String.format("%04d %s", this.empno, this.name);
//		int dif = 16 - this.name.length();
//		for(;dif>0;dif--) p1 = p1 + " &nbsp;";
//		
//		String p2 = this.job;
//		for(dif=12-this.job.length();dif>0;dif--) p2 = p2 + " &nbsp;";
//		
//		String p3 = String.format("%.1f %d", this.salary, this.deptno);
//		return (p1+p2+p3);
	}
	

}

