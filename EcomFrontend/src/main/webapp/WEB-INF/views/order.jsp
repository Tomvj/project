<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="cr" value="${pageContext.request.contextPath}" />

<style type="text/css">
.bloc_left_price {
	color: #c01508;
	text-align: center;
	font-weight: bold;
	font-size: 150%;
}

.category_block li:hover {
	background-color: #007bff;
}

.category_block li:hover a {
	color: #ffffff;
}

.category_block li a {
	color: #343a40;
}
</style>

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">


<div class="container-fluid">
	<div class="row" style="margin-top: 100px; margin-left: 20px;">
		<div class="row">
			<c:forEach items="${orderlist}" var="o">
				<div class="col-4">

					<div class="card">
						<img class="card-img-top"
							src="${cr}/resources/productimages/${o.product.productid}.jpg"
							width="150" height="150" alt="Card image cap">

						<div class="card-body">
							<h4 class="card-title">
								<a href="product.html" title="View Product">${o.orderid}</a>
							</h4>
							<div class="row">
								<p>${o.product.productname}</p>
								<a href="receipt?rid=${o.orderid}"
									class="btn btn-success btn-block"><p>View Order</p></a>
							</div>
						</div>
					</div>
			</c:forEach>
		</div>
	</div>
</div>
</div>