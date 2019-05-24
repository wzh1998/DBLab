package ie.ucd.comp2004J;

public class Curtain {
	
	private int ActID;
	private int Crack;

	
	public Curtain(int ActID, int Crack) {
		super();
		this.ActID = ActID;
		this.Crack = Crack;
	}

	public int getActID() {
		return ActID;
	}


	public int getCrack() {
		return Crack;
	}
	
//	public String toString() {
//		return this.ActID+ "\t\t" +this.ASwitch + "\t\t" ;
//
//	}
}