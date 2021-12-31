<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title>AdminPage</title>

    <style>
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
        .add_con{
        position:absolute;
        left:300px;
        }
        *{
    	margin: 0;
    	padding: 0;
		}
		.btn_add{
		color:white;
		text-decoration:none;
		padding: 12px;
		background-color: brown;
		border-radius: 12px;
		}
		.btn_add:hover {
		background-color: green;
	}
}
    </style>

</head>

<body bgcolor="cornsilk">
    <h2 class="h2_1">Mobile Sales App</h2>

    <div class="top_nav">

        <ul>
            <li><a href="index.jsp">Home</a></li>
           
            <li style="float: right;"><a href="AdminLogin.jsp">Sign out</a></li>
            <li style="float: right;"><a class="active" href="AdminMain.jsp">Admin</a></li>
            <li><a href="ContactUs.jsp">Contact us</a></li>
            <li><a href="AboutUs.jsp">About us</a></li>
            

        </ul>


    </div>

    <div class="body_main1">
        <br>
        
<div class="add_con">
        <form action="addproduct" method="post"><br>
			<h2>Add product</h2><br>
            <label class="add_label1">Product Name :</label>
            <input type="text" name="product_name"  pattern="[a-zA-Z0-9\s,[]]{3,40}" id="brand_textbox" required class="add_inputs1"><br><br>

            <label class="add_label1">Description :</label>
            <input type="text" name="description" id="brand_textbox" pattern="[a-zA-Z\s]{3,60}" required class="add_inputs1"><br><br>
            
            <label class="add_label1">Standard_cost :</label>
            <input type="text" name="standard_cost" id="brand_textbox" pattern="[0-9]{1,8}" maxlength="8" required class="add_inputs1"><br><br>

            <label class="add_label2">List Price :</label>
            <input type="text" name="list_price" id="brand_textbox"  pattern="[0-9]{1,8}" maxlength="8" required class="add_inputs2"><br><br>

            <button type="submit" style="margin-left: 80px" class="btn_add">Add</button><br><br>
            
            <%if(session.getAttribute("product")!=null){ %>
            <h4 style="color: green"><%=session.getAttribute("product") %></h4>
            <%} %>
        </form><br>
     	
         <br>
			<a class="btn_add"  style="margin-left: 40px" href="ProductList.jsp">Show All Products</a><br><br><br><br>
			<a class="btn_add"  style="margin-left: 40px" href="ViewUser.jsp">Show All Users</a><br><br>
			
</div>
  </div>
         <%session.removeAttribute("product"); %> 
  
 
</body>
</html>