<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Login & Registration</title>
</head>
<body class="bg-light">
    <div class="container py-5">
        <h1 class="text-center text-primary mb-4">Welcome!</h1>
        <h2 class="text-center text-primary mb-4">Join our growing community.</h2>

        <div class="row justify-content-center">
            <!-- Registration Form -->
            <div class="col-md-5 mb-4">
                <div class="card">
                    <div class="card-header bg-primary text-white text-center">
                        <h2>Register</h2>
                    </div>
                    <div class="card-body">
                        <form:form method="post" action="/register" modelAttribute="newUser">
                            <div class="mb-3">
                                <label for="userName" class="form-label">Username:</label>
                                <form:input path="userName" id="userName" class="form-control" />
                                <form:errors path="userName" cssClass="text-danger small" />
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email:</label>
                                <form:input path="email" id="email" class="form-control" />
                                <form:errors path="email" cssClass="text-danger small" />
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password:</label>
                                <form:password path="password" id="password" class="form-control" />
                                <form:errors path="password" cssClass="text-danger small" />
                            </div>
                            <div class="mb-3">
                                <label for="confirm" class="form-label">Confirm PW:</label>
                                <form:password path="confirm" id="confirm" class="form-control" />
                                <form:errors path="confirm" cssClass="text-danger small" />
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary w-100">Submit</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>

            <!-- Login Form -->
            <div class="col-md-5">
                <div class="card">
                    <div class="card-header bg-primary text-white text-center">
                        <h2>Log In</h2>
                    </div>
                    <div class="card-body">
                        <form:form  action="/login" method="post" modelAttribute="newLogin">
                        
                            <div class="mb-3">
								    <form:label path="email" for="emailLogin" cssClass="form-label">Email:</form:label>
								    <form:input path="email" id="emailLogin" class="form-control" />
								    <form:errors path="email" cssClass="text-danger small" />
							</div>
							<div class="mb-3">
								    <form:label path="password" for="passwordLogin" cssClass="form-label">Password:</form:label>
								    <form:password path="password" id="passwordLogin" class="form-control" />
								    <form:errors path="password" cssClass="text-danger small" />
							</div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary w-100">Submit</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>