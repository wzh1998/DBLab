package ie.ucd.comp2004J;

public class Lamp {
	private int ActID;
	private int Mode;

	
	public Lamp(int ActID, int Mode) {
		super();
		this.ActID = ActID;
		this.Mode = Mode;
	}

	public int getActID() {
		return ActID;
	}


	public int getMode() {
		return Mode;
	}
}
