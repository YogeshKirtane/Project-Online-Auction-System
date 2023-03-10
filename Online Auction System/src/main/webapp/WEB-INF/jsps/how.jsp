<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>How?</title>
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
<body style="background-color: #E0E0E0">
<div class="container overflow:hidden">
	<c:if test="${user.role!=1}">
		<jsp:include page="header1.jsp" />
		<br/><br/><br/>
	</c:if>
	
	<c:if test="${user.role==1}">
		<jsp:include page="header2.jsp" />
		<br/><br/><br/>
	</c:if>
<div class="site-section pt-0">
	<div class="container">
		<div class="row">
			<div class="col-lg-7 mb-5">
				<span class="caption">How?</span>
				<h2 class="text-black">How <strong>It Works</strong></h2>
			</div>
		</div>
	
		<div class="row">
			<div class="col-lg-3">
				<div class="step">
					<span class="wrap-icon icon-user"></span>
					<h3>Register</h3>
					<p>You have to register yourself before participating in the auction by clicking 'Register' button.</p>
				</div>
			</div>
	
			<div class="col-lg-3">
				<div class="step">
					<span class="wrap-icon icon-money"></span>
					<h3>Buy or Bid</h3>
					<p>To buy, place a bid on an item, highest bidder will win and buy.<br/>
						To Sell, add an item in the auction, bidder will bid on your item.	
					</p>
				</div>
			</div>
		
			<div class="col-lg-3">
				<div class="step">
					<span class="wrap-icon icon-glass"></span>
					<h3>Submit a bid</h3>
					<p>Click on 'Bid Now' button on an item then put your bid value submit bid section.
						You need to place highest bid than other bidder to get that item. 
					</p>
				</div>
			</div>
			
			<div class="col-lg-3">
				<div class="step last">					
					<h3>Win</h3>
					<p>When seller close the auction, the highest bidder will win the auction.
						Winner need to contact seller and finalize the deal personally.  
					</p>			
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp" />
</div>
</body>
</html>