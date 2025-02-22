<%@page import="com.user.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
	<a class="navbar-brand" href="#">!! The Poetry Heaven !!</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp"><i
					class="fa fa-home" aria-hidden="true"></i> Home <span
					class="sr-only">(current)</span></a></li>
			<li class="nav-item"><a class="nav-link" href="addPoetry.jsp"><i
					class="fa fa-plus-circle" aria-hidden="true"></i>Add Poetry</a></li>

			<li class="nav-item"><a class="nav-link" href="displayPoetries.jsp"><i
					class="fa fa-book" aria-hidden="true"></i>Display Poetries</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">

			<%
			UserDetails user = (UserDetails) session.getAttribute("userD");

			if (user != null) {
			%>

			<a href="" class="btn btn-light my-2 my-sm-0 mr-2"
				data-toggle="modal" data-target="#exampleModal" type="submit"><i
				class="fa fa-user-circle-o" aria-hidden="true"></i><%=user.getName()%></a>
			<a href="signOutServlet" class="btn btn-light my-2 my-sm-0" type="submit"><i
				class="fa fa-user-plus" aria-hidden="true"></i>Sign Out</a>




			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title text-center" id="exampleModalLabel">User Information</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="container text-center">
								<i class="fa fa-user" aria-hidden="true"></i>
								<table class="table">
									<tbody>
										<tr>
											<th>User ID</th>
											<td><%=user.getId()%></td>
										</tr>
										<tr>
											<th>Full Name</th>
											<td><%=user.getName()%></td>
										</tr>
										<tr>
											<th>Email Id</th>
											<td><%=user.getEmail()%></td>
										</tr>
									</tbody>
								</table>
								<div >
									<button type="button" class="btn btn-primary bg-dark"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			 <!-- model end -->
			<%
			} else {
			%>

			<a href="signIn.jsp" class="btn btn-light my-2 my-sm-0 mr-2"
				type="submit"><i class="fa fa-user-circle-o" aria-hidden="true"></i>Sign
				In</a> <a href="signUp.jsp" class="btn btn-light my-2 my-sm-0"
				type="submit"><i class="fa fa-user-plus" aria-hidden="true"></i>Sign
				Up</a>

			<%
			}
			%>


		</form>
	</div>
</nav>