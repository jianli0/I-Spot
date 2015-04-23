package edu.neu.cs5200.ispot.model;

import javax.persistence.*;

@Entity
@DiscriminatorValue("V")

public class Video extends Information {

	public Video() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Video(Integer id, Spot spot, String content, String type) {
		super(id, spot, content, "V");
		// TODO Auto-generated constructor stub
	}

	
}
