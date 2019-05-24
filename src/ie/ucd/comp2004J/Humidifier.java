package ie.ucd.comp2004J;

public class Humidifier {
	
	private int ActID;
	private int WaterVolume;
	private int HSwitch;
	
	
	public Humidifier(int ActID, int WaterVolume, int HSwitch) {
		super();
		this.ActID = ActID;
		this.WaterVolume = WaterVolume;
		this.HSwitch = HSwitch;
	}

	public int getActID() {
		return ActID;
	}


	public int getWaterVolume() {
		return WaterVolume;
	}
	public int getHSwitch() {
		return HSwitch;
	}
//	public String toString() {
//		return this.ActID+ "\t\t" +this.ASwitch + "\t\t" ;
//
//	}
}