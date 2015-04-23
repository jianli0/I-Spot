package edu.neu.cs5200.ispot.model;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("P")

public class Picture extends Information {

	public Picture() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Picture(Integer id, Spot spot, String content, String type) {
		super(id, spot, content, "P");
		// TODO Auto-generated constructor stub
	}

	
}
