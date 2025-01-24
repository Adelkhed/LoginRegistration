<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/5.2.3/css/bootstrap.min.css' />">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <title>Login and Registration</title>
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="text-center">Welcome!</h1>
    <p class="text-center">Join our growing community</p>
    
    <!-- Registration Form -->
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form:form action="/register" method="post" modelAttribute="newUser" class="border p-4 bg-white shadow-sm rounded">
                <h3 class="text-center mb-4">Register</h3>
                
                <div class="mb-3">
                    <label for="username" class="form-label">Username:</label>
                    <form:errors path="userName" cssClass="text-danger" />
                    <form:input path="userName" class="form-control" id="username" />
                </div>
                
                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <form:errors path="email" cssClass="text-danger" />
                    <form:input path="email" class="form-control" id="email" />
                </div>
                
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <form:errors path="password" cssClass="text-danger" />
                    <form:password path="password" class="form-control" id="password" />
                </div>
                
                <div class="mb-3">
                    <label for="confirm" class="form-label">Confirm Password:</label>
                    <form:errors path="confirm" cssClass="text-danger" />
                    <form:password path="confirm" class="form-control" id="confirm" />
                </div>
                
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form:form>
        </div>
    </div>
    
    <hr class="my-5">
    
    <!-- Login Form -->
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form:form action="/login" method="post" modelAttribute="newLogin" class="border p-4 bg-white shadow-sm rounded">
                <h3 class="text-center mb-4">Log In</h3>
                
                <div class="mb-3">
                    <label for="login-email" class="form-label">Email:</label>
                    <form:errors path="email" cssClass="text-danger" />
                    <form:input path="email" class="form-control" id="login-email" />
                </div>
                
                <div class="mb-3">
                    <label for="login-password" class="form-label">Password:</label>
                    <form:errors path="password" cssClass="text-danger" />
                    <form:password path="password" class="form-control" id="login-password" />
                </div>
                
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form:form>
        </div>
    </div>
</div>

<script src="<c:url value='/webjars/bootstrap/5.2.3/js/bootstrap.bundle.min.js' />"></script>
</body>
</html>
