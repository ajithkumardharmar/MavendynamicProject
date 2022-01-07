<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="com.mobilesalesapp.util.ConnectionUtil" import ="java.sql.* "%>

<%@page import="java.io.PrintWriter"%>


<%

int productId=Integer.parseInt(request.getParameter("productId"));

System.out.println("checkCart "+productId);
String userId1=(String)session.getAttribute("userId");

int userId=Integer.parseInt(userId1);


Connection con=ConnectionUtil.connect();
String query="select * from carts_table where user_id=? and product_id='"+productId+"'";

PreparedStatement pre =con.prepareStatement(query);
pre.setInt(1,userId );

ResultSet rs=pre.executeQuery();
	
	boolean flag=true;
  
    System.out.println("rsnext");
    
    PrintWriter write=response.getWriter();

    if(rs.next()){
    	flag=false;
    	write.print("Already item is cart");	
    } %>
   <%
    if(flag){
    	String query4="commit";
		String productName="",url = "";
		String description = "";
		ResultSet rs2 = null;
		double price = 0;
		String query1 = "select * from products where pk_product_id=?";
		System.out.println("cartProduct"+productId);
		PreparedStatement pre1 = con.prepareStatement(query1);
		pre1.setInt(1, productId);
		ResultSet rs1 = pre1.executeQuery();
		if (rs1.next()) {
			System.out.println("cartProduct1 "+rs1.getString(2));
			productName = rs1.getString(2);
			description = rs1.getString(3);
			price = rs1.getDouble(5);
			url=rs1.getString(6);
		}
		String query3 = "insert into carts_table(user_id,product_id,product_name,description,price,url) values(?,?,?,?,?,?)";
		System.out.println(  productName + description + price + userId);
		
		PreparedStatement pre2 = con.prepareStatement(query3);
		System.out.println("Dao2");
		pre2.setInt(1, userId);
		pre2.setInt(2, productId);
		pre2.setString(3, productName);
		pre2.setString(4, description);
		pre2.setDouble(5, price);
		pre2.setString(6, url);
		int i=pre2.executeUpdate();
		System.out.println("Dao4 "+i );
		write.print("Cart Succesfully");
    } %>