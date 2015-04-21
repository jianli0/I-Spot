<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="edu.neu.cs5200.ispot.dao.*,edu.neu.cs5200.ispot.model.*,java.util.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>User: <%= user.getFirstname() %></h1>		
		<h2>Comments</h2>
		
		<form action="User_Comment.jsp">
		<table class="table table-striped">
			<tr>
				<th>Spot</th>
				<th>Information</th>
				<th>Comment</th>
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

</body>
</html>