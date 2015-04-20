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
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js">
</script>

	<%
		String idStr = request.getParameter("id");
		Integer user_id = Integer.parseInt(idStr);
		
		String idStr1 = request.getParameter("commentid");

		
		UserDAO user_dao = new UserDAO();
		CommentDAO comment_dao = new CommentDAO();
		InformationDAO info_dao = new InformationDAO();
		
		User user = user_dao.readUserById(user_id); 
	
 		String action = request.getParameter("action");
 		
/*  		String spot = request.getParameter("comment");
 		String information = request.getParameter("information");
 		String comment_content  = request.getParameter("comment_content"); */
 	
 		/* 	
 		Integer new_spot_id = Integer.parseInt(spot);
 		Integer new_info_id = Integer.parseInt(information);
		 */
		 
	 if("delete".equals(action))
			{
				
				Integer comment_id = Integer.parseInt(idStr1);
				comment_dao.deleteComment(comment_id);
				%>
				<script>window.location= "User_Comment.jsp?id=<%= user.getId() %>";</script>
				<% 
			} 
		 
	List<Comment> comments = user.getComments();
		 
	
	%>
	<div class="container">
		<h1>User: <%= user.getFirstname() %></h1>		
		<h2>Comments</h2>
		
		<form action="User_Comment.jsp">
		<table class="table table-striped">
			<tr>
				<th>Spot</th>
				<th>Information</th>
				<th>Comment</th>
				<th></th>
				<th>&nbsp;</th>
			</tr>
<!-- 			<tr>
			can be made a downdrag rectangle
				<td><input name="spot" class="form-control" placeholder="spot_id"
							required autofocus/></td>
				<td><input name="information" class="form-control" placeholder="information_id"
							required autofocus/></td>
				<td><input name="comment_content" class="form-control" placeholder="comment"
							required autofocus/></td>
			</tr> -->
		<%
			for(Comment comment : comments)
			{
		%>	<tr>
<%-- 				<td>
					<a href="movieDetails.jsp?id=<%= movie.getId() %>">
					<%= comment.getContent() %>
					</a>
				</td> --%>
				<td><%= comment.getInfo().getSpot().getLocationname() %></td>
				<td><%= comment.getInfo().getContent() %></td>
				<td><%= comment.getContent() %></td>
				<td>
					<a href="User_Comment.jsp?id=<%=user.getId()%>&action=delete&commentid=<%= comment.getId() %>" class="btn btn-danger">Delete</a>
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