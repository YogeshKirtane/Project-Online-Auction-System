<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8">	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/css/welcome.css">
</head>
<body>
	<div class="container overflow:hidden">
	<!--NEREGISTROVAN CLAN-->
	<c:if test="${user.role!=1 }">
		<jsp:include page="header1.jsp" />
		<br/><br/><br/><br/>
		<div class="intro-section">
			<div class="container">
				<div class="row align-items-center justify-content-center">
					<div class="col-md-7 mx-auto text-center" data-aos="fade-up">
						<h1>The Best Place to Buy and Sell</h1>
						<p>Online auction system is offering you an auction for all type of items<br/>
						Bid on items and sell items in this auction</p>
						<a href="/auth/userLogin" class="btn btn-success">Login</a>
						<a href="/auth/registracija" class="btn btn-primary">Register</a>						
					</div>
				</div>
			</div>
		</div>
	</c:if>
		
	<!--REGISTROVAN CLAN-->
	<c:if test="${user.role==1 }">
		<jsp:include page="header2.jsp" />
	</c:if>
	
	<!--PAGE CONTENTS-->
		<br/><hr>
		<div class="row mb-4">
			<div class="col-md-7 mb-2 text-center mx-auto">
				<h2 class="text-black"><strong>Auctions</strong></h2>
			</div>
		</div> 
			<form action="/auction/showAdverts" method="post">
					<div class="text-center">
						<label for="exampleDataList" class="form-label btn bg-transparent">Choose Category</label>
					</div>
					<ul class="list-group list-group-horizontal justify-content-center">
					<c:forEach items="${advertCategories }" var="ac">
    					<li class="list-group-item"><button type="submit" name="advertCategory" value="${ac.idAdvertCategory }" class="btn btn-link" data-mdb-ripple-color="dark">${ac.category}</button></li>
					</c:forEach>
					</ul>	
			</form>
			<br/><br/>    

		<c:if test="${!empty adverts}">	
			<div class="card-deck">		
				<c:forEach items="${adverts }" var="a">					
						<c:if test="${a.isActive==1 }">
  							<div class="col-4 col-md-4 col-lg-3">
      								<div class="card-body"> 
      								    <h4 class="badge bg-success text-wrap">ACTIVE</h4>   
      									<img src="./images/${a.imageName}" class="card-img-top" alt="..."> 									
										<br/><br/>
        								<h5 class="card-title">${a.name }</h5>
        								<h6 class="card-title">Starting prize: &#x20B9;${a.startingPrice } </h6>
        								<p class="card-text text-truncate">Description: ${a.description }</p>
        								
        								<c:if test="${user.role==1}">
						   					<p class="card-text">Owner: <a class="isDisabled" href="/auction/myProfile2?idUser=${a.user.idUser }">${a.user.firstname } ${a.user.lastname }</a></p>
										</c:if>					
										<c:if test="${user.role!=1}">
						   					<p class="card-text">Owner: ${a.user.firstname } ${a.user.lastname }</p>
										</c:if>
										<p class="card-text"><small class="text-muted">Posted at: ${a.time }</small></p>									   		
        								<c:if test="${user.idUser!=a.user.idUser }"> 
						   					<a href="/auction/advert?idProduct=${a.idAdvert }" class="form-control btn btn-primary">Bid now!</a>
						   				</c:if>		   		
						   				<c:if test="${user.idUser==a.user.idUser }"> 
						   					<a href="/auction/advert?idProduct=${a.idAdvert }" class="form-control btn btn-primary">Check your auction!</a>
						   				</c:if>
      								</div>
  							</div>
						</c:if>	
												
						<c:if test="${a.isActive==0 }">
  							<div class="col-4 col-md-4 col-lg-3">
      								<div class="card-body">
      									<h4 class="badge bg-danger text-wrap">CLOSED</h4>
      									<img src="@{'images/'+${a.imageName}}" class="card-img-top" alt="...">
      									<br/><br/>
        								<h5 class="card-title">${a.name }</h5>
        								<h6 class="card-title">Starting prize: &#x20B9;${a.startingPrice } </h6>
        								<p class="card-text text-truncate">Description: ${a.description }</p>
        								
        								<c:if test="${user.role==1}">
						   					<p class="card-text">Owner: <a class="isDisabled" href="/auction/myProfile2?idUser=${a.user.idUser }">${a.user.firstname } ${a.user.lastname }</a></p>
										</c:if>					
										<c:if test="${user.role!=1}">
						   					<p class="card-text">Owner: ${a.user.firstname } ${a.user.lastname }</p>
										</c:if>							
										<c:forEach items="${offers }" var="b">			  	
								  		<c:if test="${a.idAdvert == b.advert.idAdvert }">
								  		<c:if test="${user.role==1}">
											<p class="card-text">Buyer: <a class="isDisabled" href="/auction/myProfile2?idUser=${b.user.idUser }">${b.user.firstname} ${b.user.lastname }</a></p>
										</c:if>			
										</c:if>							
										<c:if test="${a.idAdvert == b.advert.idAdvert }">
								  		<c:if test="${user.role!=1}">
											<p class="card-text">Buyer: ${b.user.firstname} ${b.user.lastname }</p>
										</c:if>	
										<p class="card-text"><small class="text-muted">Posted at: ${a.time }</small></p>		
										</c:if>											
										<c:if test="${a.idAdvert == b.advert.idAdvert }">							
										<c:if test="${b.user.idUser == user.idUser }">
											<a class="form-control btn btn-success">You bought this product!</a>
										</c:if>								
										<c:if test="${a.user.idUser == user.idUser}">
											<a class="form-control btn btn-success">You sold this product!</a>
										</c:if>
										<c:if test="${b.user.idUser != user.idUser && a.user.idUser != user.idUser  }">
											<a class="form-control btn btn-warning">Sold Out!</a>
										</c:if>							
										</c:if>								
										</c:forEach>
																
									</div>
    							</div>
						</c:if>							
				</c:forEach>
			</div>
		</c:if>
				<hr><br/>
		<c:if test="${user.role!=1 }">
		<div class="site-section">
			<div class="container">
				<div class="row justify-content-center text-center">
					<div class="col-lg-7">
						<h2 class="text-black mb-4">Create an account and start Buy, Bid or Sell Now!</h2>
						<a href="#" class="btn btn-primary">Register</a>
					</div>
				</div>
			</div>
		</div>
		</c:if>
		<br/><br/><br/><br/><br/>
			<jsp:include page="footer.jsp" />
	</div>
</body>
</html>