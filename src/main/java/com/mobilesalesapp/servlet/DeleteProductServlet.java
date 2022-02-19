package com.mobilesalesapp.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mobilesalesapp.dao.ProductDao;
import com.mobilesalesapp.impl.ProductImpl;
import com.mobilesalesapp.logger.Logger;
import com.mobilesalesapp.model.ProductPojo;

@WebServlet("/deleteProduct")
public class DeleteProductServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) {
		int i = 0;

		try {
			int productId = Integer.parseInt(req.getParameter("deleteId"));

			ProductPojo obj1 = new ProductPojo(productId);
			ProductDao obj2 = new ProductImpl();
			i = obj2.delete(obj1);

			HttpSession session = req.getSession();
			if (i > 0) {
				session.setAttribute("deleteInfo", "Successfully Deleted");
				res.sendRedirect("productList.jsp");

			} else {
				session.setAttribute("deleteInfo", "Not Deleted");
				res.sendRedirect("productList.jsp");

			}

		} catch (IOException | NumberFormatException e) {
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		}

	}
}
