package edu.neu.cs5200.ispot.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.ispot.model.Picture;
import edu.neu.cs5200.ispot.model.Spot;

public class PictureDAO {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("I-Spot");
	EntityManager em = factory.createEntityManager();
	
	public Picture createPicture(Picture info )
	{
		em.getTransaction().begin();
		em.persist(info);
		em.getTransaction().commit();
		return info;
		}
	// readInfoById
	public Picture readPictureById(Integer id)
	{
		return em.find(Picture.class, id);
	}

	// readAllSpots
	public List<Picture> readAllPicture()
	{
		Query query = em.createQuery("select Picture from Picture Picture");
		return (List<Picture>)query.getResultList();
	}
	// updateSpot
	
	
	public Picture updatePicture(Picture info)
	{
		em.getTransaction().begin();
		em.merge(info);
		em.getTransaction().commit();
		return info;
	}

	// deleteSpot
	public void deletePicture(int id) {
		em.getTransaction().begin();
		Picture picture = em.find(Picture.class, id);
		em.remove(picture);
		em.getTransaction().commit();
		}

 

	}



