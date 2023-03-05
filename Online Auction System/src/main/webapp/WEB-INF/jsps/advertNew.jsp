<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Your item</title>
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
<div class="container overflow:hidden">
	<!--NEREGISTROVAN CLAN-->
	<c:if test="${user.role!=1 }">
		<jsp:include page="header1.jsp" />
		<br/><br/><br/>
		<center><a href="#" class="btn btn-warning">You are not allowed to see this page. Join us if you want to see more.</a></center>
		<br/>
		<center><a href="/auth/registracija" class="btn btn-outline-info">Register</a></center>
	</c:if>
	<!----------------------->
	
	<!--REGISTROVAN CLAN-->
	<c:if test="${user.role==1 }">
		<!--NEREGISTROVAN CLAN-->
	<c:if test="${user.role!=1 }">
		<jsp:include page="header1.jsp" />
		<br/><br/><br/>
		<center><a href="#" class="btn btn-warning">You are not allowed to see this page. Join us if you want to see more.</a></center>
		<br/>
		<center><a href="/auth/registracija" class="btn btn-outline-info">Register</a></center>
	</c:if>
	<!------------------------------->

	<!--REGISTROVAN CLAN-->
	<c:if test="${user.role==1 }">
  		<jsp:include page="header2.jsp" />
	</c:if>	
		<br/><br/><br/><br/>
		
	<div class="row row-cols-1 row-cols-md-2 g-4">
	
	<div class="col-6">
	<div class="card">
  		<img class="card-img-top" src="/images/DeLorean_Time_Machine_Replica_Kovacs.jpg" alt="Card image cap">
  		<div class="card-body">
    		<p class="card-text">Description: ${advert.description }</p>
  		</div>
	</div>
	</div>

	<div class="col-3">
	<div class="card">
  		<div class="card-body">
    		<h3 class="card-title">${advert.name}</h3>
  		</div>
  		<ul class="list-group list-group-flush">
    		<li class="list-group-item">Starting prize: &#x20B9;${advert.startingPrice}</li>
    		<li class="list-group-item">Current prize: &#x20B9;${advert.currentPrice}</li>				
  		</ul>
	</div>
	</div>
	
	<div class="col-3">
	<div class="card">
  		<div class="card-body">
  			<div class="card-header">
  				Status: <a href="closeBid?idProduct=${advert.idAdvert }" class="form-control btn btn-outline-success btn-sm">ACTIVE</a>
  			</div>
  			<br/>
    		<h5 class="card-title">Owner: ${advert.user.firstname } ${advert.user.lastname }</h5>
    		<p class="card-text">${advert.user.description }</p>
  		</div>
  		<ul class="list-group list-group-flush">
    		<li class="list-group-item">Country: ${advert.user.country }</li>
    		<li class="list-group-item">Town: ${advert.user.city }</li>
    		<li class="list-group-item">Phone number: ${advert.user.phoneNumber }</li>
  		</ul>
	</div>
	</div>
	</div>
			
	</c:if>
	<br/><br/><br/>
	<jsp:include page="footer.jsp" />
</div>
</body>
</html>