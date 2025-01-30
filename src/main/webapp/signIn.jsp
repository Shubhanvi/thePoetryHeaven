<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIGN IN PAGE</title>
<%@include file="allComponent/allcss.jsp"%>
</head>
<body>
	<%@include file="allComponent/navbar.jsp"%>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5 ">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user" aria-hidden="true"></i>
						<h4>Sign In</h4>
					</div>


					<%
					String invalidMsg = (String) session.getAttribute("signIn-fail");

					if (invalidMsg != null) {
					%>
					<div class="alert alert-danger text-center" role="alert"><%=invalidMsg%></div>

					<%
					session.removeAttribute("signIn-fail");
					}
					%>

					<%
					String withoutLogin = (String) session.getAttribute("signIn-error");
					if (withoutLogin != null) {
					%>
					<div class="alert alert-danger text-center" role="alert"><%=withoutLogin%></div>


					<%
					}
					session.removeAttribute("signIn-error");
					%>
					
					
					<%
					String signOutMsg = (String)session.getAttribute("signOutMsg");
					if(signOutMsg != null){%>
					<div class="alert alert-success text-center" role="alert"><%=signOutMsg%></div>
						
					<%}
					session.removeAttribute("signOutMsg");

					%>

					<div class="card-body">
						<form action="signInServlet" method="post">

							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="pass">
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block bg-dark">Submit</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="allComponent/footer.jsp"%>
</body>
</html>