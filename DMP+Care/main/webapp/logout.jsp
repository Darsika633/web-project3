<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>
<%
    session.invalidate(); // Ends the user session
    response.sendRedirect("login.jsp"); // Redirect to login page
%>

</body>
</html>