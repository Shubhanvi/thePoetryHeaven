<%@page import="com.user.Post"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
UserDetails user1 = (UserDetails) session.getAttribute("userD");
if (user1 == null) {
	response.sendRedirect("signIn.jsp");
	session.setAttribute("signIn-error", "Do Sign In First");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EDIT PAGE</title>
<%@include file="allComponent/allcss.jsp"%>
</head>
<body>

<%

Integer poetryid = Integer.parseInt(request.getParameter("poetry_id"));
PostDAO post = new PostDAO(DBConnect.getCon());

Post p = post.getDataById(poetryid);

%>
	<div class="container-fluid div-color">
		<%@include file="allComponent/navbar.jsp"%>
		<h1 class="text-center mt-3">REFINE YOUR VERSE</h1>

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="editPoetryServlet" method="post">
					
					<input type="hidden" value="<%= poetryid %>" name="poetryid">
						<div class="form-group">

							<label for="exampleInputEmail1" class="form-label text-white">
								Title</label> <input type="text" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								name="title" required="required" value = "<%= p.getTitle()%>">

						</div>
						<div class="form-group">
							<label for="exampleInputEmail1" class="form-label text-white">
								Content</label>
							<textarea rows="9" cols="" class="form-control" name="content"
								required="required"><%=p.getContent() %></textarea>

						</div>


						<div class="container text-center">
							<button type="submit" class="btn btn-primary bg-dark">Update</button>
						</div>
					</form>
				</div>

			</div>
		</div>

	</div>
	<%@include file="allComponent/footer.jsp"%>
</body>
</html>;