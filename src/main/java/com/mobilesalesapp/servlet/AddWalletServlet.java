package com.mobilesalesapp.servlet;

import java.io.IOException;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mobilesalesapp.dao.AdminDao;
import com.mobilesalesapp.dao.UserDao;
import com.mobilesalesapp.impl.AdminImpl;
import com.mobilesalesapp.impl.UserImpl;
import com.mobilesalesapp.logger.Logger;
import com.mobilesalesapp.model.RegisterPojo;

@WebServlet("/addWallet")
public class AddWalletServlet extends HttpServlet {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	public static HttpSession setSessionAttribute(final HttpSession session, final String attributeName,
			final Serializable attributeValue) {
		session.setAttribute(attributeName, attributeValue);
		return session;
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) {
		try {

			HttpSession session = req.getSession();
			int userId = Integer.parseInt(req.getParameter("walletUserId"));
			double addAmount = Double.parseDouble(req.getParameter("walletAmount"));

			RegisterPojo wallet = new RegisterPojo(userId, addAmount);
			AdminDao adminAddAmount = new AdminImpl();
			int i = adminAddAmount.addWalletAmount(wallet);
			UserDao userImpl = new UserImpl();
			List<RegisterPojo> listAllDetails = userImpl.myDetails(userId);

			setSessionAttribute(session, "listAllDetails", (Serializable) listAllDetails);

			if (i > 0) {
				session.setAttribute("walletInfo", "Wallet added Successfully");
				res.sendRedirect("myProfile.jsp");

			} else if (i == 0) {
				session.setAttribute("wallet", "wallet not added");
				res.sendRedirect("myProfile.jsp");

			}

		} catch (IOException | NumberFormatException | SQLException e) {

			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		}

	}

}
