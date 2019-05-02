<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="cr" value="${pageContext.request.contextPath}" />
<style>
body {
	background-image: url("${cr}/resources/images/white.jpg");
}

h1 {
	margin-left: 35%;
	width: 100%;
}

h2 {
	margin-left: 35%;
	width: 100%;
}
</style>
<div class="container">

	<div class="row" style="margin-top: 100px;">
		<h1>Payment Receipt</h1>
		<div class="col-lg-12">
			<div class="row">
				<div class="col-xs-6 col-sm-6 col-md-6">
					<address>
						<strong>Supplier Information</strong><br>Name
						:${order.product.productseller.sname}
					</address>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-6 text-right">

					<p>
						<em>Receipt #: ${order.orderid}</em>
					</p>
				</div>
			</div>
			<div class="row">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>product</th>
							<th>quantity</th>
							<th>subtotal</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="col-md-10"><em></em>
								<div>
									<img
										src="${cr}/resources/productimages/${order.product.productid}.jpg"
										alt="allytees-500-trans.png" width="50" height="50"> <span>${order.product.productname}</span>
								</div></td>
							<td class="col-md-1" style="text-align: center">${order.quantity}</td>
							<td class="col-md-1" style="text-align: center">${order.subtotal}</td>
						</tr>


					</tbody>
				</table>
				<h2>Thank you for your order...</h2>
			</div>
		</div>
	</div>
</div>