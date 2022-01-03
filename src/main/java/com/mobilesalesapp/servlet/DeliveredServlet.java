package com.mobilesalesapp.servlet;

import java.io.IOException;

import com.mobilesalesapp.impl.OrderImpl;
import com.mobilesalesapp.model.OrderPojo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/deliveredOrder")
public class DeliveredServlet extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res) {
		int orderId=Integer.parseInt( req.getParameter("orderId"));
		System.out.println("delivered"+orderId);
		OrderPojo orderPojo=new OrderPojo(0,orderId);
		OrderImpl orderImpl=new OrderImpl();
		orderImpl.deliveredCancel(orderPojo);
		try {
			res.sendRedirect("ViewUser.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
