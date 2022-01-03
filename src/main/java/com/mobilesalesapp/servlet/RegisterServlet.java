package com.mobilesalesapp.servlet;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.mobilesalesapp.impl.UserImpl;
import com.mobilesalesapp.model.RegisterPojo;


@WebServlet("/reg")

public class RegisterServlet extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException {
		String name=req.getParameter("name1");
		String email=req.getParameter("email");
		Long phone_number=Long.parseLong(req.getParameter("phone_number"));
		String password=req.getParameter("password");
		String confirm_password=req.getParameter("confirm_password");
		PrintWriter out=res.getWriter();
		//out.println(name+ email+ phone_number+ password+ confirm_password);
		 System.out.println(name+ email+ phone_number+ password+ confirm_password);
		
			
		RegisterPojo p=new RegisterPojo(name, email, phone_number, password, confirm_password);
		UserImpl userDao=new UserImpl();
		
		userDao.register(p);
		res.sendRedirect("index.jsp");
		
		
			
			
				
			
		
		
				
		
	}

}
