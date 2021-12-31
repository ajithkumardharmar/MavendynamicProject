<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AdminLoginPage</title>
 <link rel="stylesheet" href="index.css">
</head>
<body>
    <div class="full">
        <div class="cont">


            <form  action="login_form" method="post">
                <h3 class="c_login">Admin</h3>
                <label class="c_lab" for="">AdminUser</label><br>
                <input autocomplete="off" class="c_user" name="admin" pattern="[a-z][a-z0-9_.]+@[a-z0-9.]+[.][a-z]+"  
                title="Enter valid email ex(example12@gmail.com)"  type="login" required><br><br>
                <label class="c_lab" pattern="(?=.*\d)(?=.*[@#$%*!^()_+])(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                title="Enter atleast one upper case and one lower case and one number ,and atleast 8 or more character" 
                for="username">Password</label><br>
                <input class="c_user" name="password" type="password" required><br><br>
                <button class="c_sub" type="submit">Login </button><br><br><br>
                
                <%String error=(String)session.getAttribute("admin");
                		if(error!=null){
                		%>
 <h3 style="margin-left:50px;color:gold;"><%=session.getAttribute("admin") %></h3>
 
 <%} %>

            </form>
            <%session.removeAttribute("admin"); %>


        </div>
    </div>


</body>
</html>