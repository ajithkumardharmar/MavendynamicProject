package com.mobilesalesapp.servlet;

import java.io.IOException;
import com.mobilesalesapp.impl.ProductImpl;
import com.mobilesalesapp.model.ProductPojo;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/addproduct")
public class AddProductServlet extends HttpServlet {
 
	private static final long serialVersionUID = 1L;

	@Override
       public void doPost(HttpServletRequest req,HttpServletResponse res) {
    	   String productName=req.getParameter("product_name");
    	   String description=req.getParameter("description");
    	  
    	   try {
    	   double standardCost=Double.parseDouble( req.getParameter("standard_cost"));
    	   double listPrice=Double.parseDouble(req.getParameter("list_price"));
    	   ProductPojo obj=new ProductPojo(productName,description,
    			   standardCost,(listPrice));
    	   ProductImpl obj2=new ProductImpl();
    	   
			obj2.add(obj);
    	   }catch (NumberFormatException uhex) {
    		   uhex.printStackTrace();
    		  }

			 try {
				res.sendRedirect("ProductList.jsp");
			} catch (IOException e) {
				
				e.printStackTrace();
			}
    	   

			
		
    	   
       } 
}
