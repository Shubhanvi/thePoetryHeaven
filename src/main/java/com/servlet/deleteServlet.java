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

@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		int poetryid = Integer.parseInt(req.getParameter("poetry_id"));
		
		PostDAO dao = new PostDAO(DBConnect.getCon());
		
		boolean f = dao.deletePoetry(poetryid);
		HttpSession session = null;
		if(f) {
			session = req.getSession();
			session.setAttribute("succDltMsg","DELETED SUCCESSFULLY");
			res.sendRedirect("displayPoetries.jsp");
			System.out.println("deleted successfully"); 
		}
		else {
			
			session = req.getSession();
			session.setAttribute("failDltMsg","DELETE OPERATION IS UNSUCCESSFULL");
			res.sendRedirect("displayPoetries.jsp");
			System.out.println(" Not Deleted ");
		}
	}

}
