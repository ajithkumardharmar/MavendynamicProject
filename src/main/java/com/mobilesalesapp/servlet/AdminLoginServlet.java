package com.mobilesalesapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.mobilesalesapp.exception.InvalidAdminException;
import com.mobilesalesapp.impl.AdminImpl;
import com.mobilesalesapp.model.AdminPojo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login_form")
public class AdminLoginServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String AdminUserName = req.getParameter("admin");
		String password = req.getParameter("password");
		PrintWriter out = res.getWriter();
		AdminPojo admin = new AdminPojo(AdminUserName, password);

		AdminImpl adminDao = new AdminImpl();
		boolean flag = adminDao.login(admin);
		out.println(flag);
		if (flag) {
			res.sendRedirect("AdminMain.jsp");

		} else {
			try {
				
		
			HttpSession session = req.getSession();
			session.setAttribute("admin", "Invalid Email or Password");
			
			throw new InvalidAdminException();
			//res.sendRedirect("AdminLogin.jsp");
			
		}
		catch (InvalidAdminException e) {
			String page=e.InvalidAdmin();
			res.sendRedirect(page);
		}
		}

	}

}
