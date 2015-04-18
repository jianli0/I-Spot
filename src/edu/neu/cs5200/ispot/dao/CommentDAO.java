package edu.neu.cs5200.ispot.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.ispot.model.Comment;

public class CommentDAO {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("I-Spot");	
	EntityManager em = factory.createEntityManager();
	//createComment
	
	public Comment createComment(Comment Comment) {
		em.getTransaction().begin();
		em.persist(Comment);
		em.getTransaction().commit();
		return Comment;
	}

	//readCommentById
	// readMovieById
	public Comment readCommentById(Integer id)
	{
		return em.find(Comment.class, id);
	}
	

	//readAllComments
	public List<Comment> readAllComments()
	{
		Query query = em.createQuery("select comment from Comment comment");
		return (List<Comment>)query.getResultList();
	}

	//updateComment
	public Comment updateComment(Comment Comment)
	{
		em.getTransaction().begin();
		em.merge(Comment);
		em.getTransaction().commit();
		return Comment;
	}

	//deleteComment
	public void deleteComment(int id) {
		em.getTransaction().begin();
	    Comment Comment = em.find(Comment.class, id);
		em.remove(Comment);
		em.getTransaction().commit();
	}
	





}

