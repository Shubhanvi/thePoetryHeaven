package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.db.DBConnect;
import com.user.UserDetails;

@WebServlet("/signInServlet")
public class signInServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		
		UserDetails us = new UserDetails();
		us.setEmail(email);
		us.setPassword(pass);
		
		
		UserDAO dao = new UserDAO(DBConnect.getCon());
		UserDetails user = dao.signInuser(us);
		
		if(user != null) {
			
			HttpSession session = req.getSession();
			session.setAttribute("userD",user);
			
			res.sendRedirect("home.jsp");
		}
		else {
			HttpSession session = req.getSession();
			session.setAttribute("signIn-fail","Invalid UserName Or Password");
			res.sendRedirect("signIn.jsp");
		}
		
		
	}

}
