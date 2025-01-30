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
<title>Insert title here</title>
<%@include file="allComponent/allcss.jsp"%>
</head>
<body>
	<div class="container-fluid div-color">
		<%@include file="allComponent/navbar.jsp"%>
		<h1 class="text-center mt-3">WEAVE YOUR WORDS</h1>

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="addPoetryServlet" method="post">
						<div class="form-group">

							<%
							UserDetails us = (UserDetails) session.getAttribute("userD");

							if (us != null) {
							%>

							<input type="hidden" value="<%=us.getId()%>" name="uid">
							<%
							}
							%>


							<label for="exampleInputEmail1" class="form-label text-white">
								Title</label> <input type="text" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								name="title" required="required">

						</div>
						<div class="form-group">
							<label for="exampleInputEmail1" class="form-label text-white">
								Content</label>
							<textarea rows="9" cols="" class="form-control" name="content"
								required="required"></textarea>

						</div>


						<div class="container text-center">
							<button type="submit" class="btn btn-primary bg-dark">Submit</button>
						</div>
					</form>
				</div>

			</div>
		</div>

	</div>
	<%@include file="allComponent/footer.jsp"%>
</body>
</html>