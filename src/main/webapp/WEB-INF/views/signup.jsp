<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>eCommerce</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="./resources/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="./resources/js/bootstrap.min.js" type="text/javascript"></script>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="navbar.jsp" />
	<!--------------------------------------------------------------------------------------------------------------->

	<div class="container">
		<div class="row">
			<h1>Join Now!</h1>
			<span> Enter your personal details</span>


			<c:url value="/saveuser" var="action3" />
			<form:form name="user" action="${action3}" modelAttribute="User"
				method="post">
				<div class="form-group">
					<label class="form-label">Username</label>
					<form:input path="userName" id="name" required class="form-control" />
				</div>
				<div class="form-group">
					<label class="form-label">Email ID</label>
					<form:input path="email" id="email" type="email" required
						class="form-control" />
				</div>
				<div class="form-group">
					<label class="form-label">Password</label> <input id="password"
						type="password" required class="form-control" />
				</div>
				<div class="form-group">

					<label class="form-label">Address</label>
					<form:textarea path="address" id="address" required
						class="form-control" />
				</div>
				<div class="form-group">
					<label class="form-label">Contact no.</label>
					<form:input path="contact" id="contact" type="number"
						required="required" class="form-control" />
				</div>
				<button class="btn" id="signupback">Back</button>
				<button type="submit" class="btn">Done</button>

			</form:form>

		</div>
	</div>

	<!--------------------------------------------------------------------------------------------------------------->

	<jsp:include page="footer.jsp" />
</body>
</html>




