<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Registration</title>
	<meta charset="UTF-8">	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/css/auction.css">
</head>
<body style="background-color: #E0E0E0">
	<jsp:include page="header1.jsp" />
	<div class="container overflow:hidden">

	<br/><br/><br/><br/>
	<div class="container-fluid">
		<div class="row d-flex justify-content-center">
			<div class="col-xl-7 col-lg-8 col-md-9 col-10 text-center">
				<h3>
					<strong>Register Yourself</strong>
				</h3>
				<br>
				<div class="card border-0 bg-transparent">
					<c:if test="${userExist=='userExist' }">
					<div class="alert alert-danger">
						<p class="text text-center">
							User with this username already exist!
						</p>			
					</div>
				</c:if>				
				<c:if test="${shortPassword=='shortPassword' }">
					<div class="alert alert-danger">
						<p class="text text-center">
							Password must have at least 6 characters!
						</p>			
					</div>
				</c:if>				
				<c:if test="${shortUsername=='shortUsername' }">
					<div class="alert alert-danger">
						<p class="text text-center">
							Username must have at least 6 characters!
						</p>			
					</div>
				</c:if>				
				<c:if test="${doesntMatch=='doesntMatch' }">
					<div class="alert alert-danger">
						<p class="text text-center">
							Password doesn't match!
						</p>			
					</div>
				</c:if>			
				<c:if test="${notValidEmail=='notValidEmail' }">
					<div class="alert alert-danger">
						<p class="text text-center">
							Email is not valid!
						</p>			
					</div>
				</c:if>		
				<c:if test="${emailExist=='emailExist' }">
					<div class="alert alert-danger">
						<p class="text text-center">
							User with this email already exist!
						</p>			
					</div>
				</c:if>
					<form action="registration" method="post" class="form-card">
						<div class="row justify-content-between text-left">
							<div class="form-group col-sm-6 flex-column d-flex">
								<label class="form-control-label">First name<span
									class="text-danger"></span></label> 
								<input type="text" name="firstname" placeholder="Enter your first name">
							</div>
							<div class="form-group col-sm-6 flex-column d-flex">
								<label class="form-control-label">Last name<span
									class="text-danger"></span></label> 
								<input type="text" name="lastname" placeholder="Enter your last name">
							</div>
						</div>
						<div class="row justify-content-between text-left">
							<div class="form-group col-sm-6 flex-column d-flex">
								<label class="form-control-label">Email<span
									class="text-danger"></span></label> <input type="email" id="email"
									name="email" placeholder="Enter your email">
							</div>
							<div class="form-group col-sm-6 flex-column d-flex">
								<label class="form-control-label">Phone number<span
									class="text-danger"></span></label> <input type="number" id="mob"
									name="phoneNumber" placeholder="Enter your phone number">
							</div>
						</div>
						<div class="row justify-content-between text-left">
							<div class="form-group col-sm-6 flex-column d-flex">
								<label class="form-control-label">Country<span
									class="text-danger"></span></label> <input type="text" id="email"
									name="country" placeholder="Enter your country">
							</div>
							<div class="form-group col-sm-6 flex-column d-flex">
								<label class="form-control-label">City<span
									class="text-danger"></span></label> <input type="text" id="mob"
									name="city" placeholder="Enter your city">
							</div>
						</div>
						
						<div class="row justify-content-between text-left">
							<div class="form-group col-sm-6 flex-column d-flex">
								<label class="form-control-label">Username<span
									class="text-danger"></span></label> <input type="text" id="job"
									name="username" placeholder="Enter your username">
							</div>
							<div class="form-group col-sm-6 flex-column d-flex">
								<br/>
								<span class="text-muted"><small><i>Username & Password should have 6 characters</i></small></span>
							</div>
						</div>
						<div class="row justify-content-between text-left">
							<div class="form-group col-sm-6 flex-column d-flex">
								<label class="form-control-label">Password<span
									class="text-danger"></span></label> <input type="password" id="email"
									name="password" placeholder="Enter your password">
							</div>
							<div class="form-group col-sm-6 flex-column d-flex">
								<label class="form-control-label">Confirm Password<span
									class="text-danger"></span></label> <input type="password" id="mob"
									name="password2" placeholder="Enter your confirm password">
							</div>
						</div>
						<div class="row justify-content-between text-left">
							<div class="form-group col-12 flex-column d-flex">
								<label class="form-control-label">Description About You<span class="text-danger"></span>
								</label> <input type="text" id="ans" name="description" placeholder="Enter your description">
							</div>
						</div>
						<br/>
						<div class="row justify-content-center">
							<div class="form-group col-sm-4">
								<button type="submit" class="btn-block btn-primary">Register</button>
							</div>
						</div>
						<br/>
						<h6 class="text-center mb-4"><strong><a href="userLogin">Already have an account? Login now!</a></strong></h6>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	</div>
	<br/><br/><br/><br/>
	<jsp:include page="footer.jsp" /> 	
</body>
</html>