<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
        import="edu.neu.cs5200.ispot.dao.*,edu.neu.cs5200.ispot.model.*,java.util.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Comment Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="style.css">
</head>
<body>

<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<div class="container">
		<%
			
			String idStr = request.getParameter("id");
		    String action = request.getParameter("action");
		    String title  = request.getParameter("title");
		    String poster = request.getParameter("poster");
		    String movieId = request.getParameter("movieId");
		    
			Integer id = Integer.parseInt(idStr);
			UserDAO dao = new UserDAO();
			User user = dao.readUserById(id); 

		    if("create".equals(action))
		    {
		        Movie movie = new Movie();
		        movie.setTitle(title);
		        movie.setPoster(poster);
		        movie.setMovieId(movieId);
		        movieDAO.create(movie);
		    }
		    else if("delete".equals(action))
		    {
		        int idInt = Integer.parseInt(id);
		        movieDAO.deleteMovie(idInt);   
		    }
		    else if("update".equals(action))
		    {
		        int idInt = Integer.parseInt(id);
		        Movie movie = new Movie();
		        movie.setTitle(title);
		        movie.setPoster(poster);
		        movie.setMovieId(movieId);
		        movieDAO.updateMovie(idInt, movie);
		    }
			
			/* System.out.println(user.getFirstname()); */
			
/* 			if("create".equals(action))
			{
				User user = new User(null,password,firstname,lastname,email,username,type);
				dao.createUser(user);
			} */
			
		%>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</body>
</html>