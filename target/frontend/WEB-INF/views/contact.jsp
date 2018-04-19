<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
			<div class="col-md-6 text-center">
				<h1>Contact Us</h1>
				<form action="#" method="post" class="form">
					<div class="form-group">
						<input type="text" class="form-control" name="Name"
							placeholder="Name" required>
					</div>
					<div class="form-group">
						<input type="email" class="form-control" name="Email"
							placeholder="Email" required>
					</div>
					<div class="form-group">
						<input type="number" class="form-control" name="Number"
							placeholder="Number" required>
					</div>
					<div class="form-group">
						<textarea name="Message" class="form-control" required></textarea>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-warning" value="Send" style="width:100%">
					</div>
				</form>
				<hr>
				Or drop us a line: <br>+91 XXX XXX XXXX <br>sample@example.com
			</div>

			<div class="col-md-6">
				<!--<img src="./resources/images/some.png">-->
				<img style="width: 100%"
					src="http://www.shoe-tease.com/wp-content/uploads/2015/05/Outrageously-Organic-Foot-Cream-Set-b1.jpg">
			</div>
		</div>
	</div>

	<!--------------------------------------------------------------------------------------------------------------->

	<jsp:include page="footer.jsp" />
</body>
</html>




