<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.mobilesalesapp.impl.*"
	import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UsersList</title>
</head>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 10px;
	
}

.full {
	background: linear-gradient(rgba(0, 0, 0, .3) 70%, rgba(0, 0, 0, .3)
		-70%),
		url(https://images.unsplash.com/photo-1506102383123-c8ef1e872756?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mjd8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60);
	background-repeat: no-repeat;
	background-size: cover;
	/* background: rgba(76, 175, 80, 0.3) */
	height: 100%;
}

.btn_add {
	padding: 12px;
	background-color: lightbrown;
	border-radius: 22px;
}

.btn_add:hover {
	background-color: green;
}

.btn_add1 {
	text-decoration: none;
	color: black;
	padding: 12px;
	background-color: lightblue;
	border-radius: 22px;
}

.btn_add1:hover {
	background-color: green;
}

.h2_1 {
	text-align: center;
	background-color: bisque;
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

* {
	margin: 0;
	padding: 0;
}
</style>
<body bgcolor="cornsilk">
	<h2 class="h2_1">Mobile Sales App</h2>

	<div class="top_nav">

		<ul>
			<li><a href="MobilePage.jsp">Home</a></li>

			<li style="float: right;"><a href="AdminLogin.jsp">Sign out</a></li>
			<li style="float: right;"><a class="active" href="AdminMain.jsp">Admin</a></li>
			<li><a href="ContactUs.jsp">Contact us</a></li>
			<li><a href="AboutUs.jsp">About us</a></li>


		</ul>
	</div>
	<div class="full">
	<br>
	<br>
	<br>

	
		<%
		UserImpl userDao = new UserImpl();
		ResultSet ns = userDao.userDetails();
		%>
		<table style="width: 80%; margin-left: 100px;">
			<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Phone Number</th>
				<th>Wallet</th>
				<th>Action</th>
				<th>Orders</th>

			</tr>
			<%
			while (ns.next()) {
			%>


			<tr>
				<td><%=ns.getString(2)%></td>
				<td><%=ns.getString(3)%></td>
				<td><%=ns.getLong(4)%></td>
				<td><%=ns.getDouble(5)%></td>
				<td>
					<form action="addWallet" method="post">
						User_id :<input type="text" name="walletUserId"
							value="<%=ns.getInt(1)%>" readonly pattern="[0-9]{1,8}"
							maxlength="8" required><br> <br> Wallet :<input
							type="text" name="walletAmount" pattern="[0-9]{1,8}"
							maxlength="8" required><br> <br>
						<button type="submit" class="btn_add">Add</button>
						<br> <br>
					</form>
				</td>
				<td>
					<form action="DeliveredOrder.jsp">
						userId :<input name="userId" type="text"
							value="<%=ns.getInt(1)%>"><br>
						<br>
						<button type="submit" class="btn_add ">Search Order</button>
					</form>


				</td>

			</tr>
			<%
			}
			%>
		</table>
	</div>

</body>
</html>