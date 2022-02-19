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

@WebServlet("/activeUser")
public class AcivateUserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) {
		int userId = Integer.parseInt(request.getParameter("userId"));
		HttpSession session = request.getSession();
		RegisterPojo regPojo = new RegisterPojo();
		regPojo.setUserId(userId);
		AdminDao adminImpl = new AdminImpl();
		int i = adminImpl.activateUser(regPojo);
		if (i > 0) {
			try {
				UserDao userDao = new UserImpl();
				List<RegisterPojo> inactiveUserDetails = userDao.inActiveUserDetails();
				session.setAttribute("inactiveUserDetails", inactiveUserDetails);
				session.setAttribute("activate", "Activated Successfully");
				response.sendRedirect("inActiveUsers.jsp");

			} catch (IOException e) {
				Logger.printStackTrace(e);
				Logger.runTimeException(e.getMessage());
			}

		}

	}
}
