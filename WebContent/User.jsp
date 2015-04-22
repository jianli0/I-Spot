<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
        import="edu.neu.cs5200.ispot.dao.*,edu.neu.cs5200.ispot.model.*,java.util.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>home page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="style.css"> 
</head>

<body>
<div class="container">
		<%
			
			String idStr = request.getParameter("id");

			Integer id = Integer.parseInt(idStr);
			UserDAO dao = new UserDAO();
			User user = dao.readUserById(id); 
			
			
  
			
		%>
	<div class="row">
		<div class="col-sm-4 col-md-4 user-details">
            <div class="user-image">
                <img src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120">
            </div>
            <div class="user-info-block">
                <div class="user-heading">
                    <h3><%=user.getFirstname()%>  <%=user.getLastname()%></h3>
                </div>
                <ul class="navigation">
                    <li class="active">
                        <a data-toggle="tab">
                            <span class="glyphicon glyphicon-envelope"></span><p><%=user.getEmail() %></p>
                        </a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="User_information.jsp?id=<%=user.getId()%>">
                            <span class="glyphicon glyphicon-picture"></span>
                        </a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="All_Spots.jsp?id=<%=user.getId()%>">
                            <span class="glyphicon glyphicon-home"></span>
                        </a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="User_Comment.jsp?id=<%=user.getId()%>">
                            <span class="glyphicon glyphicon-text-color"></span>
                        </a>
                    </li>
                </ul>
                <div class="user-body">
                    <div class="tab-content">
                        <div id="information" class="tab-pane active">
                        <a href="SignIn.jsp" class="btn btn-danger">Sign Out</a>
                        </div>
                        <div id="settings" class="tab-pane">
                            <h4>Settings</h4>
                        </div>
                        <div id="email" class="tab-pane">
                            <h4>Send Message</h4>
                        </div>
                        <div id="events" class="tab-pane">
                            <h4>Events</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
</div>
</body>
</html>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

