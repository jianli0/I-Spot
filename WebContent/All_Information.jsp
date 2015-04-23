<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="edu.neu.cs5200.ispot.dao.*,edu.neu.cs5200.ispot.model.*,java.util.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Information</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
</head>
<body>
	<div class="container">	
	
	<%
			InformationDAO idao = new InformationDAO();
			Integer id =(Integer)session.getAttribute("user_id");

			
			List<Information> infos = idao.readAllInformation();
			
/* 			if("create".equals(action))
			{
				User user = new User(null,password,firstname,lastname,email,username,type);
				dao.createUser(user);
			} */
			
/* 			else if("delete".equals(action))
			{
				Integer id = Integer.parseInt(idStr);
				dao.deleteMovie(id);
			} */
				
/* 			List<Movie> movies = dao.readAllMovies(); */
		%>
		<h2>All Information</h2>
		
		<form action="All_Information.jsp">
		<table class="table table-striped">
			<tr>
				<th>Spot</th>
				<th>Type</th>
				<th>Content</th>
				<th>&nbsp;</th>
			</tr>
		<%
			for(Information inf : infos)
			{
		%>	<tr>
<%-- 				<td>
					<a href="movieDetails.jsp?id=<%= movie.getId() %>">
					<%= comment.getContent() %>
					</a>
				</td> --%>
				<td><%= inf.getSpot().getLocationname() %></td>
				<td><%= inf.getType() %></td>
				<%if ("V".equals(inf.getType())){
					%>
					<td>
					<video width="320" height="240" autoplay>
 					 <source src="<%= inf.getContent() %>" type="video/mp4">
 					 </video>
					</td>
					<%  }
				else if("P".equals(inf.getType())){
					%>
					<td>
					<img src="<%= inf.getContent() %>" alt="<%= inf.getSpot().getLocationname() %>" height="240" width="320">
					</td>
					<%  }
				else {
					%>
					<td><%= inf.getContent() %></td>
					<% 
				}
				%>
				<td>
					<a href="Make_Comment.jsp?info=<%=inf.getId() %>" class="btn btn-primary">Comment</a>
				</td>
			</tr>
		<%
			}
		%>
		</table>
		</form>
	</div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js">
</script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js">
</script>
</body>
</html>

</body>
</html>