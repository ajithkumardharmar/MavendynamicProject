package com.mobilesalesapp.orders;

import java.io.IOException;

import com.mobilesalesapp.impl.CartImpl;
import com.mobilesalesapp.model.CartPojo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/addCart")
public class CartServlet extends HttpServlet {
	public void service(HttpServletRequest req,HttpServletResponse res) {
		System.out.println("addCart");
		HttpSession session=req.getSession();
		String user = (String) session.getAttribute("userId");
		int userId = Integer.parseInt(user);
		System.out.println("Cart "+userId);
		int productId = (int) session.getAttribute("productId");
		CartPojo cartPojo=new CartPojo(userId,productId);
		CartImpl  cartDao=new CartImpl();
		cartDao.addCart(cartPojo);
		try {
			res.sendRedirect("CartItem.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
