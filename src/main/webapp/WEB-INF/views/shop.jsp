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
		<div class="row text-center">

			<h2>Our Collection</h2>

			<img
				src="https://images.agoramedia.com/everydayhealth/gcms/New-Year-New-You-Sample-Diet-for-a-Healthy-Heart-RM-722x406.jpg">

			<c:forEach items="${productList}" var="product" varStatus="status">
				<div class="col-md-3 card">

					<!-- Setting the URL -->
					<c:url value="./resources/images/${product.productId}.png"
						var="img" />
					<c:url value="singleProduct?productId=${product.productId}"
						var="single" />

					<img src="${img}" />

					<div class="col-md-12">
						<h3>Name:${product.productName}</h3>
						<h3>Price:$ ${product.price}</h3>
						<a href="${single}" class="btn btn-success">View</a>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>

	<!--------------------------------------------------------------------------------------------------------------->

	<jsp:include page="footer.jsp" />
</body>
</html>