<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style type="text/css">
.text-info {
	margin-top: -50px;
}

.cont {
	position: absolute;
	background-color: white;
	left: 500px;
	top: 100px;
	padding: 30px;
	border-radius: 40px;
}

.c_login {
	font-size: 30px;
	color: black;
	margin-left: 100px;
	/* text-align: ; */
}

body {
	
}

.c_user {
	border-top: none;
	border-left: none;
	border-right: none;
	width: 300px;
	height: 25px;
}

.c_sub {
	padding: 12px;
	margin-left: 100px;
	background-color: rgb(83, 83, 204);
	border-radius: 20px;
}

.c_sub:hover {
	background-color: gray;
	color: black;
}

.c_reg {
	padding: 12px;
	background-color: rgb(83, 83, 204);
	border-radius: 20px;
	text-decoration: none;
	margin-left: 92px;
	border-color: black;
	color: black;
}

.c_reg:hover {
	background-color: gray;
	color: black;
}

.full {
	background: linear-gradient(rgba(0, 0, 0, .3) 50%, rgba(0, 0, 0, .3)
		-50%),
		url(https://www.kindpng.com/picc/m/478-4787076_mobile-frame-png-full-hd-mobiles-kartik-creation.png);
	background-repeat: no-repeat;
	background-size: cover;
	height: 100vh;
}

* {
	margin: 0;
	padding: 0;
}
</style>
</head>
<body>
	<div class="full">
		<div class="cont">


			<form action="add1" method="post" class="was-validated">
				<h3 class="c_login">Login</h3>
				<label class="c_lab" for="">Email</label><br> <input
					autocomplete="off" autofocus class="c_user"
					pattern="[a-z][a-z0-9_.]+@[a-z0-9.]+[.][a-z]+"
					title="Enter valid email ex(example12@gmail.com)" name="username"
					type="email" required><br> <br> <label
					class="c_lab" for="">Password</label><br> <input
					autocomplete="off" class="c_user"
					pattern="(?=.*\d)(?=.*[@#$%*!^()_+])(?=.*[a-z])(?=.*[A-Z]).{8,}"
					title="Enter atleast one upper case, one lowercase, specialcharacter and one number,and atleast 8 or more character"
					name="password" type="password" required><br> <br>
				<br>
				<button class="btn btn-primary btn-block" type="submit">Login
				</button>
				<br> <a class="btn btn-primary btn-block" href="Register.jsp">Register</a><br>
				<br> <a style="margin-left: 80px;" " href="ForgotPassword.jsp">Forgot
					password</a><br> <br>


				<%
				String error = (String) session.getAttribute("LoginResult");
				if (error != null) {
				%>
				<h6 style="margin-left: 50px; color: red;"><%=session.getAttribute("LoginResult")%></h6>

				<%
				}
				%>

			</form>

			<%
			session.removeAttribute("LoginResult");
			%>
	

			
		</div>
	</div>

</body>
</html>