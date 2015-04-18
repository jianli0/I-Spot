package edu.neu.cs5200.ispot.model;

import java.util.List;

import javax.persistence.*;

@Entity
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="Type",discriminatorType=DiscriminatorType.STRING)
@DiscriminatorValue("I")
public class Information {

	@Override
	public String toString() {
		return "Information [id=" + id + ", spot=" + spot + ", content="
				+ content + ", Type=" + Type + "]";
	}
	@Id
	protected Integer id;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="Spot")
	protected Spot spot;
	
	@ManyToMany(mappedBy="informations")
	protected List<User> users; 
	
	
	
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	protected String content;
	protected String Type;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@OneToMany(mappedBy="info")
	protected List<Comment> comments;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Spot getSpot() {
		return spot;
	}
	public void setSpot(Spot spot) {
		this.spot = spot;
	}
	public Information(Integer id, String content) {
		super();
		this.id = id;
		this.content = content;
	  
	}
	public Information() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
