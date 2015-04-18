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

	public Picture(Integer id, String content) {
		super(id, content);
		// TODO Auto-generated constructor stub
	}

	
}
