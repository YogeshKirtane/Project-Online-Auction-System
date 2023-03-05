<!--===============================================================================-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--===============================================================================-->
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!--===============================================================================-->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<!--===============================================================================-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--===============================================================================-->
<!DOCTYPE html>
<html>
<head>
	<!--============================================================================================================================================================================================================-->		
	<title>User Profile</title>
	<!--============================================================================================================================================================================================================-->	
	<meta charset="UTF-8">	
	<!--============================================================================================================================================================================================================-->	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!--============================================================================================================================================================================================================-->	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">		
	<!--============================================================================================================================================================================================================-->	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<!--============================================================================================================================================================================================================-->	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<!--============================================================================================================================================================================================================-->	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<!--============================================================================================================================================================================================================-->	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<!--============================================================================================================================================================================================================-->	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<!--============================================================================================================================================================================================================-->	
	<link rel="stylesheet" href="/css/auction2.css">
	<!--============================================================================================================================================================================================================-->
</head>
<body>
<div class="container overflow:hidden">
	<!--=====================================NEREGISTROVAN CLAN===========================================-->
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
		<h2 class="text-center text-black"><strong>My Profile</strong></h2>
		<br/>
		<div class="container emp-profile">
        	<form method="post">
            	<div class="row">
                    <div class="col-md-4"><br>
                        <div class="profile-img">
                            <img src="/images/login_Image.jpg" alt=""/>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head"><br>
                        	<h3>
                            	${user.firstname } ${user.lastname }
                            </h3>
                            <div class="text-muted"><small>Joined: ${user.time }</small></div>   
                            <br>              
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                            	<li class="nav-item">
                                    <h5>About</h5>
                                </li>                           
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2"><br>
                        <a href="editProfile" class="btn btn-primary">Edit profile</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-work">
                        	<br/><br/>
                            <p>Last 5 auction</p>
                            	<c:if test="${empty lastFive }">
                            		<a>Don't have any auction yet!</a>
                            	</c:if>
	                            <c:forEach items="${lastFive }" var="lf">
		                            <a href="/auction/advert?idProduct=${lf.idAdvert }">${lf.name }</a><br/>		                           
	                            </c:forEach>
	                            <br/><br/>
                            <p>Ratings as seller</p>
                            <i class="fas fa-smile-beam"></i> : ${ratingOveralPositive }<br/>
                            <i class="fas fa-frown"></i> : ${ratingOveralNegative }<br/>
                            <i class="fas fa-meh"></i> : ${ratingOveralNeutral }<br/>           
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            	<div class="row">
                    	            <div class="col-md-4">
             	                       <label>Username</label>
                                    </div>
                                    <div class="col-md-8">
              		                    <p>${user.username }</p>
                                    </div>
    	                    	</div>
                                <div class="row">
                     	        	<div class="col-md-4">
           		                    	<label>Email</label>
                                   	</div>
                                   	<div class="col-md-8">
         	                        	<p>${user.email }</p>
                                   	</div>
                                </div>
                                <div class="row">
                                	<div class="col-md-4">
                                    	<label>Phone number</label>
                                    </div>
                                    <div class="col-md-8">
                        	            <p>${user.phoneNumber }</p>
                                    </div>
                                </div>
                                <div class="row">
                                	<div class="col-md-4">
                          	        	<label>Country</label>
                                    </div>
	                       	        <div class="col-md-8">
	                                	<p>${user.country }</p>
	                                </div>
                                </div>
                                <div class="row">
                                	<div class="col-md-4">
                                    	<label>City</label>
                                    </div>
                                    <div class="col-md-8">
                             	       <p>${user.city }</p>
                                    </div>
                                 </div>
                                 <div class="row">
                                 	<div class="col-md-4">
                                    	<label>Description</label>
                                    </div>
                                    <div class="col-md-8">
                                        <p>${user.description }</p>
                                    </div>
                                 </div>
              	         	</div>
                        </div>
                    </div>
                </div>   
            </form>           
        </div>
	</c:if>
	<br/><br/><br/>
		<jsp:include page="footer.jsp" />
</div>
</body>
</html>