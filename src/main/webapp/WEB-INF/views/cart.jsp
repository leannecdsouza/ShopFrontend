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
			<h2>My Cart ( ${count} )</h2>

			<table>
				<tr>
					<th>Picture</th>
					<th>Item</th>
					<th>Options</th>
				</tr>

				<c:forEach items="${i}" var="cart">
					<tr>
						<td><img
							src="resources/images/${cart.products.productId}.png" /></td>
						<td>
							<h3>${cart.products.productName}</h3> 
							Category: ${cart.products.category} <br>
							Price: Rs. ${cart.total} <br>
							Quantity : 
							<c:url value="/cart/minus/${cart.products.productId}" var="minus" />
							<c:url value="/cart/plus/${cart.products.productId}" var="plus" />
							
							<a href="${minus}"><span class="glyphicon glyphicon-minus-sign"></span></a>
							<input type="number" class="form-control" value="${cart.quantity}" min="1">
							<a href="${plus}"> <span class="glyphicon glyphicon-plus-sign"></span></a>
						</td>
						<td>
							<c:url value="/cart/removecartitem/${cart.cartId}" var="remove" />
							<a href="${remove}">&times;</a></td>
					</tr>
				</c:forEach>
			</table>


		</div>
		<div class="col-md-12 card">
			<c:url value="/shop" var="shop"/>
			<a class="continue" href="${shop}">Continue to Shop</a>
			
			<div class="col-md-12">
				<h3>Price Details</h3>
				Total: ${total} <br>
				Discount: 00.00 <br>
				Delivery Charges: 00.00 <br>
			<hr>
			<h4>TOTAL:</h4> ${total}
			</div>

			<c:url value="/shipping" var="shipping"></c:url>
			<a class="order" href="${shipping}">Place Order</a>
		</div>


	</div>

	<!--------------------------------------------------------------------------------------------------------------->

	<jsp:include page="footer.jsp" />
</body>
</html>

