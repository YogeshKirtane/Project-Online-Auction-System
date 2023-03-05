<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>My Ratings</title>
	<meta charset="UTF-8">	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/css/rating2.css">
</head>
<body>
<div class="container overflow:hidden">
	<c:if test="${user.role!=1 }">
		<jsp:include page="header1.jsp" />
		<br/><br/><br/>
		<center><a href="#" class="btn btn-warning">You are not allowed to see this page. Join us if you want to see more.</a></center>
		<br/>
		<center><a href="/auth/registracija" class="btn btn-outline-info">Register</a></center>
	</c:if>
	<!--=====================================================================================================-->

	<!--=======================================REGISTROVAN CLAN==============================================-->
	<c:if test="${user.role==1 }">
		<jsp:include page="header2.jsp" />
		<br/><br/><br/><br/>
		<h2 class="text-center text-black"><strong>My Ratings</strong></h2>
		<br/><br/>
		<div class="filtriranje">
				<form action="myRatings" method="post">
				<div class="row justify-content-center">
					<div class="col-4">
						<select class="form-control" name="idUser"> 
								<c:forEach items="${users }" var="u">
									<option value="${u.idUser }">${u.firstname} ${u.lastname }</option>
								</c:forEach>
						</select>
					</div>
					<div class="col-2">
						<button class="form-control btn btn-primary" type="submit" value="Show">Show</button>
					</div>
				</div>
				</form>	
		</div>
		<br/><br/>
		<c:if test="${!empty myRatings }">
			<div class="filter card mb-3 ">
				<div class="card-header text-center"><strong>My ratings (as buyer)</strong></div>
				<table class="table">
					<thead>
						<tr>
					    	<th scope="col">User</th>
					        <th scope="col">Product</th>
					        <th scope="col">Rating</th>
					   	</tr>
					</thead>
					<tbody>
						<c:forEach items="${myRatings}" var="r">
							<c:if test="${user.idUser==r.user.idUser }">
				 	  			<c:if test="${!empty r.rateBuyer }">
					    			<tr>
								    	<td><a class="isDisabled" href="/auction/myProfile2?idUser=${r.advert.user.idUser }">${r.advert.user.firstname } ${r.advert.user.lastname }</a></td>
								      	<td><a class="isDisabled" href="advert?idProduct=${r.advert.idAdvert }">'${r.advert.name}'</a></td>
					      				<c:if test="${r.rateBuyer=='POSITIVE'}">
					      					<td style="color: #4A8938;">${r.rateBuyer }</td>
					      				</c:if>
					      				<c:if test="${r.rateBuyer=='NEGATIVE'}">
					      					<td style="color: #CA4633;">${r.rateBuyer }</td>
					      				</c:if>
									    <c:if test="${r.rateBuyer=='NEUTRAL'}">
									    <td style="color: #E0A818;">${r.rateBuyer }</td>
									    </c:if>
					   				</tr>
					  			</c:if>
					  		</c:if>
					  	</c:forEach>
					</tbody>
				</table>
				<div class="row justify-content-center ">
				<div class="col-3">
				<a href="" class="btn btn-success"><i class="fas fa-smile-beam"></i> : ${ratingOveralPositive2 }</a>
				</div>
				<div class="col-3">
				<a href="" class="btn btn-danger"><i class="fas fa-frown"></i> : ${ratingOveralNegative2 }</a>
				</div>
				<div class="col-3">
				<a href="" class="btn btn-warning"><i class="fas fa-meh"></i> : ${ratingOveralNeutral2 }</a>
				</div>
				</div>								
			</div>
			<br/><br/><br/>
			<div class="filter card mb-3 ">
				<div class="card-header text-center"><strong>My ratings (as seller)</strong></div>
				<table class="table">
					<thead>
						<tr>
					    	<th scope="col">User</th>
					      	<th scope="col">Product</th>
					      	<th scope="col">Rating</th>
					    </tr>
					</thead>
					<tbody>
				 		<c:forEach items="${myRatings}" var="r">
				 	  		<c:forEach items="${offers }" var="o">
				 				<c:if test="${r.advert.idAdvert ==o.advert.idAdvert}">
				 					<c:if test="${user.idUser == r.advert.user.idUser }">
				 						<c:if test="${!empty r.rateSeller }">
					    					<tr>
										    	<td><a class="isDisabled" href="/auction/myProfile2?idUser=${o.user.idUser }">${o.user.firstname } ${o.user.lastname }</a></td>
										        <td><a class="isDisabled" href="advert?idProduct=${r.advert.idAdvert }">'${r.advert.name}'</a></td>
					      						<c:if test="${r.rateSeller=='POSITIVE'}">
					      							<td style="color: #4A8938;">${r.rateSeller }</td>
											     </c:if>
											     <c:if test="${r.rateSeller=='NEGATIVE'}">
											     	<td style="color: #CA4633;">${r.rateSeller }</td>
											     </c:if>
											     <c:if test="${r.rateSeller=='NEUTRAL'}">
											     	<td style="color: #E0A818;">${r.rateSeller }</td>
											     </c:if>
											</tr>
					  					</c:if>
					  				</c:if>
					  			</c:if>
					  		</c:forEach>
					  	</c:forEach>
					</tbody>
				</table>
				<div class="row justify-content-center">
				<div class="col-3">
				<a href="" class="form-control btn btn-success"><i class="fas fa-smile-beam"></i> : ${ratingOveralPositive }</a>
				</div>
				<div class="col-3">
				<a href="" class="form-control btn btn-danger"><i class="fas fa-frown"></i> : ${ratingOveralNegative }</a>
				</div>
				<div class="col-3">
				<a href="" class="form-control btn btn-warning"><i class="fas fa-meh"></i> : ${ratingOveralNeutral }</a>
				</div>
				</div>				
			</div>
		</c:if>	
		<c:if test="${!empty u }">
			<div class="filter card mb-3 ">	
				<div class="card-header text-center"><strong>${u.firstname } ${u.lastname } ratings (as buyer)</strong></div>
				<table class="table">
					<thead>
				    	<tr>
				      		<th scope="col">User</th>
				      		<th scope="col">Product</th>
				      		<th scope="col">Rating</th>
				    	</tr>
				  	</thead>
				  	<tbody>
				  		<c:forEach items="${ratings}" var="r">
				  			<c:forEach items="${users }" var="u"> 	
			 	  				<c:if test="${u.idUser==r.user.idUser }">
			 	  					<c:if test="${!empty r.rateBuyer }">
									    <tr>
									    	<td><a class="isDisabled" href="/auction/myProfile2?idUser=${r.advert.user.idUser }">${r.advert.user.firstname } ${r.advert.user.lastname }</a></td>
									      	<td><a class="isDisabled" href="advert?idProduct=${r.advert.idAdvert }">'${r.advert.name}'</a></td>
									       	<c:if test="${r.rateBuyer=='POSITIVE'}">
									      		<td style="color: #4A8938;">${r.rateBuyer }</td>
									      	</c:if>
									      	<c:if test="${r.rateBuyer=='NEGATIVE'}">
									      		<td style="color: #CA4633;">${r.rateBuyer }</td>
									      	</c:if>
									      	<c:if test="${r.rateBuyer=='NEUTRAL'}">
									      		<td style="color: #E0A818;">${r.rateBuyer }</td>
									      	</c:if>
									    </tr>
				  					</c:if>
				  				</c:if>
				  			</c:forEach>
				 		</c:forEach>
				  	</tbody>
				</table>
				<div class="row justify-content-center">
				<div class="col-3">
				<a href="" class="form-control btn btn-success"><i class="fas fa-smile-beam"></i> : ${ratingOveralPositive2 }<br/></a>
				</div>
				<div class="col-3">
				<a href="" class="form-control btn btn-danger"><i class="fas fa-frown"></i> : ${ratingOveralNegative2 }<br/></a>
				</div>
				<div class="col-3">
				<a href="" class="form-control btn btn-warning"><i class="fas fa-meh"></i> : ${ratingOveralNeutral2 }<br/> </a>
				</div>
				</div> 	
			</div>
			<br/><br/><br/>				
			<div class="filter card mb-3 ">	
				<div class="card-header text-center"><strong>${u.firstname } ${u.lastname } ratings (as seller)</strong></div>
				<table class="table">
			 		<thead>
						<tr>
					    	<th scope="col">User</th>
					      	<th scope="col">Product</th>
					      	<th scope="col">Rating</th>
					    </tr>
					</thead>
					<tbody>
				 		<c:forEach items="${ratings}" var="r">
				 			<c:forEach items="${finalno }" var="o">
				 				<c:if test="${r.advert.idAdvert ==o.advert.idAdvert}">
				 					<c:if test="${r.user.idUser == r.advert.user.idUser }">
				 						<c:if test="${!empty r.rateSeller }">
					    				<tr>
									    	<td><a class="isDisabled" href="/auction/myProfile2?idUser=${o.user.idUser }">${o.user.firstname } ${o.user.lastname }</a></td>
									      	<td><a class="isDisabled" href="advert?idProduct=${r.advert.idAdvert }">'${r.advert.name}'</a></td>
									      	<c:if test="${r.rateSeller=='POSITIVE'}">
									      		<td style="color: #4A8938;">${r.rateSeller }</td>
									      	</c:if>
									     	<c:if test="${r.rateSeller=='NEGATIVE'}">
									      		<td style="color: #CA4633;">${r.rateSeller }</td>
									      	</c:if>
									      	<c:if test="${r.rateSeller=='NEUTRAL'}">
									      		<td style="color: #E0A818;">${r.rateSeller }</td>
									      	</c:if>				    
									    </tr>
					  					</c:if>
					  				</c:if>
					  			</c:if>
					 	 	</c:forEach>
						</c:forEach>
					</tbody>
				</table>
				<div class="row justify-content-center">
				<div class="col-3">
				<a href="" class="form-control btn btn-success"><i class="fas fa-smile-beam"></i> : ${ratingOveralPositive }</a>
				</div>
				<div class="col-3">
				<a href="" class="form-control btn btn-danger"><i class="fas fa-frown"></i> : ${ratingOveralNegative }</a>
				</div>
				<div class="col-3">
				<a href="" class="form-control btn btn-warning"><i class="fas fa-meh"></i> : ${ratingOveralNeutral }</a>
				</div>
				</div>			 					
			</div>
		</c:if>
	</c:if>
	<br/><br/><br/>
		<jsp:include page="footer.jsp" /> 
</div>
</body>
</html>