package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/signOutServlet")
public class signOutServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		try {

			HttpSession session = req.getSession();
			session.removeAttribute("userD");

			HttpSession session2 = req.getSession();
			session2.setAttribute("signOutMsg", "Signed Out Successfully");
			res.sendRedirect("signIn.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
