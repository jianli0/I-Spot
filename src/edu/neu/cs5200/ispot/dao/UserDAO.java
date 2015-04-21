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
import edu.neu.cs5200.ispot.dao.*;

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
	
	public void unsubscribeSpot(Integer id, Spot spot){
//		UserDAO Udao = new UserDAO();
//		SpotDAO Sdao = new SpotDAO();
//		em.getTransaction().begin();
//	    User user = em.find(User.class, id);
//		spot.getUsers().remove(user);
//		user.getSpots().remove(spot);
//	    em.getTransaction().commit();
//		return user.getSpots();
		System.out.println("not working");
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
	
	public void unfollowingUser(Integer id, User following){
		System.out.println("not working");
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
	
	public static void main(String[] args) {
	UserDAO Udao = new UserDAO();
    System.out.println("------follow -----");
    
    User user12 = Udao.readUserById(12);
    
    Udao.followingUser(1,user12);
	}
}
//    System.out.println("------subscribe-----");
//    SpotDAO sdao = new SpotDAO();
//    Spot spot1 =	 sdao.readSpotById(1);
//    
//    Udao.subscribeSpot(2,spot1);
//    List<Spot> spots2 =user.getSpots();
//    for (Spot s: spots2 ){
//    	System.out.println(s.getLocationname());		
//    }
    

    
//    for (User s: users ){
//    	System.out.println(s.getFirstname());		
//    }
    
//    System.out.println("------subscirbe -----");
//    User user1 = Udao.readUserById(1);
//    
//    SpotDAO sdao = new SpotDAO();
//    Spot spot3 =	 sdao.readSpotById(3);
//    
//    Udao.subscribeSpot(1,spot3);
//    List<Spot> spots1 = user1.getSpots();
//    for (Spot s: spots1 ){
//    	System.out.println(s.getLocationname());		
//    }
    
    
//    System.out.println("------unsubscribe-----");
//    SpotDAO sdao = new SpotDAO();
//    Spot spot1 =	 sdao.readSpotById(1);
 
//    List<Spot> spots2 = Udao.unsubscribeSpot(2,spot1);
//    for (Spot s: spots2 ){
//    	System.out.println(s.getLocationname());		
//    }

