<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cr" value="${pageContext.request.contextPath}"/>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

th {
	color: white;
	background-color: #00547E;
	border-bottom: 5px solid #ebebeb;
}
</style>



<div class="container" style="margin-left: 15%">


	<div class="col-md-10" style="margin-top: 10%">
		<div id="logbox">
			<c:if test="${success}">
				<div class="alert alert-success" role="alert">Process
					Successfully Completed</div>
			</c:if>
			<c:if test="${error}">
				<div class="alert alert-danger" role="alert">${message}</div>
			</c:if>
			<div class="row">
				<c:if test="${!editmode}">
					<h1 class="title">Category</h1>
					<c:set var="action" value="${cr}/admin/addcategory"></c:set>
				</c:if>
				<c:if test="${editmode}">
					<h1 class="title">Edit Category</h1>
					<c:set var="action" value="${cr}/admin/updatecategory"></c:set>
				</c:if>
				
					<form:form id="signup"  action="${action}"
						modelAttribute="catobject" method="Post">
						<c:if test="${editmode}">
							<form:hidden path="categid" />
						</c:if>
						<form:input name="Category name" type="text"
							placeholder="Category Name" class="input pass" path="categname" />

						<form:textarea name="Category Description"
							placeholder="Category description" class="input pass"
							path="categdesc" />

						<input type="submit" value="Insert" class="inputButton" />

					</form:form>
				</div>
				<div class="row">
					<div class="col-md-12">
						<table class="table table-stripped custab">
							<thead>
								<tr>
									<th>CATEGORY ID</th>
									<th>CATEGORY NAME</th>
									<th>CATEGORY DESCRIPTION</th>
									<th class="text-center" bgcolor="#00547E">EDIT/DELETE</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${categorylist}" var="cat">
									<tr>
										<td>${cat.categid}</td>
										<td>${cat.categname}</td>
										<td>${cat.categdesc}</td>
										<td class="text-center"><a class='btn btn-info btn-xs'
											href="${cr}/admin/editcategory?catname=${cat.categname}"><span
												class="glyphicon glyphicon-edit"></span> Edit</a> <a
											href="${cr}/admin/deletecategory?catname=${cat.categname}"
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