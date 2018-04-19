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
			<h1>Enter details of new Supplier</h1>

			<form name="supplier">
				<div class="form-group">
					<label class="form-label">Name</label> 
					<input id="supname" required class="form-control" />
				</div>
				<div class="form-group">
					<label class="form-label">Contact no.</label> 
					<input id="supcontact" type="number" required class="form-control" />
				</div>
				<div class="form-group">
					<button class="btn">Done!</button>
				</div>
			</form>
		</div>
	</div>

	<!--------------------------------------------------------------------------------------------------------------->

	<jsp:include page="footer.jsp" />
</body>
</html>




