<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
        import="edu.neu.cs5200.ispot.dao.*,edu.neu.cs5200.ispot.model.*,java.util.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Following Users</title>
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
		UserDAO user_dao = new UserDAO();
		
		Integer user_id = (Integer)session.getAttribute("user_id");
		User user = user_dao.readUserById(user_id); 
		
	
 		String action = request.getParameter("action");
 		String idStr1 = request.getParameter("uid");
		
		
		 if("follow".equals(action))
			{
			 Integer second_id = Integer.parseInt(idStr1);
			 User second_user = user_dao.readUserById(second_id);
			 user_dao.followingUser(user_id,second_user);
			 %>
				<script>window.location= "All_User.jsp";</script>
			<% 
			}  
		 else if("delete".equals(action) && ("A".equals(user.getType()))){
			 Integer second_id = Integer.parseInt(idStr1);
			 user_dao.deleteUser(second_id);
			 %>
				<script>window.location= "All_User.jsp";</script>
			<% 
			 }
		 else if("unfollow".equals(action)){
			Integer second_id = Integer.parseInt(idStr1);
			User second_user = user_dao.readUserById(second_id);
			user_dao.unfollowUser(user_id, second_user); 
		 }
		
		List<User> users = user_dao.readAllUsers();
	%>
	<div class="container">
		<h1>User: <%= user.getFirstname() %></h1>		
		<h2>My Following Users</h2>
		
		<form action="User_User.jsp">
		<table class="table table-striped">
			<tr>
				<th>User name</th>
				<th>First name</th>
				<th>Last name</th>
				<th>&nbsp;</th>
			</tr>
		<%
			for(User u : users)
			{
		%>	<tr>
				<td><%= u.getUsername()%></td>
				<td><%= u.getFirstname()%></td>
				<td><%= u.getLastname()%></td>
				<td>
				<% %>
					<a href="All_User.jsp?action=follow&uid=<%= u.getId() %>" class="btn btn-success">Follow</a>
				</td>
			<%if ("A".equals(user.getType()))
					{ %>
				
				<td>
					<a href="All_User.jsp?action=delete&uid=<%= u.getId() %>" class="btn btn-danger">Delete</a>
				</td>
				</tr>
				<% }
			}%>
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