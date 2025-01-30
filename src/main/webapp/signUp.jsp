<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIGN UP PAGE</title>
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
						<h4>Registration</h4>
					</div>



					<%
					String sucMsg = (String) session.getAttribute("reg-suc");
					if (sucMsg != null) {
					%>
					<div class="alert alert-success text-center" role="alert"><%= sucMsg %> <br>
					To Sign In<a href="signIn.jsp"> Click Here</a>
					</div>

					<%
					session.removeAttribute("reg-suc");
					}
					%>
					
					
					<%
					String failMsg = (String) session.getAttribute("reg-fail");
					if (failMsg != null) {
					%>
					<div class="alert alert-danger text-center" role="alert"><%= failMsg %></div>

					<%
					session.removeAttribute("reg-fail");
					}
					%>
					

					<div class="card-body">
						<form action="UserServlet" method="post">

							<div class="form-group">
								<label>Enter Full Name</label> <input type="text"
									class="form-control" id="exampleInputPassword1" name="fname">
							</div>
							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="uemail">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="upas">
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