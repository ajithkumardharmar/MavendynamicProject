<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="com.mobilesalesapp.connection.ConnectionPro"%>
<%
if (session.getAttribute("name") == (null)) {
	response.sendRedirect("index.jsp");
}
String name = (String) session.getAttribute("name");
String userId1 = (String) session.getAttribute("userId");

double wallet = (double) session.getAttribute("wallet");
int userId = Integer.parseInt(userId1);
System.out.println(userId);
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mobile_page</title>
</head>
<style>
.h2_1 {
	text-align: center;
	background-color: bisque;
}

.top_nav {
	/* background-color: brown;
        padding: 9px; */
	
}

.top_nav_in1 {
	position: relative;
	left: 500px;
	padding: 8px;
}

.top_nav_bu1 {
	position: relative;
	left: 520px;
	padding: 8px;
	background-color: cornflowerblue;
}

.top_nav_bu1 :hover {
	background-color: darkgreen;
	color: darkkhaki;
}

#table_id {
	margin-right: 200px;
}

.table1 {
	padding: 15px;
}

.table1 td {
	padding: 12px;
	text-align: center;
}

.button1 {
	text-decoration: none;
	position: relative;
	top: 20px;
	padding: 12px;
	padding-left: 32px;
	padding-right: 32px;
	color: blanchedalmond;
	border-radius: 12px;
	border-color: black;
	background-color: red;
}

.button1:hover {
	background-color: blue;
}

.mar1 {
	font-size: 30px;
	color: crimson;
}

.body_main {
	background-color: cornsilk;
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

#but_id {
	position: relative;
	top: -8px;
}

#but_id1 {
	position: relative;
	top: -8px;
}

.table_right {
	margin-right: 200px
}

* {
	margin: 0;
	padding: 0;
}
</style>

<body>
	<h2 class="h2_1">Mobile Sales App</h2>

	<div class="top_nav">

		<ul>
			<li><a class="active" href="MobilePage.jsp	">Home</a></li>
			<li><a href="ViewOrders.jsp">My Orders</a></li>
			<li><a href="ViewCart.jsp">Cart</a></li>
			<li><a href="ContactUs.jsp">Contact us</a></li>
			<li><a href="AboutUs.jsp">About us</a></li>
			<li style="float: right;"><a href="index.jsp">Logout</a></li>
			<li style="float: right;"><a href="AdminLogin.jsp">Admin</a></li>

		</ul>


	</div>
	<div class="body_main">
		<br>
		<h3 style="margin-left: 200px;"><%=name%></h3>
		<h3 style="margin-left: 200px;"><%="Wallet Amount: " + wallet%></h3>



		<marquee class="mar1" behavior="" direction="">New
			Smartphone Offer Available upto 15% Discount</marquee>



		<table style="margin-left: 222px;" class="table1">
			<%
			String query = "select * from products ";
			Connection con = ConnectionPro.connect();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			int i = 0;
			while (i <= 1) {
					if (rs.next()) {
			%>
			<tr>



				<th><a href="<%=rs.getString(7)%>"> <img
						src="<%=rs.getString(6)%>" alt=""></a></th>
			</tr>

			<tr>

				<td><br> <%=rs.getString(2)%></td>

			</tr>
			<tr>

				<td><br> <%=rs.getString(5)%></td>

			</tr>
			<tr>

				<td><a id="but_id" class="button1" href="<%=rs.getString(7)%>">Buy</a>
				</td>

			</tr>

			<%
			}
			i++;
			}
			%>
		</table>


		<table style="margin-left: 622px; margin-top: -1050px" class="table1">
			<div class="table_right">
				<%
				int j = 0;
				while (j <= 1) {
					if (rs.next()) {
				%>
				<tr>


					<th><a href="<%=rs.getString(7)%>"> <img
							src="<%=rs.getString(6)%>" alt=""></a></th>
				</tr>

				<tr>

					<td><br> <%=rs.getString(2)%></td>

				</tr>
				<tr>

					<td><br> <%=rs.getString(5)%></td>

				</tr>
				<tr>

					<td><a id="but_id1" class="button1"
						href="<%=rs.getString(7)%>">Buy</a></td>

				</tr>
				<br>

				<%
				}
				j++;
				}
				%>
			</div>
		</table>




		<table style="margin-left: 622px;" class="table1">
			<div class="table_right">
				<%
				int k = 0;
				while (k <= 1) {
					if (rs.next()) {
				%>
				<tr>


					<th><a href="<%=rs.getString(7)%>"> <img
							src="<%=rs.getString(6)%>" alt=""></a></th>
				</tr>

				<tr>

					<td><br> <%=rs.getString(2)%></td>

				</tr>
				<tr>

					<td><br> <%=rs.getString(5)%></td>

				</tr>
				<tr>

					<td><a id="but_id1" class="button1"
						href="<%=rs.getString(7)%>">Buy</a></td>

				</tr>
				<br>

				<%
				}

				k++;
				}
				%>
			</div>
		</table>


		<table style="margin-left: 222px; margin-top: -1030px" class="table1">
			<div class="table_right">
				<%
				int l = 0;
				while (l <= 1) {
					if (rs.next()) {
				%>
				<tr>


					<th><a href="<%=rs.getString(7)%>"> <img
							src="<%=rs.getString(6)%>" alt=""></a></th>
				</tr>

				<tr>

					<td><br> <%=rs.getString(2)%></td>

				</tr>
				<tr>

					<td><br> <%=rs.getString(5)%></td>

				</tr>
				<tr>

					<td><a id="but_id1" class="button1"
						href="<%=rs.getString(7)%>">Buy</a></td>

				</tr>
				<br>

				<%
				}

				l++;
				}
				%>
			</div>
		</table>





	</div>




</body>

</html>