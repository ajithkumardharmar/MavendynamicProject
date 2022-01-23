package com.mobilesalesapp.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mobilesalesapp.exception.InvalidUserException;
import com.mobilesalesapp.impl.UserImpl;
import com.mobilesalesapp.model.RegisterPojo;



@WebServlet("/add1")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException {
		
		
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		
		RegisterPojo login=new RegisterPojo(null,username,null,password);
		UserImpl userDao=new UserImpl();
	
	
			try(PrintWriter out=res.getWriter()) {
				HttpSession session  = req.getSession();
				System.out.println("helo");
				ResultSet ns = userDao.fetch(login);
				if(ns.next()) {
					System.out.println("hlo1");
					String userId=ns.getString(1);
					String name=ns.getString(2);
					String email=ns.getString(3);
					double wallet=ns.getDouble(6);
					String role=ns.getString(7);
					session.setAttribute("userId", userId);
					session.setAttribute("email", email);
					session.setAttribute("name", name);
					session.setAttribute("wallet", wallet);
					session.setAttribute("role", role);
					System.out.println(email);
					if(role.equals("user")) {
						
						res.sendRedirect("MobilePage.jsp");
	
					}
					else if(role.equals("inactive")) {
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Your account now Inactive');");
						out.println("location='Request.jsp';");
						out.println("</script>");					}
					else  {
						res.sendRedirect("AdminMain.jsp");
					}
					
				}else {
					throw new InvalidUserException();
				}
			}
			catch (InvalidUserException | IOException e) {
				try(PrintWriter out=res.getWriter()){
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Invalid Email or password');");
				out.println("location='index.jsp';");
				out.println("</script>");
				
				}
				catch (IOException e2) {
				e.printStackTrace();
				}
			} catch (SQLException  e) {

				e.printStackTrace();
			}

	}


}
