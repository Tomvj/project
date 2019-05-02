
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cr" value="${pageContext.request.contextPath}"/>
<style>
@import
	url(https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css)
	;

.gallery-wrap .img-big-wrap img {
	height: 250px;
	width: 250px;
	/* width: auto;*/
	display: inline-block;
	cursor: zoom-in;
	padding-top: 5%;
}

.gallery-wrap .img-small-wrap .item-gallery {
	width: 50px;
	height: auto;
	
	display: inline-block;
	overflow: hidden;
}

.gallery-wrap .img-small-wrap {
	text-align: center;
}

.gallery-wrap .img-small-wrap img {
	max-width: 100%;
	max-height: 100%;
	object-fit: cover;
	border-radius: 4px;
	/*cursor: zoom-in;*/
}

.price-title {
	font-weight: 700;
}

.price {
	font-size: 24px;
	line-height: 31px;
	text-transform: uppercase;
	max-height: 5px;
	overflow: hidden;
	font-family: 'Open Sans', Arial, sans-serif;
	font-weight: 700;
	width: 100%;
	padding: 0;
	float: none;
}

.color-price-waanbii {
	color: #FA3A11;
}

.color-box-waanbii {
	background: #15cdc7;
	color: white;
}

.fa-beat {
	animation: fa-beat 5s ease infinite;
}

#justpushtobottom {
	height: 40%;
}

@
keyframes fa-beat { 0% {
	transform: scale(1);
}
5%
{
transform


:scale


(1
.25


);
}
20%
{
transform


:scale(1)


;
}
30%
{
transform


:scale(1)


;
}
35%
{
transform


:scale


(1
.25


);
}
50%
{
transform


:scale(1)


;
}
55%
{
transform


:scale


(1
.25


);
}
70%
{
transform


:scale(1)
;
}
}
</style>
<div class="container" >
	<div class="card border-0"style="margin-top:100px;margin-bottom:100px" >
		<div class="row">
			<aside class="col-sm-6">
				<article class="gallery-wrap" >
					<div class="img-big-wrap" ">
						<div>
							<img src="${cr}/resources/productimages/${myproduct.productid}.jpg">
						</div>
					</div>
				</article>
			</aside>

			<div class="col-sm-6" style="float:right" >
				<div class="card-body m-0 pt-0 pl-5" >
					<h3 class="title text-uppercase">${myproduct.productname}</h3>
					<div class="mb-3 mt-3">
						<span class="price-title">Price :</span> <span
							class="price color-price-waanbii">&#x20B9 ${myproduct.productprice}/-</span>
					</div><br></br>
					<form action="${cr}/addToCart">
					<div class="mb-3 mt-3">
						<span class="price-title">Quantity :</span>
							<input type="hidden" name="pid" value="${myproduct.productid}">
							<input type="text" class="form-control" id="quantity" name="quantity" min="1" max="100" value="1">					</div><br></br>
					<div class="item-property">
						<span class="price-title">Description:</span> <span>${myproduct.productdec}</span>
					</div>
				</div>
			</div>
			<c:if test="${myproduct.productstock >= 3}">
				<div class="col-sm-5">
					<div class="row" >
						<button
							class="btn btn-lg color-box-waanbii"> <i
							class="fa fa-shopping-cart"></i> Add to Cart
						</button>
					</div>
				</div>
			</c:if>
			<c:if test="${myproduct.productstock == 0}">
				<div class="col-sm-5">
					<div class="row" >
						<a href="${cr}/addToCart?pid=${myproduct.productid}"
							class="btn btn-lg color-box-waanbii" type="button"> <i
							class="fa fa-shopping-cart"></i>OUT OF STOCK
						</a>
					</div>
				</div>
			</c:if>
			<c:if test="${myproduct.productstock <3 }">
				<div class="col-sm-5">
					<div class="row">
						<button
							class="btn btn-lg color-box-waanbii"> <i
							class="fa fa-shopping-cart"></i> Add to Cart-Hurry only 2 left
						</button>
					</div>
				</div>
			</c:if>
			</form>
		</div>
	</div>
</div>