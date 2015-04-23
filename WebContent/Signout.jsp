<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
        import="edu.neu.cs5200.ispot.dao.*,edu.neu.cs5200.ispot.model.*,java.util.*"
    %>
<html> 
<head> 
<title>Logout</title> 
</head> 
<body> 
<%   
   response.setHeader("refresh","0.5;URL=SignIn.jsp");  
   session.invalidate();   
%> 
<h3>Successfully Logout</h3> 
</body> 
</html> 