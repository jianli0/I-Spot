<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="edu.neu.cs5200.ispot.dao.*,edu.neu.cs5200.ispot.model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spot</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href = "main.css">
</head>
<body>
	<div="container">
		<%
			Integer id = (Integer)session.getAttribute("user_id");
			UserDAO dao = new UserDAO();
			User u1 = dao.readUserById(id);
		%>
	<header>
	<span class="label label-default"></span>
    <a href="User_Myprofile.jsp" class="btn btn-primary">
    <img class="profile-img"
	src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
		alt=""></a>
	<li>
	<h1>	 <% out.println(u1.getUsername()); %>	</h1>
	<a href="Signout.jsp" class="btn btn-danger">Sign Out</a>
	</li>
		
		<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="All_Spots.jsp">All Spots</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="All_Information.jsp">All Information</a></li>
					<li><a href="All_Comment.jsp">All Comments</a></li>
					<li><a href="All_User.jsp" class="btn btn-danger">All Users</a></li>					
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">Dropdown
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="User_Myprofile.jsp">Account Settings</a></li>
							<li><a href="User_Spot.jsp"> My Spots</a></li>
							<li><a href="User_Information.jsp">My Information</a></li>
							<li><a href="User_Comment.jsp">My Comments</li>
							<li><a href="User_Users.jsp">My Follow Users</li>
							<li><a href="#">Separated link</a></li>
							<li class="divider"></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
		</div>
	 </nav>
	</div>
</header>
</body>

</html>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>