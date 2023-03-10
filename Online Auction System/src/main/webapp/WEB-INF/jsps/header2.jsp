<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar fixed-top navbar-expand-lg border-bottom bg-light mt-n1 mb-n2">
	  		<a class="navbar-brand" href="/auction/welcome">
	  			<img src="/images/logo-transparent-png.png" width="140" height="40" class="d-inline-block align-top" alt="">
	  		</a>
	  		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">	
			  	<ul class="nav navbar-nav mr-auto text-dark">
			    	<li class="nav-item">		        
			      		<a class="nav-link" href="/auction/welcome">Home <span class="sr-only">(current)</span></a>
				  	</li>
			      	<li class="nav-item">
			        	<a class="nav-link" href="/auction/addAuction">Add Item to Auction</a>
			      	</li>
			      	<li class="nav-item">
			        	<a class="nav-link" href="/auction/myAuctions">My Auction Items</a>
			      	</li>
			      	<li class="nav-item">
			        	<a class="nav-link" href="/auction/showAdvertsBids">My Bids</a>
			      	</li>
			      	<li class="nav-item">
			        	<a class="nav-link" href="/auction/myProfile">My Profile</a>
			      	</li>
			      	<li class="nav-item">
			        	<a class="nav-link" href="showRatings">My Ratings</a>
			      	</li>
			      	<li class="nav-item">
				        	<a class="nav-link" href="/auction/allUsers">All Users</a>
				    </li>
			    </ul>
		   	    <form class="form-inline my-2 my-lg-0">
		      		<a href="/auth/logout" class="btn btn-outline-danger">Logout</a>
		    	</form>
  	  		</div>
		</nav>
</body>
</html>