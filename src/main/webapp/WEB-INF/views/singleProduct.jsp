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
			<ol class="breadcrumb col-md-12">
				<c:url value="/home" var="home" />
				<li><a href="${home}">Home</a></li>
				<li>Single</li>
			</ol>
		</div>

		<div class="row">
			<div class="col-md-4">
				<img src="resources/images/${product.productId}.png"
					alt="${product.productId}" />
			</div>

			<div class="col-md-8">
				<h3>${product.productName}</h3>
				Price: ${product.price} <br>Category: ${product.category} <br>Description:
				${product.productDescription}
				<c:url value="/cart/${product.productId}" var="shop"></c:url>
				<form action="${shop}">
					<input type="hidden" name="units" value="1" />
					<button type="submit" class="btn">Add To Cart</button>
				</form>
			</div>
		</div>
		
	</div>

	<!--------------------------------------------------------------------------------------------------------------->

	<jsp:include page="footer.jsp" />
</body>
</html>