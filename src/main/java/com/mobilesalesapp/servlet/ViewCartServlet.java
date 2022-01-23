package com.mobilesalesapp.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mobilesalesapp.impl.AdminImpl;
import com.mobilesalesapp.model.ContactUsPojo;
@WebServlet("/ViewContactUs1")
public class ViewCartServlet extends HttpServlet {

	private static final long serialVersionUID = 1;
	@Override
	public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		List<ContactUsPojo> contactList=new ArrayList<ContactUsPojo>();
		AdminImpl adminImpl=new AdminImpl();
	
		contactList=adminImpl.viewContactUs();
		request.setAttribute("viewContact", contactList);	
		RequestDispatcher rd=request.getRequestDispatcher("ViewContactUs.jsp");
		rd.forward(request, response);
	
 }

}
