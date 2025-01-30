package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PostDAO;
import com.db.DBConnect;


@WebServlet("/editPoetryServlet")
public class editPoetryServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		try {
			Integer poetryid = Integer.parseInt(req.getParameter("poetryid"));
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			
			PostDAO dao = new PostDAO(DBConnect.getCon());
			boolean f = dao.postUpdate(poetryid, title, content);
			

			
			if(f) {
			   System.out.println("success");	
			   HttpSession session = req.getSession();
			   session.setAttribute("updMsg","...UPDATED SUCCESSFULLY...");
			   res.sendRedirect("displayPoetries.jsp");
			}
			else System.out.println("Not Updated");
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
