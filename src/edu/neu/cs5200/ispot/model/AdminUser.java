package edu.neu.cs5200.ispot.model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("A")
public class AdminUser extends User {

	public AdminUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminUser(Integer id, String password, String firstname,
			String lastname, String email, String username, String type) {
		super(id, password, firstname, lastname, email, username, type);
		// TODO Auto-generated constructor stub
	}

	
}
