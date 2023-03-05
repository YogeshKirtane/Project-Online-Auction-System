<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar fixed-top navbar-expand-lg" style="background-color: #e3f2fd;">
			<a class="navbar-brand" href="/auction/welcome">
		  		<img src="/images/hammer.png" width="30" height="30" class="d-inline-block align-top" alt="">   
		  		<strong >Online Auction System</strong>
		  	</a> 
			<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
		  		<ul class="nav nav-tabs mr-auto mt-2 mt-lg-0">
		    		<li class="nav-item active">		        
		        		<a class="nav-link" href="welcome">Home <span class="sr-only">(current)</span></a>
			  		</li>		  	
		    	</ul>	    
		    	<form class="form-inline my-2 my-lg-0">
	      			<a href="/auth/userLogin" class="btn btn-outline-success">Login</a>
	    		</form>
	   	   		&nbsp; &nbsp;   
	   	    	<form class="form-inline my-2 my-lg-0">
		      		<a href="/auth/registracija" class="btn btn-outline-info">Register</a>
		    	</form>  	
	  	  	</div>
		</nav>
</body>
</html>