package edu.neu.cs5200.ispot.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.ispot.model.Article;
import edu.neu.cs5200.ispot.model.Comment;
import edu.neu.cs5200.ispot.model.Information;
import edu.neu.cs5200.ispot.model.Picture;
import edu.neu.cs5200.ispot.model.Spot;
import edu.neu.cs5200.ispot.model.Video;

public class InformationDAO {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("I-Spot");
	EntityManager em = factory.createEntityManager();
	//createinfo
	public Information createInformation(Information info )
	{
		em.getTransaction().begin();
		em.persist(info);
		em.getTransaction().commit();
		return info;
		}
	// readInfoById
	public Information readInformationById(Integer id)
	{
		return em.find(Information.class, id);
	}

	// readAllSpots
	public List<Information> readAllInformation()
	{
		Query query = em.createQuery("select information from Information information");
		return (List<Information>)query.getResultList();
	}
	// updateSpot
	
	
	public Information updateInformation(Information info)
	{
		em.getTransaction().begin();
		em.merge(info);
		em.getTransaction().commit();
		return info;
	}

	// deleteSpot
	public void deleteInformation(int id) {
		em.getTransaction().begin();
		Information info = em.find(Information.class, id);
		em.remove(info);
		em.getTransaction().commit();
		}

    // make a comment for info
	public List<Comment> makeComment(Integer id, Comment comment){
		em.getTransaction().begin();
		Information info = em.find(Information.class, id);
		info.getComments().add(comment);
		comment.setInfo(info);
		em.getTransaction().commit();
	    return info.getComments();
	}
	
	public static void main(String[] args) {
	  InformationDAO dao = new InformationDAO();
	  Picture p = new Picture(null,"picture");
	  //Video info2 = new Video(null,"video","V");
	  dao.createInformation(p);

	}
	
}
