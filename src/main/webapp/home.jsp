<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
UserDetails user2 = (UserDetails) session.getAttribute("userD");
if (user2 == null) {
	response.sendRedirect("signIn.jsp");
	session.setAttribute("signIn-error","Do Sign In First");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allComponent/allcss.jsp" %>
</head>
<body>

<div class="container-fluid div-color">
<%@include file="allComponent/navbar.jsp" %>
<div class="text-center">
 <img alt="" src="imgs/homeimg.avif" class="img-fluid mx-auto shadow-lg p-3 mb-5 bg-body-tertiary" style="max-width: 400px;" >
 <h1 class="text-white">YOUR STORY, YOUR RHYTHM</h1>
 <a href="addPoetry.jsp" class="btn btn-outline-primary bg-dark text-white">Start Writing Here</a>
 </div>
</div>

<%@include file="allComponent/footer.jsp" %>
</body>
</html>