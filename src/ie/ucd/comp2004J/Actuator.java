package ie.ucd.comp2004J;

public class Actuator {
	
	private int ActID;
	private String ActName;
	private int ActState;

	
	public Actuator(int ActID, String ActName, int ActState) {
		super();
		this.ActID = ActID;
		this.ActName = ActName;
		this.ActState = ActState;
	}


	public int getActID() {
		return ActID;
	}


	public void ActID(int ActID) {
		this.ActID = ActID;
	}


	public String getActName() {
		return ActName;
	}


	public void setActName(String ActName) {
		this.ActName = ActName;
	}


	public int getActState() {
		return ActState;
	}


	public void setActState(int ActState) {
		this.ActState = ActState;
	}
	public String toString() {
		return this.ActID+ "\t\t" +this.ActName + "\t\t" + this.ActState ;

	}
}