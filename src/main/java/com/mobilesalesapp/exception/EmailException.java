package com.mobilesalesapp.exception;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;

public class EmailException extends Exception {
	public EmailException() {
		try {
			HttpServletResponse res=null;
			HttpServletRequest req=null;
			HttpSession session =req.getSession();
			session.setAttribute("regError", "Email Must be Unique");
			System.out.println("Email Must be Unique");
			res.sendRedirect("Register.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
