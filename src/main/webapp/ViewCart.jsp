<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="com.mobilesalesapp.util.ConnectionUtil" import ="java.sql.* "%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<title>ViewCartItems</title>
</head>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
  padding: 20px;
}
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

.table1 td {
	padding: 15px;
}

.button1 {
	text-decoration: none;
	position: relative;
	left: 60px;
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
	margin-top: 120px;
	margin-left: 240px;
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

.phoneInfo {
	margin-left: 250px;
	margin-top: -270px;
	font-size: 20px;
}
.but_log a{
	text-decoration:none;
	color:white;
 	padding: 12px;
 	margin-top:20px;
    margin-left: 100px;
    background-color: rgb(83, 83, 204);
    border-radius: 20px;

}
.btn_add {
text-decoration:none;
	padding: 12px;
	color:black;
	background-color: lightblue;
	border-radius: 22px;
}

.btn_add:hover {
	background-color: cornflowerblue;
}
.but_log{
margin-top:40px;
}
table{
background-color: rgb(248, 213, 168);
}
body{
background-color:cornsilk;
}

* {
	margin: 0;
	padding: 0;
}
</style>
<body bgcolor="cornsilk">
	<h2 class="h2_1">Mobile Sales App</h2>

	<div  style="position: relative;top: -10px;" class="top_nav">

		<ul>
			<li><a  href="MobilePage.jsp">Home</a></li>
			<li><a  href="ViewOrders.jsp">My Orders</a></li>
            <li><a class="active" href="ViewCart.jsp">Cart</a></li>
            <li><a href="MyProfile.jsp">My Profile</a></li>
			<li><a href="ContactUs.jsp">Contact us</a></li>
			<li><a href="AboutUs.jsp">About us</a></li>
			<li style="float: right;"><a href="logOut">Logout</a></li>
		

		</ul>


	</div>
	<img style="border-radius: 100px;position: absolute;top:0px;left: 500px; " width="40px" alt="" src="assets/images/mobile112.png">
	
	<br><br>
<%
String userId1=(String)session.getAttribute("userId");
int userId=Integer.parseInt(userId1);

Connection con=ConnectionUtil.connect();
String query="select * from carts_table where user_id=? order by cart_id desc";

PreparedStatement pre1 =con.prepareStatement(query);
pre1.setInt(1,userId );
ResultSet rs1=pre1.executeQuery();
PreparedStatement pre =con.prepareStatement(query);
pre.setInt(1,userId );
	ResultSet rs=pre.executeQuery();
	

%>
   
    
    
    <%if(rs1.next()) {%>
   
     
    <table class="table table-hover table-striped" style="width: 90%;margin-left: 60px;">
    <tr style="background-color: cornflowerblue" >
     <th>Product</th>
    <th>Product Name</th>
    <th>Description</th>
    <th>Price</th>
    <th>View</th>
  	<th>Action</th>
    </tr>
   
    <%while(rs.next()){ 
     %>
    
    <tr>
    <td><img alt="img" src="<%=rs.getString(7) %>" width="100px"> </td>
    <td><%=rs.getString(4) %></td>
    <td><%=rs.getString(5) %></td>
    <td><%=rs.getDouble(6) %></td>
    <td><a class="btn btn-secondary"  href="MobileInfo.jsp?product_id=<%=rs.getInt(3) %>">View </a></td>
    <td><a class="btn btn-danger" href="cartDelete?product_id=<%=rs.getInt(3) %>&userId=<%=rs.getInt(2) %>">Delete </a></td>
   
    </tr>
    <%}}
     else{%>
    	 <h1 style="color: red;margin-left: 500px;margin-top: 150px">Cart is Empty</h1>
     <% } %>
     
     
    </table>
	
	

	
	
</body>
</html>