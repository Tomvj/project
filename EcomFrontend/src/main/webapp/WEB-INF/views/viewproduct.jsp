<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cr" value="${pageContext.request.contextPath}" />
<style>
.thumbnail {
	
	color: #15cdc7;
}

.label {
	display: block;
	width: 350px;
	word-break: break-all;
	background-color: #00547E;
	font-color: #6C3483;
	border-bottom: 5px solid #04A3ED;
}

.btn {
	background-color: #00547E;
	color: white;
	font-weight: bold;
	border-bottom: 5px solid #04A3ED;
}

.list-group {
	margin: auto;
	float: left;
}

.lead {
	margin: auto;
	left: 0;
	right: 0;
}

.img-responsive {
	min-height: 50px;
	min-width: 0px;
	
}
</style>
<div class="row">
	<!-- side nav bar -->
	<div class="col-md-2 col-sm-2 col-xs-12" style="margin-top: 5%">
		<div class="list-group">
			<a href="AllProduct" class="list-group-item">All Category</a>
			<c:forEach items="${categorylist}" var="c">
				<a class="list-group-item"
					href="${cr}/selectbycat?catid=${c.categid}">${c.categname}</a>
			</c:forEach>
		</div>
	</div>
	<!-- product grid -->
	<div class="col-md-10 col-sm-2 col-xs-12" style="margin-top: 5%">
		<c:forEach var="l" items="${productlist}">
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<h4 class="text-center">
						<span class="label " style="word-wrap: break-word;">${l.productname}</span>
					</h4>
					<img src="${cr}/resources/productimages/${l.productid}.jpg"
						class="img-responsive">
					<div class="caption">
						<div class="row">
							<div class="col-md-6">
								<h4 class="text-center">&#8377 ${l.productprice} /-</h4>
							</div>
							<div class="col-md-6">
								<a href="${cr}/viewoneproduct?pid=${l.productid}" class="btn"><span
									class="glyphicon glyphicon-info-sign"></span> Info</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>