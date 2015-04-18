package edu.neu.cs5200.ispot.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.ispot.model.Video;
import edu.neu.cs5200.ispot.model.Spot;

public class VideoDAO {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("I-Spot");
	EntityManager em = factory.createEntityManager();
	
	public Video createVideo(Video info )
	{
		em.getTransaction().begin();
		em.persist(info);
		em.getTransaction().commit();
		return info;
		}
	// readInfoById
	public Video readVideoById(Integer id)
	{
		return em.find(Video.class, id);
	}

	// readAllSpots
	public List<Video> readAllVideo()
	{
		Query query = em.createQuery("select Video from Video Video");
		return (List<Video>)query.getResultList();
	}
	// updateSpot
	
	
	public Video updateVideo(Video info)
	{
		em.getTransaction().begin();
		em.merge(info);
		em.getTransaction().commit();
		return info;
	}

	// deleteSpot
	public void deleteVideo(int id) {
		em.getTransaction().begin();
		Video video = em.find(Video.class, id);
		em.remove(video);
		em.getTransaction().commit();
		}

 
	public static void main(String[] args) {
	  VideoDAO dao = new VideoDAO();
	  List<Video> pics = dao.readAllVideo();
	  for(Video p : pics){
		  System.out.println(p.getContent());
	  }

	}

}


