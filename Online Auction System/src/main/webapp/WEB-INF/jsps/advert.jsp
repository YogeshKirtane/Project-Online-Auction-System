<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Auction</title>
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
	<br/><br/><br/><br/>
	  
    <!--NEREGISTROVAN CLAN-->
	
	<c:if test="${user.role!=1}">
	<div class="row row-cols-1 row-cols-md-2 g-4">
	
	<div class="col-6">
	<div class="card">
  		<img class="card-img-top" src="@{'images/'+${advert.imageName}}" alt="Card image cap">
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
    		<li class="list-group-item">Current prize: <a class="card-text" href="/auth/registracija">Join us to see :)</a></li>
    		<li class="list-group-item">Last bids: 
    			<c:if test="${empty offers}">
					<p class="card-text">Be the first one to bid!</p>
				</c:if>
				<c:if test="${!empty offers }">
					<c:forEach items="${offers}" var="o">
						<div class="card text-dark bg-light mb-3" style="max-width: 18rem;">
						  <div class="card-header">${o.user.firstname} ${o.user.lastname}</div>
						  <div class="card-body">
						    <p class="card-title">&#x20B9;${o.price}</p>
						    <p class="card-text"><small>${o.time}</small></p>
						  </div>
						</div>					
					</c:forEach>
				</c:if>
			</li>
  		</ul>
  		<div class="card-body">
    		<a href="/auth/registracija" class="alert alert-primary">Join us to bid!</a>
 		</div>
	</div>
	</div>
	
	<div class="col-3">
	<div class="card">
  		<div class="card-body">
  			<div class="card-header">
  				Status: <a href="closeBid?idProduct=${advert.idAdvert }" class="form-control btn btn-outline-success btn-sm">ACTIVE</a>
  			</div>
  			<br/><br/>
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
	
	<!--==================================================================================================-->
	  
    <!--=============================REGISTROVAN CLAN (OTVORENA AUKCIJA)==================================-->

	<c:if test="${user.role==1 }">
	<c:if test="${advert.isActive==1 }">
	<div class="row row-cols-1 row-cols-md-2 g-4">
	
	<div class="col-6">
	<div class="card">
  		<img class="card-img-top" src="@{'images/'+${advert.imageName}}" alt="Card image cap">
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
    		
    		<li class="list-group-item">
    			<form action="offer" method="post">
					<input type="text" class="form-control" aria-label="Amount (to the nearest dollar)" name="currentPrice" placeholder="Enter bid amount">
					<br/>
					<input type="submit" class="form-control btn btn-primary" value="Submit a Bid!">
				</form>
			</li>
				
    		<li class="list-group-item">Last bids: 
    			<c:if test="${empty offers}">
					<p class="card-text">Be the first one to bid!</p>
				</c:if>
				<c:if test="${!empty offers }">
					<c:forEach items="${offers}" var="o">
						<div class="card text-dark bg-light mb-3" style="max-width: 18rem;">
						  <div class="card-header">${o.user.firstname} ${o.user.lastname}</div>
						  <div class="card-body">
						    <p class="card-title">&#x20B9;${o.price}</p>
						    <p class="card-text"><small>${o.time}</small></p>
						  </div>
						</div>					
					</c:forEach>
				</c:if>
			</li>
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
	<br/><br/>
	<section style="background-color: #eee;">
  	<div class="container my-5 py-5">
    <div class="row d-flex justify-content-center">
      <div class="col-md-12 col-lg-10 col-xl-8">
        <div class="card">
        
        <c:forEach items="${messages}" var="m">
		<c:if test="${m.advert.idAdvert == advert.idAdvert}">
          <div class="card-body">
            <div class="d-flex flex-start align-items-center">
              <div>
                <h6 class="fw-bold text-primary mb-1">${m.user.username }</h6>
                <p class="text-muted small mb-0">${m.time }</p>
              </div>
            </div>
            <p class="mt-3 mb-4 pb-2">${m.content }</p>  
          </div>
        </c:if>
		</c:forEach>
		
          <div class="card-footer py-3 border-0">
            <div class="d-flex flex-start w-100">
              <div class="form-outline w-100">
                <form action="addComment" method="post">
					<div class="formClass">
						<h3 class="card-text">Comments</h3>
						<textarea placeholder="Add comment.."class="form-control textareaClass"  rows="4" name="content"></textarea>
				 </div>
					<div class="float-end mt-2 pt-1">
              		<button type="submit" class="btn btn-primary btn-sm">Post comment</button>
              		<button type="reset" class="btn btn-outline-primary btn-sm">Cancel</button>
            	 	</div>
				</form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  	</div>
	</section>
	
	</c:if>
	</c:if>
	
	<!---------------->	

	<!--REGISTROVAN CLAN (ZATVORENA AUKCIJA)-->	
	
	<c:if test="${user.role==1 }">
	<c:if test="${advert.isActive==0 }">
	<div class="row row-cols-1 row-cols-md-2 g-4">
	
	<div class="col-6">
	<div class="card">
  		<img class="card-img-top" src="@{'images/'+${advert.imageName}}" alt="Card image cap">
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
    		<li class="list-group-item">Sold for: &#x20B9;${advert.currentPrice}</li>	
    		<li class="list-group-item">Buyer: <a class="isDisabled" href="/auction/myProfile2?idUser=${buyer.user.idUser }">${buyer.user.firstname} ${buyer.user.lastname }</a></li>
  			
  			
  			<li class="list-group-item">
  			<c:if test="${user.idUser==advert.user.idUser }">
			 	<c:if test="${!empty advert.ratingBuyer }">
			 		<p class="form-control btn btn-success">You already gave your rate!</p>
			 	</c:if>
			 	<c:if test="${empty advert.ratingBuyer }">
			 	  <form action="rateBuyer" method="post">
			 		 Rate Buyer ${buyer.user.firstname} ${buyer.user.lastname }<br/>
			 		 <select class="form-control" name="ratingBuyer">
			 		 	<option selected>Choose...</option>
			 		 	<option>Positive</option>
			 		 	<option>Negative</option>
			 		 	<option>Neutral</option>
			 		 </select>
			 		 <br/>
			 		 <input class="form-control btn btn-outline-success" type="submit" value="Rate">
			 	   </form>
			 	</c:if>
			 </c:if>
			 </li>
  			
  			<li class="list-group-item">
  			<c:if test="${buyer.user.idUser==user.idUser }">
			 	<c:if test="${!empty rating.rateSeller }">
			 		<p class="form-control btn btn-success">You already gave your rate</p>
			 	</c:if>
			 	<c:if test="${empty rating.rateSeller }">
			      <form action="rateSeller" method="post">
			 		 Rate Seller ${advert.user.firstname} ${advert.user.lastname}<br/>
			 		 <select class="form-control" name="ratingSeller">
			 		 	<option selected>Choose...</option>
			 		 	<option>Positive</option>
			 		 	<option>Negative</option>
			 		 	<option>Neutral</option>
			 		 </select><br/>
			 		 <input class="form-control btn btn-outline-success" type="submit" value="Rate">
			 	  </form>
			 	</c:if>
			</c:if>
  			</li>
  			
  			
  		</ul>
	</div>
	</div>
	
	<div class="col-3">
	<div class="card">
  		<div class="card-body">
  			<div class="card-header">
  				Status: <a href="#" class="form-control btn btn-outline-danger btn-sm">CLOSED</a>
  				<p class="card-text"><small class="text-muted">Closed at: ${advert.time}</small></p>
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
	<br/><br/>
	<section style="background-color: #eee;">
  	<div class="container my-5 py-5">
    <div class="row d-flex justify-content-center">
      <div class="col-md-12 col-lg-10 col-xl-8">
        <div class="card">
        
        <c:forEach items="${messages}" var="m">
		<c:if test="${m.advert.idAdvert == advert.idAdvert}">
          <div class="card-body">
            <div class="d-flex flex-start align-items-center">
              <div>
                <h6 class="fw-bold text-primary mb-1">${m.user.username }</h6>
                <p class="text-muted small mb-0">${m.time }</p>
              </div>
            </div>
            <p class="mt-3 mb-4 pb-2">${m.content }</p>  
          </div>
        </c:if>
		</c:forEach>
		
          <div class="card-footer py-3 border-0">
            <div class="d-flex flex-start w-100">
              <div class="form-outline w-100">
                <form action="addComment" method="post">
					<div class="formClass">
						<h3 class="card-text">Comments</h3>
						<textarea placeholder="Add comment.."class="form-control textareaClass"  rows="4" name="content"></textarea>
				 </div>
					<div class="float-end mt-2 pt-1">
              		<button type="submit" class="btn btn-primary btn-sm">Post comment</button>
              		<button type="reset" class="btn btn-outline-primary btn-sm">Cancel</button>
            	 	</div>
				</form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  	</div>
	</section>
	
	</c:if>
	</c:if>
	
	<!--------------------------------->	
	<br/><br/><br/>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>