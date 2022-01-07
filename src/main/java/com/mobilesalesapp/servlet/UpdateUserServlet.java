package com.mobilesalesapp.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response) {
		String name=request.getParameter("userName");
		Long userPhone=Long.parseLong( request.getParameter("userPhone"));
		double userWallet=Double.parseDouble(request.getParameter(""));
		
		
		
		
	}
}
