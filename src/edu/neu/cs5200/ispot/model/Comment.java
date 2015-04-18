package edu.neu.cs5200.ispot.model;

import javax.persistence.*;

@Entity
public class Comment {

	@Id
	private Integer Id;
	private String Content;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="User")
	private User user;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="Info")
	private Information info;
	
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		user = user;
	}
	public Information getInfo() {
		return info;
	}
	public void setInfo(Information info) {
		this.info = info;
	}
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comment(Integer id, String content,
			edu.neu.cs5200.ispot.model.User user, Information info) {
		super();
		Id = id;
		Content = content;
		user = user;
		this.info = info;
	}
	
}
