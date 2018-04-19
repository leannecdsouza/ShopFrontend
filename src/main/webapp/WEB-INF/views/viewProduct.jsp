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
			<h2>Product</h2>
			<c:url value="/getproductform" var="productForm"></c:url>
			<div class="new">
				<h3>
					<a href="${productForm}">Add new product:</a>
				</h3>
			</div>
			<table>
				<thead>
					<tr>
						<th>ProductImage</th>
						<th>ProductName</th>
						<th>Category</th>
						<th>Stock</th>
						<th>Price</th>
						<th>Image</th>
						<th>Information</th>
						<th>Edit</th>
						<th>Delete</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${productList}" var="product" varStatus="status">
						<tr>
							<%-- <td>${status.count}</td> --%>
							<c:url value="/resources/images/${product.productId}.png"
								var="img"></c:url>
							<td><img src="${img}" height="150px" width="100px"></td>
							<td>${product.productName}</td>
							<td>${product.productDescription}</td>
							<td>${product.category}</td>
							<td>${product.stock}</td>
							<td>${product.price}</td>

							<c:url value="singleProduct?productId=${product.productId}"
								var="single"></c:url>
							<td><img src="resources/images/info.png" height="21px"
								width="21px"></td>

							<c:url value="editProduct?productId=${product.productId}"
								var="edit"></c:url>
							<td><a href="${edit} "><img
									src="resources/images/edit.png" height="18px" width="18px"></img></a></td>

							<c:url value="/deleteProduct?productId=${product.productId}"
								var="del"></c:url>
							<td><a href="${del}"
								onclick="return confirm('Are You Sure? Do you Want Delete Product : ${product.productName} ?')"><img
									src="resources/images/trash.png" height="18px" width="18px"></img></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<!--------------------------------------------------------------------------------------------------------------->

	<jsp:include page="footer.jsp" />
</body>
</html>