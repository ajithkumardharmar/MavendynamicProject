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

import com.mobilesalesapp.exception.EmailException;
import com.mobilesalesapp.impl.UserImpl;
import com.mobilesalesapp.model.RegisterPojo;


@WebServlet("/reg")

public class RegisterServlet extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException  {
		String name=req.getParameter("name1");
		String email=req.getParameter("email");
		Long phone_number=Long.parseLong(req.getParameter("phone_number"));
		String password=req.getParameter("password");
//		 System.out.println(name+ email+ phone_number+ password);
		
			
		RegisterPojo p=new RegisterPojo(name, email, phone_number, password);
		UserImpl userDao=new UserImpl();
		PrintWriter out=res.getWriter();
		
		int i=userDao.register(p);
		
			
		if(i>0) {
			
		
		try {
			res.sendRedirect("index.jsp");
		} 
		
		catch (IOException e) {
			// T Auto-generated catch block
			e.printStackTrace();
			//throw new EmailException();
		}
		}
		else {
			
			try {

				throw new EmailException();
				//res.sendRedirect("Register.jsp");
			} catch (EmailException e) {
				// TODO Auto-generated catch block
				//String page=e.sameEmail();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Thish Email Already Used');");
				out.println("location='Register.jsp';");
				out.println("</script>");
				
			}
		}
		
		
		
			
			
				
			
		
		
				
		
	}

}
