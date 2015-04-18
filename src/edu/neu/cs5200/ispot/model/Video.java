package edu.neu.cs5200.ispot.model;

import javax.persistence.*;

@Entity
@DiscriminatorValue("V")

public class Video extends Information {

	public Video() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Video(Integer id, String content) {
		super(id, content);
		// TODO Auto-generated constructor stub
	}

	
}
