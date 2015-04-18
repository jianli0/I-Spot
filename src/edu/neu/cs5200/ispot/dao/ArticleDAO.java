package edu.neu.cs5200.ispot.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.ispot.model.Article;
import edu.neu.cs5200.ispot.model.Spot;

public class ArticleDAO {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("I-Spot");
	EntityManager em = factory.createEntityManager();
	
	public Article createArticle(Article info )
	{
		em.getTransaction().begin();
		em.persist(info);
		em.getTransaction().commit();
		return info;
		}
	// readInfoById
	public Article readArticleById(Integer id)
	{
		return em.find(Article.class, id);
	}

	// readAllSpots
	public List<Article> readAllArticle()
	{
		Query query = em.createQuery("select Article from Article Article");
		return (List<Article>)query.getResultList();
	}
	// updateSpot
	
	
	public Article updateArticle(Article info)
	{
		em.getTransaction().begin();
		em.merge(info);
		em.getTransaction().commit();
		return info;
	}

	// deleteSpot
	public void deleteArticle(int id) {
		em.getTransaction().begin();
		Article a = em.find(Article.class, id);
		em.remove(a);
		em.getTransaction().commit();
		}

 
	public static void main(String[] args) {
	  ArticleDAO dao = new ArticleDAO();
	  List<Article> pics = dao.readAllArticle();
	  for(Article p : pics){
		  System.out.println(p.getContent());
	  }

	}

}


