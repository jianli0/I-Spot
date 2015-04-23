package edu.neu.cs5200.ispot.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.ispot.model.*;


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
		
		//unsubscribe
		public List<Spot> unsubscribeSpot(Integer id, Spot spot){
			em.getTransaction().begin();
		    UserDAO dao = new UserDAO();
			User user = dao.readUserById(id);
//			List<User> users = spot.getUsers();
//			List<Spot> spots = user.getSpots();
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
		public List<User> followingUser(Integer id, User followed){
			em.getTransaction().begin();
		    User user = em.find(User.class, id);
			user.followUser(followed);
		    em.getTransaction().commit();
			return user.getFollowedUsers();
		}
		
		public List<Comment> makeComment(Integer id, Comment comment){
			em.getTransaction().begin();
		    User user = em.find(User.class, id);
			user.getComments().add(comment);
			comment.setUser(user);
		    em.getTransaction().commit();
			return user.getComments();
		}

		public  List<User> unfollowUser(Integer id, User followed){
			em.getTransaction().begin();
			User user = em.find(User.class,id);
			user.unfollowUser(followed);
		    em.getTransaction().commit();
			return user.getFollowedUsers();
		}
		
		public static void main(String[] args) {
			UserDAO  udao = new UserDAO();
			User user6= udao.readUserById(6);
			udao.unfollowUser(2, user6);



			}

}