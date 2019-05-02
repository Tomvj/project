<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cr" value="${pageContext.request.contextPath}" />

<style>
/*By DjelalEddine@gmail.com*/
#user .avatar {
	width: 60px;
}

#user .avatar>img {
	width: 50px;
	height: 50px;
	border-radius: 10%;
}
/*Card*/
#user .panel-thumb {
	margin: 5px auto;
	text-align: center;
}

#user .panel-thumb .avatar-card {
	text-align: center;
	height: 200px;
	margin: auto;
	overflow: hidden;
}

#user .panel-thumb .avatar-card>img {
	max-width: 200px;
	max-height: 200px;
}

/* table*/
#user .panel-table {
	animation-duration: 3s;
}

#user .panel-table .panel-body .table {
	margin: 0px;
}

#user .panel-table .panel-body {
	padding: 0px;
}

#user .panel-table .panel-body .table-bordered>thead>tr>th {
	text-align: center;
}

#user .panel-table .panel-footer {
	height: 60px;
	padding: 0px;
}

.error {
	color: red;
}

.error2 {
	color: green;
}

.form-type-one {
	padding: 80px 0px;
	background-color: #fafbf6;
	position: relative;
}

.form-type-one .form-warp {
	padding-right: 80px;
	padding-left: 80px;
}

.form-type-one .form-card {
	background-color: #fff;
	margin-left: 20%;
	margin-right: 20%;
	border-radius: 20px;
	padding-top: 15px;
	-webkit-box-shadow: 2px 22px 63px -17px rgba(24, 139, 240, 0.62);
	-moz-box-shadow: 2px 22px 63px -17px rgba(24, 139, 240, 0.62);
	box-shadow: 2px 22px 63px -17px rgba(24, 139, 240, 0.62);
}

.form-type-one .form {
	padding-left: 15px;
	padding-right: 15px;
}

.form-type-one .form img {
	text-align: center;
	margin-left: auto;
	display: block;
	margin-right: auto;
}

