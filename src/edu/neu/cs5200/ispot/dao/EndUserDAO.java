package edu.neu.cs5200.ispot.dao;

import edu.neu.cs5200.ispot.model.EndUser;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class EndUserDAO {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("I-Spot");
	EntityManager em = factory.createEntityManager();

	public EndUser createEndUser(EndUser info )
	{
		em.getTransaction().begin();
		em.persist(info);
		em.getTransaction().commit();
		return info;
		}
	// readInfoById
	public EndUser readEndUserById(Integer id)
	{
		return em.find(EndUser.class, id);
	}

	// readAllSpots
	public List<EndUser> readAllEndUser()
	{
		Query query = em.createQuery("select EndUser from EndUser EndUser");
		return (List<EndUser>)query.getResultList();
	}
	// updateSpot
	
	
	public EndUser updateEndUser(EndUser info)
	{
		em.getTransaction().begin();
		em.merge(info);
		em.getTransaction().commit();
		return info;
	}

	// deleteSpot
	public void deleteEndUser(int id) {
		em.getTransaction().begin();
		EndUser info = em.find(EndUser.class, id);
		em.remove(info);
		em.getTransaction().commit();
		}

	
}