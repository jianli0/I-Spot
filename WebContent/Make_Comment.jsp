<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="edu.neu.cs5200.ispot.dao.*, edu.neu.cs5200.ispot.model.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<title>Insert title here</title>
</head>
<body>
	<div class="well">
	<%
			CommentDAO dao = new CommentDAO();
			UserDAO udao = new UserDAO();
			InformationDAO idao = new InformationDAO();
		
			String action = request.getParameter("action");
			String idStr  = request.getParameter("id");
			String idStr1  = request.getParameter("info");
			String comment   = request.getParameter("comment");
			
					
			if("create".equals(action))
			{
				Integer id = Integer.parseInt(idStr);
				Integer info_id = Integer.parseInt(idStr1);
				User u = udao.readUserById(id);
				Information i =idao.readInformationById(info_id);
				Comment c = new Comment(null, comment, u,i);
				dao.createComment(c);
			}
			
		%>
		
                 <h4>Leave a Comment:</h4>
                 <form action = "Make_Comment.jsp">
                     <div class="form-group">
                         <input name="comment" class="form-control" rows="3"></input>
                     </div>
                     <button type="submit" class="btn btn-primary" name="action" value="create">Submit</button>
                 </form>
             </div>

</body>
</html>