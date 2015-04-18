package edu.neu.cs5200.ispot.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;


import edu.neu.cs5200.ispot.model.Comment;
import edu.neu.cs5200.ispot.model.EndUser;
import edu.neu.cs5200.ispot.model.Information;
import edu.neu.cs5200.ispot.model.Spot;
import edu.neu.cs5200.ispot.model.User;

public class UserDAO {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("I-Spot");	
	EntityManager em = factory.createEntityManager();
// General Methods	
	//createUser
	public User createUser(User user) {
		em.getTransaction().begin();
		em.persist(user);
		em.getTransaction().commit();
		return user;
	}

	//readUserById
	// readMovieById
	public User readUserById(Integer id)
	{
		return em.find(User.class, id);
	}
	
	//readAllUsers
	public List<User> readAllUsers()
	{
		Query query = em.createQuery("select user from User user");
		return (List<User>)query.getResultList();
	}

	//updateUser
	public User updateUser(User user)
	{
		em.getTransaction().begin();
		em.merge(user);
		em.getTransaction().commit();
		return user;
	}

	//deleteUser
	public void deleteUser(int id) {
		em.getTransaction().begin();
	    User user = em.find(User.class, id);
		em.remove(user);
		em.getTransaction().commit();
	}
// General Methods	

// Methods relating to foreign key

	// subscribeSpot
	public List<Spot> subscribeSpot(Integer id, Spot spot){
		em.getTransaction().begin();
	    User user = em.find(User.class, id);
		spot.getUsers().add(user);
		user.getSpots().add(spot);
	    em.getTransaction().commit();
		return user.getSpots();
	}
	
	// user share information
	
	public List<Information> share(Integer id, Information info){
		em.getTransaction().begin();
	    User user = em.find(User.class, id);
		info.getUsers().add(user);
		user.getInformations().add(info);
	    em.getTransaction().commit();
		return user.getInformations();
		}
	
	// FollowingUser
	public List<User> followingUser(Integer id, User following){
		em.getTransaction().begin();
	    User user = em.find(User.class, id);
		user.getFollowedUsers().add(following);
		following.getFollowingUsers().add(user);
	    em.getTransaction().commit();
		return user.getFollowedUsers();
	}
	
	//makeComment
	public List<Comment> makeComment(Integer id, Comment comment){
		em.getTransaction().begin();
	    User user = em.find(User.class, id);
		user.getComments().add(comment);
		comment.setUser(user);
	    em.getTransaction().commit();
		return user.getComments();
	}
	
	
	//for test
	
	// subscribeSpot
	// user share information
	// FollowingUser
	// makeComment
	// for test
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	
	// readUserById
	UserDAO Udao = new UserDAO();
    User user = Udao.readUserById(2);
    
    // read spot
    List<Spot> spots =user.getSpots();
    for (Spot spot: spots){
    	System.out.println(spot);	
    }
        
    // read following user
    System.out.println("------read following user-----");
    List<User> following_users =user.getFollowingUsers();
    for (User u: following_users ){
    	System.out.println(u.getFirstname());	
    	System.out.println(u.getLastname());
    	
    }
    
	System.out.println("------read followed user-----");
    // read followed user
    List<User> followed_users =user.getFollowedUsers();
    for (User u: followed_users ){
    	System.out.println(u.getFirstname());	
    	System.out.println(u.getLastname());
    	
    }
    
	System.out.println("------read informations-----");
    // TODO read informations
    List<Information> informations =user.getInformations();
    for (Information i: informations ){
    	System.out.println(i);		
    }
    
	System.out.println("------read comments-----");
    // TODO	read comments
    List<Comment> comments =user.getComments();
    for (Comment c: comments ){
    	System.out.println(c.getContent());		
    }
    
	

	}

}
