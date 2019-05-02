<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cr" value="${pageContext.request.contextPath}" />
<style>
.menu {
	background-color: #00547E;
	border-bottom: 2px solid #04A3ED;
	width: 100%;
	height: auto;
	padding: 0 10px;
	position: fixed;
	margin: 0px;
	z-index: 1;
	opacity: 0.9;
}

.menu  .navbar-nav>.active>a {
	background-color: #04A3ED;
	color: #04A3ED;
	font-weight: bold;
}

.menu  .navbar-nav>li>a {
	font-size: 18px;
	color: white;
	padding: 25px 35px;
}

.menu  .navbar-nav>li>a:hover {
	color: #04A3ED;
	background: none;
}

navbar-header>a {
	padding: -8px 5px;
	color: #04A3ED;
}
</style>
<title>ByteTrix</title>
</head>
<body>
	<div class="menu">
		<div class="container-fluid">

			<a href="#"><img src="${cr}/resources/images/Capture.PNG"
				alt="Logo" style="width: 50px; height: 50px"> </a>


			<ul class="nav navbar-nav navbar-right nav-item dropdown"">
				<c:choose>
					<c:when test="${sessionScope.Userloggedin}">
						<li><a href="${cr}/index">Home</a></li>
						<li><a href="${cr}/aboutus">About Us</a></li>
						<li><a href="${cr}/contact">Contact Us</a></li>
						<li><a href="${cr}/viewproduct">All Products</a></li>
						<li><a class="nav-link dropdown-toggle" data-toggle="dropdown">Welcome.${sessionScope.username}</a></li>
						<li><a href="${cr}/user/cart">Cart</a></li>
						<li><a href="${cr}/logout">Logout</a></li>

					</c:when>

					<c:when test="${sessionScope.adminloggedin}">

						<li><a href="${cr}/index">Home</a></li>
						<li><a href="${cr}/aboutus">About Us</a></li>
						<li><a href="${cr}/contact">Contact Us</a></li>
						<li><a href="${cr}/viewproduct">All Products</a></li>
						<li><a href="${cr}/admin/category">Category</a></li>
						<li><a href="${cr}/logout">Logout</a></li>
					</c:when>
					<c:when test="${sessionScope.sellerloggedin}">

						<li><a href="${cr}/index">Home</a></li>
						<li><a href="${cr}/aboutus">About Us</a></li>
						<li><a href="${cr}/contact">Contact Us</a></li>
						<li><a href="${cr}/sellerregister">Seller</a></li>
						<li><a href="${cr}/seller/product">Product</a></li>
						<li><a href="${cr}/logout">Logout</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${cr}/index">Home</a></li>
						<li><a href="${cr}/registerPage">Register</a></li>
						<li><a href="${cr}/login">Login</a></li>
						<li><a href="${cr}/aboutus">About Us</a></li>
						<li><a href="${cr}/contact">Contact Us</a></li>
						<li><a href="${cr}/viewproduct">All Products</a></li>
					</c:otherwise>
				</c:choose>


			</ul>

		</div>
	</div>