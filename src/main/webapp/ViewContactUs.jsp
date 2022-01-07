<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="com.mobilesalesapp.util.*" import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ViewContactUs</title>
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
.but_log{
margin-top:40px;
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
			<li><a  href="index.jsp">Home</a></li>
			
			<li style="float: right;"><a href="AdminLogin.jsp">Logout</a></li>
			<li style="float: right;"><a href="AdminMain.jsp">Admin</a></li>

		</ul>


	</div><br><br>
	<%
String query="select * from contactus";
Connection con=ConnectionUtil.connect();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(query);
%>


 <table style="width: 85%;margin-left: 70px;">
    <tr>
     <th>Name</th>
    <th>Email</th>
    <th>Phone_number</th>
    <th>Description</th>
   
  
    </tr>
   
    <%while(rs.next()){ 
     %>
    
    <tr>
    <td><%=rs.getString(1) %></td>
    <td><%=rs.getString(2) %></td>
    <td><%=rs.getLong(3) %></td>
    <td><%=rs.getString(4) %></td>
    
   
    </tr>
    <%}%>

</body>
</html>