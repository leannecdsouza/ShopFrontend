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



			<div class="col-md-9 cart-items">
				<h2>You Have Purchased(${count})</h2>
				
				<c:forEach items="${orders.cartitems}" var="order">
					<div class="cart-header">

						<div class="cart-sec">
							<div class="cart-item cyc">
								<img src="resources/images/${order.products.productId}.png" />
							</div>
							<div class="cart-item-info">
								<h3>${order.products.productName}<span>Category:
										${order.products.category}</span>
								</h3>
								<h4>
									<span>Rs. $ </span>${order.total}</h4>
								<p class="qty">Qty ::</p>
								<label class="form-control input-small">${order.quantity}</label>
							</div>
							<div class="clearfix"></div>

						</div>
					</div>
				</c:forEach>
				<script>
					$(document).ready(function(c) {
						$('.close2').on('click', function(c) {
							$('.cart-header2').fadeOut('slow', function(c) {
								$('.cart-header2').remove();
							});
						});
					});
				</script>
			</div>

			<div class="col-md-3 cart-total">
				<a class="continue" href="#
			 ">Back to payment</a>
				<div class="price-details">
					<p>
						Shipping Date:
						${now}
					</p>
					<br>
					<p>Delivery Date: ${delivery }</p>

					<h4>Contact no: ${orders.shipping.contact}</h4>
					<br>
					<h3>Address</h3>
					<span>${orders.shipping.shippingAddress}</span> <span>${orders.shipping.zipcode}</span>
					<div class="clearfix"></div>
				</div>
				<h4 class="last-price">YOUR TOTAL</h4>
				<span class="total final">${total}</span>
				<div class="clearfix"></div>
				<c:url value="/thankyou" var="thankyou"></c:url>
				<a class="order" href="${thankyou}">That's Right!</a>

			</div>
		</div>
	</div>

	<!--------------------------------------------------------------------------------------------------------------->

	<jsp:include page="footer.jsp" />
</body>
</html>