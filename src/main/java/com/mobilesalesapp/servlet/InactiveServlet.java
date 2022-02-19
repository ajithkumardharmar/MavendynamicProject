package com.mobilesalesapp.servlet;

import java.io.IOException;
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

@WebServlet("/inActive")
public class InactiveServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) {
		int userId = Integer.parseInt(request.getParameter("userId"));
		RegisterPojo regPojo = new RegisterPojo();
		regPojo.setUserId(userId);
		AdminDao adminImpl = new AdminImpl();
		int i = adminImpl.userInActive(regPojo);
		HttpSession session = request.getSession();
		UserDao userDao = new UserImpl();
		List<RegisterPojo> userDetails = userDao.userDetails();
		session.setAttribute("userDetails", userDetails);
		if (i > 0) {
			try {

				session.setAttribute("InActivateInfo", "Inactive Successfully");
				response.sendRedirect("viewUser.jsp");

			} catch (IOException e) {
				Logger.printStackTrace(e);
				Logger.runTimeException(e.getMessage());
			}

		}

	}
}
