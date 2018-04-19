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
			<h1 style="padding-top: 20px;">Enter details of new Category</h1>
		
			<div class="logmod">
				<div class="logmod__wrapper">

					<div class="logmod__container2">
						<ul class="logmod__tabs">
							<li data-tabtar="lgm-3"><a href="#">New Category</a></li>
						</ul>
						<div class="logmod__tab-wrapper">
							<div class="logmod__tab lgm-3">
								<div class="logmod__heading">
									<span class="logmod__heading-subtitle">Enter your
										personal details</span>
								</div>

								<c:url value="/savecategory" var="action"></c:url>
								<form:form action="${action}" method="post" name="category"
									modelAttribute="Category">

									<form:hidden path="categoryId" />
									<div class="form-group">
										<form:input id="catname" path="categoryName"
											required="required" class="form-control" />
										<label class="form-label">Name</label>
									</div>


									<div class="form-group">
										<form:textarea rows="4" cols="30" id="description"
											path="description" required="required" class="form-control" />
										<label class="form-label">Description</label>
									</div>
									<div class="form-group">
										<!-- <button type="reset" class="btn3">Reset</button> -->
										<button class="btn3" id="categoryback">Back</button>
										<button type="submit" class="btn3">Done!</button>
									</div>

								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--------------------------------------------------------------------------------------------------------------->

	<jsp:include page="footer.jsp" />
</body>
</html>




