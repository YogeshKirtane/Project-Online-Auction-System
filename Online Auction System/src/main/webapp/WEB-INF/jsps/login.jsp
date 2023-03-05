<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/css/auction.css">


</head>
<body>
	<jsp:include page="header1.jsp" />
 	<br/><br/><br/>
	<div class="container mt-5" >
		<div class="row d-flex justify-content-center">
			<div class="col-md-6">
				<div class="card px-5 py-5" id="form1">
					<h2>
						<strong>Login</strong>
					</h2>
					<br/><br/>
					<c:if test="${wrongUsernameOrPassword=='wrongUsernameOrPassword' }">
						<p class="text-black">Wrong username or password!</p>
					</c:if>
					<form action="login" method="post">
						<div class="form-group">
							<label for="exampleInputEmail1">Username</label> <input
								type="text" name="username" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								placeholder="Enter email">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" name="password" class="form-control"
								id="exampleInputPassword1" placeholder="Password">
						</div>
						<button type="submit" class="col-3 btn btn-success">Login</button>
						<br />
						<br />
						<h6>Don't have an account? </h6>
						<a href="registracija" class="btn btn-primary btn-sm">Register</a>
					</form>
				</div>
			</div>
		</div>
	</div>
	<br/><br/><br/><br/>
	<jsp:include page="footer.jsp" /> 
</body>
</html>