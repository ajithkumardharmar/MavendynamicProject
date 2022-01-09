package com.mobilesalesapp.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mobilesalesapp.impl.UserImpl;
import com.mobilesalesapp.model.RegisterPojo;

@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response) {
		String name=request.getParameter("userName");
		Long userPhone=Long.parseLong( request.getParameter("userPhone"));
		String email=request.getParameter("userEmail");
		RegisterPojo registerPojo=new RegisterPojo(name,email,userPhone,null);
		
		UserImpl userImpl=new UserImpl();
		userImpl.updateProfile(registerPojo);
		
		try {
			HttpSession session=request.getSession();
			session.setAttribute("msg", "Updated Successfully");
			response.sendRedirect("MyProfile.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
	}
}