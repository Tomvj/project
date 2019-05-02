<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	margin: 30px auto;
	width: 350px;
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
	width: 85%;
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
}

.inputButton:active {
	top: 5px;
	box-shadow: none;
}

.inputButton:focus {
	outline: none;
}
</style>



<div class="container ">
	<div class="col-md-6">
		<div id="logbox" style="margin-left:70%; margin-top: 20%; margin-bottom:0px;  ">
		<c:if test="${success}">
				<div class="alert alert-success" role="alert">Registered
					Successfully</div>
			</c:if>
			<c:if test="${error}">
				<div class="alert alert-danger" role="alert">${message}</div>
			</c:if>
			<form:form id="signup" method="Post" action="addcustomer" modelAttribute="myuser">
				<h1>Start Here</h1>
				<form:input name="user[name]" type="text" placeholder="Username"
					 autofocus="autofocus" required="required"
					class="input pass" path="cname"/>
					 <form:input name="user[password]" type="password"
					placeholder="Choose password" required="required"
					class="input pass" path="password"/>
					 <form:input name="Contact Number" type="text"
					placeholder="Phone Number" required="required"
					class="input pass" path="phno"/> 
					<form:input name="user[email]" type="email"
					placeholder="Email-ID" class="input pass" path="emailid"/> 
					<input type="submit"
					value="Sign me up!" class="inputButton" />
				<div class="text-center">
					already have an account? <a href="" id="login_id">login</a>
				</div>
			</form:form>
		</div>
	</div> 


</div>
