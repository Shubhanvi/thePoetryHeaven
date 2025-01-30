package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.db.DBConnect;
import com.user.UserDetails;

@WebServlet("/UserServlet")

public class UserServlet extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String name = req.getParameter("fname");
		String email = req.getParameter("uemail");
		String password = req.getParameter("upas");
		
		
		UserDetails us = new UserDetails();
			us.setEmail(email);
			us.setName(name);
			us.setPassword(password);
			
			
		UserDAO dao = new UserDAO(DBConnect.getCon());
		
		boolean f = dao.addUser(us);
		
		//PrintWriter out = res.getWriter();
		HttpSession session;
		if(f) {
			session = req.getSession();
			session.setAttribute("reg-suc","...Registration Successfull...");
			res.sendRedirect("signUp.jsp");
	  
		  //out.println("User Registered Successfully");
				  
		}
		else {
			
			session = req.getSession();
			session.setAttribute("reg-fail","Something Went Wrong On Server");
			res.sendRedirect("signUp.jsp");
			//out.println("Data Not Inserted");
		}

		
	}

}
