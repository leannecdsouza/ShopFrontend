<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

	<%@include file="navbar.jsp"%>
	<!--------------------------------------------------------------------------------------------------------------->

	<div class="container">
		<div class="row">
			<div class="col-md-7">
				<h2>The Organic Store</h2>
				
				<!-- Setting the URL -->
				<c:url value="shop" var="shop" />

				<p>The Organic Store provides all-natural options for you and
					your family to have a healthy and happy lifestyle.</p>
					
					<img
					style="width: 100%"
					src="http://demares.es/media/image/d4/e2/2c/de-content-banner-15.jpg">
					<br/><br/>
				<ul>
					<li><b>Organic Grocery</b> helps you get the nutritious
						benefit of fresh fruits and vegetables with no harmful chemicals
						nor pesticides.</li>
					<li><b>Organic Pharmaceuticals</b> offers some of the best in
						nature science, offering products that are gentle safe and
						effective.</li>
				</ul>
				<a href="${shop}" class="btn btn-warning">Shop now!</a> <br />
				<br />


			</div>

			<div class="col-md-5">
				<!--<img src="./resources/images/some.png">-->
				<img style="width: 100%"
					src="https://lifemadesweeter.com/wp-content/uploads/5-Healthy-Detox-Smoothies-Whole-30-Paleo-12-e1483361869509.jpg">
			</div>
		</div>
	</div>

	<!--------------------------------------------------------------------------------------------------------------->

	<jsp:include page="footer.jsp" /></body>
</html>