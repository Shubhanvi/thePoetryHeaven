<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
	background: url("imgs/displayimg.jpg");
	width: 100%;
	height: 100vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<meta charset="UTF-8">
<title>Home Page</title>
<%@include file="allComponent/allcss.jsp"%>
</head>
<body>
	<%@include file="allComponent/navbar.jsp"%>

	<div class="container-fluid back-img">
	<div class="text-center">
	<h1><i class="fa fa-book" aria-hidden="true"></i>THE POETRY HEAVEN</h1>
	<a href="signIn.jsp" class="btn btn-light bg-dark text-white"><i class="fa fa-user-circle-o" aria-hidden="true"></i>Sign In</a>
	<a href="signUp.jsp" class="btn btn-light bg-dark text-white"><i class="fa fa-user-plus" aria-hidden="true"></i>Sign Up</a>
	</div>
	</div>
	<%@include file="allComponent/footer.jsp" %>
</body>
</html>