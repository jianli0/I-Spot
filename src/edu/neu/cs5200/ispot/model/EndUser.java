package edu.neu.cs5200.ispot.model;

import javax.persistence.*;

@Entity
@DiscriminatorValue("E")
public class EndUser extends User {

	public EndUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EndUser(Integer id, String password, String firstname,
			String lastname, String email, String username, String type) {
		super(id, password, firstname, lastname, email, username, type);
		// TODO Auto-generated constructor stub
	}

	
}
