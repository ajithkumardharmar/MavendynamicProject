package com.mobilesalesapp.servlet;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mobilesalesapp.impl.UserImpl;
import com.mobilesalesapp.model.RegisterPojo;



@WebServlet("/add1")
public class LoginServlet extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException {
		PrintWriter out=res.getWriter();
		
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		
		RegisterPojo Login=new RegisterPojo(null,username,null,password,null);
		UserImpl userDao=new UserImpl();
	
	
			try {
				HttpSession session  = req.getSession();
				ResultSet ns = userDao.fetch(Login);
				//res.getWriter().println(flag);
				if(ns.next()) {
					String userId=ns.getString(1);
					String email=ns.getString(3);
					String name=ns.getString(2);
					double wallet=ns.getDouble(7);
					session.setAttribute("userId", userId);
					session.setAttribute("email", email);
					session.setAttribute("name", name);
					session.setAttribute("wallet", wallet);
					
					res.sendRedirect("MobilePage.jsp");
				}else {

					
					session.setAttribute("LoginResult", "invalid Email or password");
					System.out.println(session.getAttribute("LoginResult"));
					res.sendRedirect("index.jsp");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}


}