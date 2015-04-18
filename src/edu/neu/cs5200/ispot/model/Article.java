package edu.neu.cs5200.ispot.model;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("A")

public class Article extends Information {

	public Article() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Article(Integer id, String content) {
		super(id, content);
		// TODO Auto-generated constructor stub
	}

	
}
