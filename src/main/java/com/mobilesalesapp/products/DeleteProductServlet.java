package com.mobilesalesapp.products;

import java.io.IOException;

import com.mobilesalesapp.impl.ProductImpl;
import com.mobilesalesapp.model.ProductPojo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/deleteProduct")
public class DeleteProductServlet extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res) {
		
		
		int productId=Integer.parseInt(req.getParameter("deleteId"));
		//String productId1=req.getParameter("deleteProductId");
		//int productId=Integer.parseInt(productId1);
		System.out.println(productId);
		System.out.println("pro");
		ProductPojo obj1=new ProductPojo(productId);
		ProductImpl obj2=new ProductImpl();
		
		try {
			int i=obj2.delete(obj1);
			HttpSession session=req.getSession();
			if(i>0) {
				session.setAttribute("deleteInfo", "Successfully Deleted");
				res.sendRedirect("ProductList.jsp");
			}
			else {
				session.setAttribute("deleteInfo", "Product is not Deletable");
				res.sendRedirect("ProductList.jsp");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
