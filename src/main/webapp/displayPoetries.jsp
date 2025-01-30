<%@page import="com.user.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
UserDetails user3 = (UserDetails) session.getAttribute("userD");
if (user3 == null) {
	response.sendRedirect("signIn.jsp");
	session.setAttribute("signIn-error", "Do Sign In First");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DISPLAY POETRIES</title>
<%@include file="allComponent/allcss.jsp"%>
</head>
<body>
	
		<%@include file="allComponent/navbar.jsp"%>

		<%
		String updMsg = (String) session.getAttribute("updMsg");
		if (updMsg != null) {
		%>

		<div class="alert alert-success text-center" role="alert"><%=updMsg%></div>
		<%
		session.removeAttribute("updMsg");
		}
		%>
		  <!-- ................ -->
		<%
		String failDltMsg = (String) session.getAttribute("failDltMsg");
		if(failDltMsg != null){%>
			<div class="alert alert-danger text-center" role="alert"><%=failDltMsg%></div>
		<%}
		
		session.removeAttribute("failDltMsg");
		%>
		<!-- ......... -->
		<%
		String succDltMsg = (String) session.getAttribute("succDltMsg");
		if (succDltMsg != null) {
		%>

		<div class="alert alert-success text-center" role="alert"><%=succDltMsg%></div>
		<%
		session.removeAttribute("succDltMsg");
		}
		%>

		<div class="container-fluid">
			<h2 class="text-center mt-3">YOUR VERSE VAULT</h2>
			<div class="row">
				<div class="col-md-12 ">
					<%
					if (user3 != null) {
						PostDAO ob = new PostDAO(DBConnect.getCon());
						List<Post> post = ob.getData(user3.getId());
						for (Post p : post) {
					%>
					<div class="card mt-3">
						<img src="imgs/bg1.avif" class="card-img-top mt-2 max-auto "
							style="max-width: 100px; max-height: 100px;">
						<div class="card-body p-4">
							<h5 class="card-title"><%=p.getTitle()%></h5>
							<p><%=p.getContent()%></p>
							<p>
								<b class="text-success">Written By: <%=user3.getName()%>
								</b><br> <b class="text-primary"></b>
							</p>


							<p>
								<b class="text-success">Date & Time: <%=p.getPdate()%></b><br>
								<b class="text-success"></b>
							</p>


							<div class="container text-center mt-2">
								<a href="deleteServlet?poetry_id=<%=p.getId() %>" class="btn btn-danger bg-dark">Delete</a> 
								
								<a
									href="edit.jsp?poetry_id=<%=p.getId()%>"
									class="btn btn-primary bg-dark">Edit</a>
							</div>

						</div>
					</div>


					<%
					}

					}
					%>


				</div>
			</div>

		</div>
	
	<%@include file="allComponent/footer.jsp"%>
</body>
</html>