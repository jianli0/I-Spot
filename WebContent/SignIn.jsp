<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="edu.neu.cs5200.ispot.dao.*, edu.neu.cs5200.ispot.model.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign In</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="style.css"> 
</head>
<body>
<div class="container">
		
		<%
			UserDAO dao = new UserDAO();
		
			String action = request.getParameter("action");
			
			String username  = request.getParameter("username");
			String password  = request.getParameter("password");
			
			List<User> users = dao.readAllUsers();
			
			if("signin".equals(action))
			{
				System.out.println("signin clicked");
				for(User user:users)
				{
					if (user.getUsername().equals(username))
					{
						if(user.getPassword().equals(password))
						{	
							/* <p>Your user page: <a href="user.jsp">here</a></p>  */
							System.out.println("successful login");
							
						}
							
					}
					  
				}	
				System.out.println("signin clicked");
			}
			
			
/*			public void checkUser(String s, String p, List<User> users)
			{
				for(User user:users)
				{
					if (user.getUsername().equals(username))
					{
						if(user.getPassword().equals(password))
						{	
							%>
							
							<p>Your user page: <a href="user.jsp">here</a></p> 
							<!-- out.println("successful login");  -->
							
							<%
						}
							
					}
					  
				}
			}  
*/
			
/* 			else if("delete".equals(action))
			{
				Integer id = Integer.parseInt(idStr);
				dao.deleteMovie(id);
			} */
				
/* 			List<Movie> movies = dao.readAllMovies(); */
		%>
		
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h1 class="text-center login-title">Sign in to continue to ISpot</h1>
            <div class="account-wall">
                <img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                    alt="">
                    
                <form class="form-signin" action="SignIn.jsp">
                <input name="usrname" class="form-control" placeholder="Username" required autofocus>
                <input name="password" class="form-control" placeholder="Password" required>
                <button class="btn btn-lg btn-primary btn-block" type="submit" name="action" value="signin"
                onclick="checkUser()" >
                    Sign in</button>
                </form>
        </div>
            <a href="Register.jsp" class="text-center new-account">Create An Account</a>
        </div>
    </div>
</div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

</body>
</html>
