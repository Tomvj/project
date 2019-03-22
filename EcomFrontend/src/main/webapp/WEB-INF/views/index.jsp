<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ByteTricks</title>
<link rel="icon" href="resources/images/Capture.PNG" type="image/gif">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div>
		<c:if test="${sliderPage}">
			<jsp:include page="slider.jsp" />
		</c:if>

		<c:if test="${contactPage}">
			<jsp:include page="contactus.jsp" />
		</c:if>

		<c:if test="${aboutPage}">
			<jsp:include page="aboutus.jsp" />
		</c:if>
		<c:if test="${registerPage}">
			<jsp:include page="register.jsp" />
		</c:if>

		<c:if test="${loginPage}">
			<jsp:include page="login.jsp" />
		</c:if>
		
		<c:if test="${categoryPage}">
			<jsp:include page="category.jsp" />
		</c:if>
	</div>
	<jsp:include page="footer.jsp"/>

</body>
</html>