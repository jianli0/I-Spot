package edu.neu.cs5200.ispot.model;

import java.util.List;

import javax.persistence.*;

@Entity
public class Spot {

	@Id
	private Integer id;
	@Override
	public String toString() {
		return "Spot [id=" + id + ", Locationname=" + Locationname
				+ ", Adress=" + Adress + "]";
	}
	private String  Locationname;
	private String  Adress;
	
	@ManyToMany(mappedBy="spots")
    private List<User> users;
	
	public List<User> getUsers() { 
        return users;
    }
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLocationname() {
		return Locationname;
	}
	public void setLocationname(String locationname) {
		Locationname = locationname;
	}
	public String getAdress() {
		return Adress;
	}
	public void setAdress(String adress) {
		Adress = adress;
	}
	public Spot(Integer id, String locationname, String adress) {
		super();
		this.id = id;
		Locationname = locationname;
		Adress = adress;
	}
	public Spot() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
