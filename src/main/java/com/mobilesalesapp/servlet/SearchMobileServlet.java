package com.mobilesalesapp.servlet;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mobilesalesapp.impl.ProductImpl;

import com.mobilesalesapp.model.ProductPojo;

@WebServlet("/SearchMobile")
public class SearchMobileServlet extends HttpServlet {
	
	public static HttpSession setSessionAttribute(final HttpSession session, 
			final String attributeName,
			        final Serializable attributeValue) {
			    session.setAttribute(attributeName, attributeValue);
			    return session;
			  }

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search=( request.getParameter("search")).toLowerCase();
		HttpSession session=request.getSession();
	
		ProductImpl product=new ProductImpl();
		List<ProductPojo> searchList = product.searchProduct(search);
		setSessionAttribute(session,"productList", (Serializable) searchList);
		RequestDispatcher rd=request.getRequestDispatcher("mobilePage.jsp");
		rd.forward(request, response);
	}

}
