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
	
	public int getUserIndex(User user){
		int i = 0;
		for (i=0;i<this.users.size(); i++){
		if(this.users.get(i).getId()==user.getId())
		break;}
		return i;

		}
}
