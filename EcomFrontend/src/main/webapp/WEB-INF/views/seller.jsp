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
	<div class="col-md-10" style="margin-top:50px;margin-bottom:0px; height:500px; ">
		<div id="logbox">
			<c:if test="${success}">
				<div class="alert alert-success" role="alert">Registered
					Successfully</div>
			</c:if>
			<c:if test="${error}">
				<div class="alert alert-danger" role="alert">${message}</div>
			</c:if>
			<div class="row">
				<form:form method="post" action="addseller"
					modelAttribute="sellobject">
					<h1>
						<b>Seller</b>
					</h1>

					<form:input name="Seller name" type="text" 
						placeholder="Seller Name" class="input pass" path="sname" />
					<form:input name="Selleremailid" type="text"
						placeholder="Seller EmailId" class="input pass" path="s_emailid" />
					<form:input name="Sellerphno" type="text"
						placeholder="Seller Phone Number" class="input pass"
						path="s_phonenumber" />
					<form:input name="loc" type="text" placeholder="Location"
						class="input pass" path="s_location" />
					<form:input name="loc" type="password" placeholder="Password"
						class="input pass" path="password" />

					<input type="submit" value="Insert" class="inputButton" />

				</form:form>
			</div>
			
		</div>
	</div>

</div>