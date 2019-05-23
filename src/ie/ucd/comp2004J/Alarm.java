package ie.ucd.comp2004J;

public class Alarm {
	
	private int ActID;
	private int ASwitch;

	
	public Alarm(int ActID, int ASwitch) {
		super();
		this.ActID = ActID;
		this.ASwitch = ASwitch;
	}


	public int getActID() {
		return ActID;
	}


	public void ActID(int ActID) {
		this.ActID = ActID;
	}


	public int getASwitch() {
		return ASwitch;
	}


	public void setASwitch(int Switch) {
		this.ASwitch = Switch;
	}


	
	public String toString() {
		return this.ActID+ "\t\t" +this.ASwitch + "\t\t" ;

	}
}