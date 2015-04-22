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
	
	public List<Spot> unsubscribeSpot(Integer id, Spot spot){
		em.getTransaction().begin();
		    UserDAO dao = new UserDAO();
		User user = dao.readUserById(id);
		int userid=spot.getUserIndex(user);
		int spotid=user.getSpotIndex(spot);
		spot.getUsers().remove(userid);
		user.getSpots().remove(spotid);
		em.merge(user);
		em.merge(spot);
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
	
//	public List<User> unfollowingUser(Integer id, User following){
//		em.getTransaction().begin();
//	    UserDAO dao = new UserDAO();
//		User user = dao.readUserById(id);
//		int user1id= user2.getFollowedUserIndex(user);
//		int user2id= user1.getFollowingUserIndex(spot);
//		spot.getUsers().remove(userid);
//		user.getSpots().remove(spotid);
//		em.merge(user);
//		em.merge(spot);
//		em.getTransaction().commit();
//		return user.getSpots();
//	}
	
	public List<Comment> makeComment(Integer id, Comment comment){
		em.getTransaction().begin();
	    User user = em.find(User.class, id);
		user.getComments().add(comment);
		comment.setUser(user);
	    em.getTransaction().commit();
		return user.getComments();
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

//	UserDAO Udao = new UserDAO();
//    User user = Udao.readUserById(6);
//	//InformationDAO IDAO = new InformationDAO();
//	//Information info = IDAO.readInformationById(1);
//    Udao.followingUser(7,user);
    
//    System.out.println("-------subscribe-------");
//    SpotDAO Sdao= new SpotDAO();
//    Spot s3 = Sdao.readSpotById(3);
//    Udao.subscribeSpot(1,s3);

	}

}
