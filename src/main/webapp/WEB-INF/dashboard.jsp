<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value='/webjars/bootstrap/5.2.3/css/bootstrap.min.css' />">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>Dashboard</title>
</head>
<body>

<h1>Welcome, <c:out value="${user.username}"/>!</h1>
<p>This is your dashboard. Nothing to see here yet.</p>
<p><a href="/logout">logout</a></p>


</body>
</html>