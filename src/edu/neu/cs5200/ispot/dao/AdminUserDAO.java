package edu.neu.cs5200.ispot.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.ispot.model.AdminUser;
import edu.neu.cs5200.ispot.model.Spot;

public class AdminUserDAO {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("I-Spot");
	EntityManager em = factory.createEntityManager();
	
	public AdminUser createAdminUser(AdminUser info )
	{
		em.getTransaction().begin();
		em.persist(info);
		em.getTransaction().commit();
		return info;
		}
	// readInfoById
	public AdminUser readAdminUserById(Integer id)
	{
		return em.find(AdminUser.class, id);
	}

	// readAllSpots
	public List<AdminUser> readAllAdminUser()
	{
		Query query = em.createQuery("select AdminUser from AdminUser AdminUser");
		return (List<AdminUser>)query.getResultList();
	}
	// updateSpot
	
	
	public AdminUser updateAdminUser(AdminUser info)
	{
		em.getTransaction().begin();
		em.merge(info);
		em.getTransaction().commit();
		return info;
	}

	// deleteSpot
	public void deleteAdminUser(int id) {
		em.getTransaction().begin();
		AdminUser a = em.find(AdminUser.class, id);
		em.remove(a);
		em.getTransaction().commit();
		}
	
	//for test
	public static void main(String[] args) {
		
		AdminUserDAO dao = new AdminUserDAO();
		
		//createAdminUser
//		AdminUser adminuser = 
//				new AdminUser(1,"123456","Alice","Zeus","alice@gmail.com",
//						"useralice","A");
//		adminuser = dao.createAdminUser(adminuser);
//		System.out.println(adminuser.getId());
		
		//readAdminUserById
		AdminUser alice = dao.readAdminUserById(1);
		System.out.println(alice.getLastname());
		
		

//		dao.deleteMovie(3);
		
//		List<Movie> movies = dao.readAllMovies();
//		for(Movie movie : movies)
//		{
//			System.out.println(movie.getTitle());
//		}
		
//		titanic.setPlot("Titanic sinks at the end");
//		dao.updateMovie(titanic);
		
//		Actor hicks = new Actor(null, "Michael", "Biehn", new Date(), null);
//		dao.addActor(4, hicks);
//		
//		Movie aliens = dao.readMovieById(4);
//		System.out.println(aliens.getActors().size());
//		
//		List<Actor> actors = aliens.getActors();		
//		for(Actor actor : actors)
//		{
//			System.out.println(actor.getFirst());
//		}
	}
 
	

}


