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
  width: 340px;
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
  color:red;
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


  <div class="container">
   
    <!--col-md-6-->
    
   <div class="col-md-6">
    <div id="logbox" style="margin-left:70%; margin-top:25%">
      <form id="signup" method="post" action="/signup">
        <h1>Login</h1>
        <input name="user[email]" type="email" placeholder="UserId" class="input pass"/>
        <input name="user[password]" type="password" placeholder="Password" required="required" class="input pass"/>
        <input type="submit" value="Sign in Securely" class="inputButton"/>
        <div class="text-center"">
                    <a href="#" id="">New User</a> - <a href="#" id="">forgot password</a>
                </div>
      </form>
    </div>
    </div>
  </div>