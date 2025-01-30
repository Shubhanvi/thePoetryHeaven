package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.PostDAO;
import com.db.DBConnect;
import com.user.Post;

@WebServlet("/addPoetryServlet")
public class addPoetryServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int uid = Integer.parseInt(req.getParameter("uid"));
		String title = req.getParameter("title");

		String content = req.getParameter("content");

		PostDAO dao = new PostDAO(DBConnect.getCon());

		boolean f = dao.addPoetry(title, content, uid);

		if (f) {
			
			System.out.println("success");
			res.sendRedirect("displayPoetries.jsp");
		}
		else {
			System.out.println("faill");
		}
	}

}
