package edu.neu.cs5200.ispot.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.ispot.model.Spot;

public class SpotDAO {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("I-Spot");
	EntityManager em = factory.createEntityManager();
	//createspot
	public Spot createSpot(Spot spot)
	{
		em.getTransaction().begin();
		em.persist(spot);
		em.getTransaction().commit();
		return spot;
		}
	// readSpotById
	public Spot readSpotById(Integer id)
	{
		return em.find(Spot.class, id);
	}

	// readAllSpots
	public List<Spot> readAllMovies()
	{
		Query query = em.createQuery("select spot from Spot spot");
		return (List<Spot>)query.getResultList();
	}
	// updateSpot
	public Spot updateSpot(Spot spot)
	{
		em.getTransaction().begin();
		em.merge(spot);
		em.getTransaction().commit();
		return spot;
	}

	// deleteSpot
	public void deleteSpot(int id) {
		em.getTransaction().begin();
		Spot spot = em.find(Spot.class, id);
		em.remove(spot);
		em.getTransaction().commit();
	}	












}
