<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet" href="index.css">
</head>
<body>
<div class="full">
        <div class="cont">


            <form  action="add1" method="post">
                <h3 class="c_login">Login</h3>
                <label  class="c_lab" for="">Email</label><br>
                <input autocomplete="off" class="c_user" pattern="[a-z][a-z0-9_.]+@[a-z0-9.]+[.][a-z]+" 
                title="Enter valid email ex(example12@gmail.com)" 
                name="username" type="email" required><br><br>
                <label class="c_lab" for="">Password</label><br>
                <input autocomplete="off" class="c_user" pattern="(?=.*\d)(?=.*[@#$%*!^()_+])(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                title="Enter atleast one upper case, one lowercase, specialcharacter and one number,and atleast 8 or more character"
                 name="password" type="password" required><br><br>
                <button class="c_sub" type="submit">Login </button><br><br><br>
                <a class="c_reg" href="registered.html">Register</a><br><br>
                
              
              <%
              String error=(String)session.getAttribute("LoginResult");
                		if(error!=null){
                		%>
 <h3 style="margin-left:50px;color:red;"><%=session.getAttribute("LoginResult") %></h3>
 
 <%} %>

            </form>
				
<%session.removeAttribute("LoginResult"); %>


</body>
</html>