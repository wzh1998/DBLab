package ie.ucd.comp2004J;

public class BTLock {
	
	private int ActID;
	private int State;
	private String BTKey;
	private String TempKey;
	private String TempKeyStartTime;
	
	
	public BTLock(int ActID, int State, String BTKey, String TempKey, String TempKeyStartTime) {
		super();
		this.ActID = ActID;
		this.State = State;
		this.BTKey = BTKey;
		this.TempKey = TempKey;
		this.TempKeyStartTime = TempKeyStartTime;
	}


	public int getActID() {
		return ActID;
	}


	


	public int getState() {
		return State;
	}


	public String getBTKey() {
		return BTKey;
	}
	public String getTempKey() {
		return TempKey;
	}

	public String getTempKeyStartTime() {
		return TempKeyStartTime;
	}
//	public String toString() {
//		return this.ActID+ "\t\t" +this.ASwitch + "\t\t" ;
//
//	}
}