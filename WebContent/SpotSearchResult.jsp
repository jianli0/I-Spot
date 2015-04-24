<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
        import="edu.neu.cs5200.ispot.dao.*,edu.neu.cs5200.ispot.model.*,java.util.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<%
	String address=request.getParameter("q");
	%>
	<script console.log(<%=address%>)></script>
	<% 
	SpotDAO dao =new SpotDAO();
	
	List<Spot> spots = dao.readSpotByAdd(address);
	
	for(Spot spot : spots)
	{
		%>
			<a href="Map.jsp?address=<%= spot.getAdress() %>"class="list-group-item">
					<%= spot.getLocationname() %>
					</a>
		<% 
	}
	%>
	
	</div>
</body>
</html>