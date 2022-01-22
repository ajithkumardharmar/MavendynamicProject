package com.mobilesalesapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.mobilesalesapp.exception.ProductDeleteException;
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
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException {
		
		
		int productId=Integer.parseInt(req.getParameter("deleteId"));
		//String productId1=req.getParameter("deleteProductId");
		//int productId=Integer.parseInt(productId1);
//		System.out.println(productId);
//		System.out.println("pro");
		ProductPojo obj1=new ProductPojo(productId);
		ProductImpl obj2=new ProductImpl();
		PrintWriter out=res.getWriter();
		
		try {
			int i=obj2.delete(obj1);
		
			if(i>0) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Successfully Deleted');");
				out.println("location='ProductList.jsp';");
				out.println("</script>");	
//				HttpSession session=req.getSession();
//				session.setAttribute("deleteInfo", "Successfully Deleted");
//				res.sendRedirect("ProductList.jsp");
			}
			else {
				throw new ProductDeleteException();
				
			}
			
		} catch (ProductDeleteException e) {
//			HttpSession session=req.getSession();
//			session.setAttribute("deleteInfo", "Product not able to Delete");
//			String page=e.deleteProduct();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Product not Deleted');");
			out.println("location='ProductList.jsp';");
			out.println("</script>");	
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
