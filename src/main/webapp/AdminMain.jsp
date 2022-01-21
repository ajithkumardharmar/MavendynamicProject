<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<title>AdminPage</title>

<style>
.h2_1 {
	text-align: center;
	background-color: bisque;
}
btn_add {
padding-left: 200px;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: brown;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 12px 16px;
	text-decoration: none;
}

li a:hover {
	background-color: goldenrod;
}

.active {
	background-color: grey;
}

.add_con {
	position: absolute;
	left:450px;
	margin: 60px;
}

* {
	margin: 0;
	padding: 0;
}

.btn_add {
	color: white;
	text-decoration: none;
	padding: 12px;
	background-color: brown;
	border-radius: 12px;
}
body{
background-color:cornsilk;
}

.btn_add:hover {
	background-color: cornflowerblue;
}
}
</style>

</head>

<body bgcolor="cornsilk">
	<h2 class="h2_1">Mobile Sales App</h2>

	<div style="position: relative;top: -10px;" class="top_nav">

		<ul>
		

			<li style="float: right;"><a href="logOut">Logout</a></li>
			<li style="float: right;"><a class="active" href="AdminMain.jsp">Admin</a></li>
			


		</ul>


	</div>
	<img style="border-radius: 100px;position: absolute;top:0px;left: 500px; " width="40px" alt="" src="assets/images/mobile112.png">
	
	<div class="body_main1">
		<br>

		<div class="add_con">
		<div class="btn btn-block"> 
			<br> <a  class="btn btn-secondary " style="margin-left: 40px"
				href="AddProduct.jsp">Add Products</a><br>
			
		
			<br> <a class="btn btn-secondary btn-block" style="margin-left: 40px"
				href="ProductList.jsp">Show Product</a><br>
		
			
			<br> <a class="btn btn-secondary btn-block" style="margin-left: 40px"
				href="ViewUser.jsp">Show All User</a><br>
			
			
			<br> <a class="btn btn-secondary btn-block" style="margin-left: 40px"
				href="ViewContactUs.jsp">Show Contact</a><br>
				
				<br> <a class="btn btn-secondary btn-block" style="margin-left: 40px"
				href="InActiveUsers.jsp">InActive Users</a><br>
			<br>
			</div>
		</div>
	</div>
	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	if ((session.getAttribute("role") == null)) {
		response.sendRedirect("index.jsp");
	}
	%>

	



</body>
</html>