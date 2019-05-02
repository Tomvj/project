<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="cr" value="${pageContext.request.contextPath}"/>
<style>
::selection {
	background-color: #00547E;
}

::-moz-selection {
	background-color: #00547E;
}

body {
	background: #ffffff
}

.container {
	display: -webkit-flex;
	display: flex;
	height: 100%;
}

#logbox {
	padding: 10px;
	margin: 50px auto;
	width: 100%;
	background-color: #fff;
	-webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
	-moz-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
}

h1 {
	text-align: center;
	font-size: 175%;
	color: #757575;
	font-weight: 300;
}

h1, input {
	font-family: "Open Sans", Helvetica, sans-serif;
}

.input {
	width: 75%;
	height: 50px;
	display: block;
	margin: 0 auto 15px;
	padding: 0 15px;
	border: none;
	border-bottom: 2px solid #ebebeb;
}

.input:focus {
	outline: none;
	border-bottom-color: #3CC !important;
}

.input:hover {
	border-bottom-color: #dcdcdc;
}

.input:invalid {
	box-shadow: none;
}

.pass:-webkit-autofill {
	-webkit-box-shadow: 0 0 0 1000px white inset;
}

.inputButton {
	position: relative;
	width: 80%;
	height: 50px;
	display: block;
	margin: 30px auto 30px;
	color: white;
	background-color: #00547E;
	border: none;
	-webkit-box-shadow: 0 5px 0 #2CADAD;
	-moz-box-shadow: 0 5px 0 #2CADAD;
	box-shadow: 0 5px 0 #2CADAD;
}

.inputButton:hover {
	top: 2px;
	-webkit-box-shadow: 0 3px 0 #2CADAD;
	-moz-box-shadow: 0 3px 0 #2CADAD;
	box-shadow: 0 3px 0 #2CADAD;
	color: red;
}

.inputButton:active {
	top: 5px;
	box-shadow: none;
}


.inputButton:focus {
	outline: none;
}

.custab {
	border: 1px solid #ccc;
	padding: 5px;
	margin: 5% 0;
	box-shadow: 3px 3px 2px #ccc;
	transition: 0.5s;
}

.custab:hover {
	box-shadow: 3px 3px 0px transparent;
	transition: 0.5s;
}
</style>



<div class="container" style="margin-left: 15%">
	<div class="col-md-10" style="margin-top: 5%">
		<div id="logbox">
			<c:if test="${success}">
				<div class="alert alert-success" role="alert">Process
					Successfully completed</div>
			</c:if>
			<c:if test="${error}">
				<div class="alert alert-danger" role="alert">${message}</div>
			</c:if>
			<div class="row">
			<c:if test="${!editmode}">
					<h1 class="title">Category</h1>
					<c:set var="action" value="${cr}/seller/addproduct"></c:set>
				</c:if>
				<c:if test="${editmode}">
					<h1 class="title">Edit Category</h1>
					<c:set var="action" value="${cr}/seller/updateproduct"></c:set>
				</c:if>
				
				<form:form method="post" action="${action}"
					modelAttribute="prodobject" enctype="multipart/form-data">
					<h1>
						<b>Product</b>
					</h1>

					<form:input name="Product name" type="text"
						placeholder="Product Name" class="input pass" path="productname" />

					<form:textarea name="Description" type="text"
						placeholder="Product Description" class="input pass"
						path="productdec" />

					<form:input name="Product Stock" type="text" placeholder="Stock"
						class="input pass" path="productstock" />

					<form:input name="Product Price" type="text" placeholder="Price"
						class="input pass" path="productprice" />


					<form:select path="productcategory.categid" class="input pass">
						<form:option value="0">Select Category</form:option>
						<c:forEach items="${categorylist}" var="cat">
							<form:option value="${cat.categid}">${cat.categname}</form:option>
						</c:forEach>
					</form:select>

					<form:select path="productseller.sid" class="input pass">
						<form:option value="0">Select Seller</form:option>
						<c:forEach items="${sellerlist}" var="sell">
							<form:option value="${sell.sid}">${sell.sname}</form:option>
						</c:forEach>
					</form:select>
					<label for="pimage"><b>Product Image</b></label>
					<form:input type="file" name="fileToUpload" id="fileToUpload"
						path="pimage" required="true" />
					<input type="submit" value="Insert" class="inputButton" />

				</form:form>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-stripped custab">
						<thead class="text-center" bgcolor="#00547E">
							<tr>
								<th>PRODUCT ID</th>
								<th>PRODUCT NAME</th>
								<th>PRODUCT DESCRIPTION</th>
								<th>PRODUCT STOCK</th>
								<th>PRODUCT PRICE</th>
								<th>PRODUCT CATEGORY</th>
								<th>PRODUCT SELLER</th>
								<th>PRODUCT IMAGE</th>
								<th>EDIT/DELETE</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${productlist}" var="prd">
								<tr>
									<td>${prd.productid}</td>
									<td>${prd.productname}</td>
									<td>${prd.productdec}</td>
									<td>${prd.productstock}</td>
									<td>${prd.productprice}</td>
									<td>${prd.productcategory.categname}</td>
									<td>${prd.productseller.sname}</td>
									<td><img src="${cr}/resources/productimages/${prd.productid}.jpg"
										width="50" height="50" /></td>
									<td class="text-center"><a class='btn btn-info btn-xs'
										href="${cr}/seller/editproduct?prdid=${prd.productid}"><span
											class="glyphicon glyphicon-edit"></span> Edit</a> <a
										href="${cr}/seller/deleteproduct?prdid=${prd.productid}"
										class="btn btn-danger btn-xs"><span
											class="glyphicon glyphicon-remove"></span> Delete</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>

</div>