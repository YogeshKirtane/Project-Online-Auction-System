<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>My Auctions</title>
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
		<br/><br/><br/>
		<center><a href="#" class="btn btn-warning">You are not allowed to see this page. Join us if you want to see more.</a></center>
		<br/>
		<center><a href="/auth/registracija" class="btn btn-outline-info">Register</a></center>
	</c:if>
	<!---------------------------->

	<!--REGISTROVAN CLAN-->
	<c:if test="${user.role==1 }">
  		<jsp:include page="header2.jsp" />	
		<br/><br/><br/><br/>
		<h2 class="text-center text-black"><strong>My Auction Items</strong></h2>
		<br/><br/>	  
		<div class="filtriranje">
			<form action="showAdvertsActiveClosed" method="post">
				<div class="d-flex align-items-center justify-content-center">				
				<div class="col-auto">
					<label class="form-label btn bg-transparent">Choose Status:</label>
				</div>
				<div class="col-4 col-lg-4">
				<select class="form-control" name="isActive">
					<option value="1">Active</option>
	   				<option value="0">Closed</option>
				</select>
				</div>
				<div class="col-auto">
				<button class="form-control btn btn-primary" type="submit" value="Show">Show</button>
				</div>
				</div>
			</form>
		</div>
		<br/><br/>
	
	<c:choose>
		<c:when test="${!empty adverts}">	
			<div class="card-deck">		
				<c:forEach items="${adverts }" var="a">					
						<c:if test="${a.isActive==1 }">
  							<div class="col-4 col-md-4 col-lg-3">
      							<div class="card-body"> 
      								    <h4 class="badge bg-success text-wrap">ACTIVE</h4>   
      									<img src="/images/DeLorean_Time_Machine_Replica_Kovacs.jpg" class="card-img-top" alt="..."> 									
										<br/><br/>
        								<h5 class="card-title"><a class="isDisabled" href="advert?idProduct=${a.idAdvert }">${a.name }</a></h5>
        								<h6 class="card-title">Starting prize: &#x20B9;${a.startingPrice } </h6>
        								<p class="card-text text-truncate">Description: ${a.description }</p>
						   				<p class="card-text">Owner: <a class="isDisabled" href="/auction/myProfile2?idUser=${a.user.idUser }">${a.user.firstname } ${a.user.lastname }</a></p>				
										<p class="card-text"><small class="text-muted">Posted at: ${a.time }</small></p>							   		 
						   				<a href="advert?idProduct=${a.idAdvert }" class="form-control btn btn-primary">Check your auction!</a>	   			
      							</div>
  							</div>
						</c:if>	
												
						<c:if test="${a.isActive==0 }">			
  							<div class="col-4 col-md-4 col-lg-3">
      								<div class="card-body">
      									<h4 class="badge bg-danger text-wrap">CLOSED</h4>
      									<img src="/images/Velika b .jpg" class="card-img-top" alt="...">
      									<br/><br/>
        								<h5 class="card-title"><a class="isDisabled" href="advert?idProduct=${a.idAdvert }">${a.name }</a></h5>
        								<h6 class="card-title">Starting prize: &#x20B9;${a.startingPrice } </h6>
        								<h6 class="card-title">Sold prize: &#x20B9;${a.currentPrice } </h6>
        								<p class="card-text text-truncate">Description: ${a.description }</p>
						   				<p class="card-text">Owner: <a class="isDisabled" href="/auction/myProfile2?idUser=${a.user.idUser }">${a.user.firstname } ${a.user.lastname }</a></p>						
										<c:forEach items="${buyer }" var="b">
							  			<c:if test="${a.idAdvert == b.advert.idAdvert }">
											<p class="card-text">Buyer: <a class="isDisabled" href="/auction/myProfile2?idUser=${b.user.idUser }">${b.user.firstname} ${b.user.lastname }</a></p>
										</c:if>
										</c:forEach>
										<p class="card-text"><small class="text-muted">Closed at: ${a.time }</small></p>
										<c:if test="${empty a.ratingBuyer }">
											<p class="form-control btn btn-success">You won the auction!</p>
											<a href="advert?idProduct=${a.idAdvert }" class="form-control btn btn-danger">Please rate buyer!</a>
										</c:if>
										<c:if test="${!empty a.ratingBuyer }">
											<a href="#" class="form-control btn btn-success">You already gave rating</a>
										</c:if>																
									</div>
    							</div>
						</c:if>							
				</c:forEach>
			</div>
		</c:when>
		<c:otherwise>
			<br/><br/><br/>
	        <h3 class="text-center">No auction available...</h3>
   		</c:otherwise>	
	</c:choose>
		
	</c:if>
	<br/><br/><br/>
		<jsp:include page="footer.jsp" />
</div>
</body>
</html>