<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="cr" value="${pageContext.request.contextPath}" />

<style>
/*
** Style Simple Ecommerce Theme for Bootstrap 4
** Created by T-PHP https://t-php.fr/43-theme-ecommerce-bootstrap-4.html
*/
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

.add_to_cart_block .price {
	color: #c01508;
	text-align: center;
	font-weight: bold;
	font-size: 200%;
	margin-bottom: 0;
}

.add_to_cart_block .price_discounted {
	color: #343a40;
	text-align: center;
	text-decoration: line-through;
	font-size: 140%;
}

.product_rassurance {
	padding: 10px;
	margin-top: 15px;
	background: #ffffff;
	border: 1px solid #6c757d;
	color: #6c757d;
}

.product_rassurance .list-inline {
	margin-bottom: 0;
	text-transform: uppercase;
	text-align: center;
}

.product_rassurance .list-inline li:hover {
	color: #343a40;
}

.reviews_product .fa-star {
	color: gold;
}

.pagination {
	margin-top: 10px;
}
</style>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

<c:if test="${empty cartitems}">
	<div class="container">
		<div class="row">
			<div class="col-12" style="margin-top:100px;margin-bottom: 0px;margin-left:150px; ">
				<img alt=""
					src="https://www.protectabed.com/wp/wp-content/uploads/2017/07/empty-cart-icon-1.jpg">
			</div>
		</div>
	</div>
	<div class="col mb-2">
		<div class="row">
			<div class="col-sm-12  col-md-6">
				<button class="btn btn-block btn-light">Continue Shopping</button>
			</div>
		</div>
	</div>
</c:if>
<c:if test="${! empty cartitems}">
	<div class="container mb-4">
		<div class="row">
			<div class="col-12" style="margin-top:90px;margin-bottom: 10px; ">
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">Product</th>
								<th scope="col">Available</th>
								<th scope="col" class="text-center">Quantity</th>
								<th scope="col" class="text-right">Price</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${cartitems}" var="cart">
								<tr>
									<td><img
										src="${cr}/resources/productimages/${cart.product.productid}.jpg" width="50px" height="50px" /></td>
									<td>${cart.product.productname}</td>
									<td><c:if test="${cart.product.productstock==0}">
										Out stock
									</c:if> <c:if test="${cart.product.productstock>0}">
											<c:if test="${cart.quantity<= cart.product.productstock}">
										In Stock
										</c:if>
											<c:if test="${cart.quantity>= cart.product.productstock}">
										Only ${cart.product.productstock} available.
										</c:if>
										</c:if></td>
									<td><input class="form-control" type="text"
										value="${cart.quantity}" /></td>
									<td class="text-right">${cart.subtotal}"</td>
									<td class="text-right"><a href="${cr}/user/deleteitem?itemid=${cart.itemid}"
											class="btn btn-sm btn-danger">
											<i class="fa fa-trash"></i>
										</a></td>
								</tr>
							</c:forEach>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><b color="blue">Total:</b></td>
								<td class="text-right">${total}</td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
			<div class="col mb-2">
				<div class="row">
					<div class="col-sm-12  col-md-6" style="margin-bottom: 20px">
						<button class="btn btn-lg btn-block btn-light">Continue Shopping</button>
					</div>
					<div class="col-sm-12 col-md-6 text-right" style="margin-bottom: 20px">
						<a href="${cr}/user/address" class="btn btn-lg btn-block btn-success" style="background-color: #00547E">Checkout</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>
