<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>My Bids</title>
	<meta charset="UTF-8">	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">	
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
	<!-------------------------->

	<!--REGISTROVAN CLAN-->
	<c:if test="${user.role==1 }">
  		<jsp:include page="header2.jsp" />
		<br/><br/><br/><br/>
		<h2 class="text-center text-black"><strong>My Bids</strong></h2>
		<br/><br/>
		
		<c:choose>
		<c:when test="${!empty myBids}">
		<div class="card-deck">		
				<c:forEach items="${myBids}" var="o">					
						<c:if test="${o.user.idUser==user.idUser }"> 							
  							<c:if test="${o.advert.isActive==1 }">
  								<div class="col-4 col-md-4 col-lg-3">
      								<div class="card-body"> 
      								    <h4 class="badge bg-success text-wrap">ACTIVE</h4>   
      									<img src="/images/DeLorean_Time_Machine_Replica_Kovacs.jpg" class="card-img-top" alt="..."> 									
										<br/><br/>
        								<h5 class="card-title"><a class="isDisabled" href="advert?idProduct=${o.advert.idAdvert}">${o.advert.name}</a></h5>
        								<h6 class="card-title">Starting prize: &#x20B9;${o.advert.startingPrice} </h6>
        								<h6 class="card-title">Current prize: &#x20B9;${o.advert.currentPrice} </h6>
        								<p class="card-text text-truncate">Description: ${o.advert.description}</p>
						   				<p class="card-text">Owner: <a class="isDisabled" href="/auction/myProfile2?idUser=${o.advert.user.idUser }">${o.advert.user.firstname } ${o.advert.user.lastname }</a></p>								   		
        								<a href="advert?idProduct=${o.advert.idAdvert }" class="form-control btn btn-primary">Bid now!</a>
        								<div class="card-footer">
			    				 			<small class="text-muted">Posted at: ${o.advert.time }</small>
			   							</div>
      								</div>
      							</div>
      						</c:if>
						</c:if>	
												
						<c:if test="${o.advert.isActive==0 }">			
  							<div class="col-4 col-md-4 col-lg-3">
      								<div class="card-body">
      									<h4 class="badge bg-danger text-wrap">CLOSED</h4>
      									<img src="/images/Velika b .jpg" class="card-img-top" alt="...">
      									<br/><br/>
        								<h5 class="card-title"><a class="isDisabled" href="advert?idProduct=${o.advert.idAdvert}">${o.advert.name  }</a></h5>
        								<h6 class="card-title">Starting prize: &#x20B9;${o.advert.startingPrice } </h6>
        								<h6 class="card-title">Sold prize: &#x20B9;${o.advert.currentPrice } </h6>
        								<p class="card-text text-truncate">Description: ${o.advert.description}</p>
						   				<p class="card-text">Owner: <a class="isDisabled" href="/auction/myProfile2?idUser=${o.advert.user.idUser }">${o.advert.user.firstname } ${o.advert.user.lastname }</a></p>						
										<c:forEach items="${offer1 }" var="of">
										<c:if test="${o.advert.idAdvert == of.advert.idAdvert }">					
										<p class="card-text">Buyer: <a class="isDisabled" href="/auction/myProfile2?idUser=${of.user.idUser }">${of.user.firstname} ${of.user.lastname }</a></p>
										<c:if test="${of.user.idUser != user.idUser }">
											<p class="form-control btn btn-warning">Sold Out!</p>
										</c:if>
										<c:if test="${empty of.advert.ratingSeller}">
											<c:if test="${of.user.idUser == user.idUser }">
												<p class="form-control btn btn-success">You won auction!</p>
										   		<a href="advert?idProduct=${o.advert.idAdvert }" class="form-control btn btn-danger">Please rate seller!</a>
											</c:if>
										</c:if>
										<c:if test="${!empty of.advert.ratingSeller }">
											<c:if test="${of.user.idUser == user.idUser }">
												<p class="form-control btn btn-success">You already gave your rate</p>
											</c:if>
										</c:if>
										</c:if>
										</c:forEach>														
									<div class="card-footer">
										<small class="text-muted">Closed at: ${o.advert.time}</small>
									</div>
									</div>
    							</div>
						</c:if>								
				</c:forEach>
			</div>
		</c:when>
		<c:otherwise>
			<h3 class="text-center">You don't have any bids yet!</h3>
		</c:otherwise>	
		</c:choose>	
	</c:if>
	<br/><br/><br/>
		<jsp:include page="footer.jsp" />
	
</div>
</body>
</html>