.form-type-one .form-control {
	height: 36px;
	padding: 6px 6px;
	font-size: 13px;
	line-height: 1.428571;
	color: #476787;
	background-color: #fff;
	background-image: none;
	border-image-source: linear-gradient(#3c9ef9, #71edf9);
	border-width: 1pt;
	border-image-slice: 1;
}

.form-type-one label {
	font-weight: bold;
	font-size: 13px;
	font-family: 'Comfortaa';
	color: #476787;
}

.form-type-one .form-btn {
	margin-top: 50px;
	width: 100%;
	display: block;
	font-family: 'Comfortaa';
	font-weight: bold;
	font-size: 14px;
	text-align: center;
	border-radius: 0px 0px 20px 20px;
	color: #fff;
	text-decoration: none;
	border-bottom-color: #e51937;
	border: solid 0px;
	padding: 15px 25px;
	letter-spacing: 2px;
	background-color: #e51937;
}

.form-type-one h3 {
	/*    font-weight: bold;*/
	margin-bottom: 20px;
	margin-top: 20px;
	font-family: 'Comfortaa';
	color: #476787;
	text-align: center;
}

.form-type-one p {
	margin-bottom: 20px;
	font-family: 'Comfortaa';
	color: #476787;
	text-align: center;
}

.art-right {
	position: absolute;
	right: 0px;
	bottom: 0px;
	z-index: 9;
}

.art-left {
	position: absolute;
	left: 0px;
	bottom: 0px;
	z-index: 9;
}

@media screen and (max-width: 768px) {
	.form-type-one .form-warp {
		padding-right: 0px;
		padding-left: 0px;
	}
}

.view-group {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-direction: row;
	flex-direction: row;
	padding-left: 0;
	margin-bottom: 0;
}

.thumbnail {
	margin-bottom: 30px;
	padding: 0px;
	-webkit-border-radius: 0px;
	-moz-border-radius: 0px;
	border-radius: 0px;
	width: 100%;
}

.item.list-group-item {
	float: none;
	width: 100%;
	background-color: #fff;
	margin-bottom: 30px;
	-ms-flex: 0 0 100%;
	flex: 0 0 100%;
	max-width: 100%;
	padding: 0 1rem;
	border: 0;
}

.item.list-group-item .img-event {
	float: left;
	width: 30%;
}

.item.list-group-item .list-group-image {
	margin-right: 10px;
}

.item.list-group-item .thumbnail {
	margin-bottom: 0px;
	display: inline-block;
}

.item.list-group-item .caption {
	float: left;
	width: 70%;
}

.item.list-group-item:before, .item.list-group-item:after {
	display: table;
	content: " ";
}

.item.list-group-item:after {
	clear: both;
}

.btn {
	background-color: #e51937;
}
</style>

<script type="text/javascript">
	function filter($state) {
		var x = document.getElementsByClassName($state);
		var btn = document.getElementById($state);
		

		if (btn.className == "btn") {
			btn.className = btn.dataset.class;
			for (i = 0; i < x.length; i++) {
				x[i].className = " animated fadeInLeft " + $state;
			}
		} else {
			for (i = 0; i < x.length; i++) {
				x[i].className = " animated fadeOutRight " + $state;
			}
			btn.className = "btn";
		}

	}
</script>

<div class="container" >
	<div class="row"  style="margin-top: 100px;margin-bottom: 50px">
		<div class="col-md-4">

			<div class="form-warp">
				<div class="form-card">
					<div class="form">
						<c:if test="${success}">
							<div class="alert alert-success">
								<strong>Success!</strong> Data Inserted in Database...
							</div>
						</c:if>
						<c:if test="${error1}">
							<div class="alert alert-danger">
								<strong>Danger!</strong> Incorrect Data...Enter Correct Data...
							</div>
						</c:if>
						<c:if test="${error2}">
							<div class="alert alert-warning">
								<strong>Warning!</strong> Data already exists in Database...
							</div>
						</c:if>
						<c:if test="${error3}">
							<div class="alert alert-warning">
								<strong>Warning!</strong>Please contact the Administrator...
							</div>
						</c:if>
						<div class="form-content form-type-one">


							<c:if test="${editmode}">
								<c:set var="url" value="${cr}/user/updateAddress"></c:set>
							</c:if>

							<c:if test="${!editmode}">
								<c:set var="url" value="${cr}/user/addaddress"></c:set>
							</c:if>

							<form:form action="${url}" modelAttribute="addressobject"
								method="Post">

								<div class="form-group"
									style="font-weight: bold; text-align: center;">
									<label><font size="5">Delivery Address</font> </label>

								</div>

								<div class="form-group">
									<label for="email"> User Name:</label>
									<form:input type="text" name="user_name"
										class="form-control my-input" id="name"
										placeholder="User Name" path="username" />
									<form:errors path="Username" cssStyle="color:Red"></form:errors>
								</div>
								<div class="form-group">
									<label>Address Line1:</label>
									<form:input name="address_line1" class="form-control"
										id="line1" placeholder="Address Line1" path="line1" />
									<form:errors path="line1" cssStyle="color:Red"></form:errors>
								</div>
								<div class="form-group">
									<label for="email">Address Line2:</label>
									<form:input type="text" name="address_line2"
										class="form-control my-input" id="line2"
										placeholder="Address Line2" path="line2" />
									<form:errors path="line2" cssStyle="color:Red"></form:errors>
								</div>
								<div class="form-group">
									<label for="email">City:</label>
									<form:input type="text" name="city"
										class="form-control my-input" id="city" placeholder="City"
										path="city" />
									<form:errors path="city" cssStyle="color:Red"></form:errors>
								</div>

								<div class="form-group">
									<label for="email"> State:</label>
									<form:input type="text" name="state" id="state"
										placeholder="State" path="state" class="form-control my-input" />
								</div>

								<div class="form-group">
									<label for="email"> Pincode:</label>
									<form:input type="text" name="pincode" id="pincode"
										placeholder="Pincode" path="pincode"
										class="form-control my-input" />
								</div>
								<br>
								<center>
									<input type="submit" class="btn btn-success" value="Save" />
								</center>
								<c:if test="${editmode}">
									<form:hidden path="address_Id" />
								</c:if>

								<form:hidden path="user.cusid" value="${sessionScope.userid}" />

							</form:form>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="col-md-8">
			<div class="row" style="margin-top: 50px">
				<c:forEach items="${addresslist}" var="v">
					<div class="col-lg-4">
						<div class="thumbnail card">
							<div class="img-event">
								<img class="group list-group-image img-fluid"
									src="https://media2.s-nbcnews.com/i/newscms/2016_29/1144622/home-vacation-prep-today-160720-tease_b4ae657a1e09780845d75b604be99522.jpg"
									;
									alt="Unsupported browser"
									style="max-height: 100px; width: 100%" />
							</div>
							<div class="caption card-body" style="font-family: Geneva">
								<h5 class="group card-title inner list-group-item-heading">
								</h5>
								<div class="row">
									<div class="col-xs-12">
										<p class="lead">${v.username}<br>${v.line1},<br>
											${v.line2},<br> ${v.city},<br> ${v.state},<br>
											${v.pincode}.
										</p>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<a class="btn btn-success fa fa-pencil"
											href="${cr}/user/editaddress?addressid=${v.address_Id}"></a> <a
											class="btn btn-success fa fa-trash"
											href="${cr}/user/deleteaddress?addressid=${v.address_Id}"></a> <a
											class="btn btn-success fa fa-truck" href="${cr}/user/placeorder?addressid=${v.address_Id}"></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
