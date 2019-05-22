package ie.ucd.comp2004J;

import java.util.List;

public class Test {

	public static void main(String[] args) {
		
		Actuator e = new Actuator(1001, "a1", 2);
		System.out.print(ActuatorDAO.insertActuator(e));
		
		List<Actuator> actuators = ActuatorDAO.getAllActuators(1);
		for(int i=0; i<actuators.size(); i++) {
			Actuator actuator = actuators.get(i);
			System.out.println(actuator.toString()+"\n");
		}
		
		//TODO Question 6 
		
		

	}

}
