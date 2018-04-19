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

		<h1>Let's Pay!</h1>

		<div class="content">
			<div class="row">

				<div class="col-md-4">
					<h2>Select Payment Method</h2>
					Credit Card
					Cash On Delivery
				</div>

				<div class="col-md-4">
					<h3>Credit Card Info</h3>
					<form>
						<div class="form-group">
							<label>Name on Card:</label> <input type="text"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Card Number</label> <input type="text"
								placeholder="0000-0000-0000-0000" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Expiry Date:</label> <input type="date"
								placeholder="0000-0000-0000-0000" class="form-control" required>
						</div>
						<div class="form-group">
							<label>CVV:</label> <input type="number" placeholder="XXXX"
								class="form-control" required>
						</div>
						<div class="form-group">
							<input type="submit" value="SUBMIT">
						</div>
					</form>

				</div>
			</div>
		</div>


	</div>

	<!--------------------------------------------------------------------------------------------------------------->

	<jsp:include page="footer.jsp" />
</body>
</html>