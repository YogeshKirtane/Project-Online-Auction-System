<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>Add new item</title>
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
	<div class="container">
	
	<!--NEREGISTROVAN CLAN-->
	<c:if test="${user.role!=1 }">
		<jsp:include page="header1.jsp" />
		<br/><br/><br/>
		<center><a href="#" class="btn btn-warning">You are not allowed to see this page. Join us if you want to see more.</a></center>
		<br/>
		<center><a href="/auth/registracija" class="btn btn-outline-info">Register</a></center>
	</c:if>

	<!--REGISTROVAN CLAN-->
	<c:if test="${user.role==1 }">
		<jsp:include page="header2.jsp" />
		<br/><br/><br/><br/>
		
		<%-- <div class="card text-white bg-dark mb-3 ">
			<img class="card-img-top" src="/images/bid1.png" alt="Card image cap" width="30" height="140">
			<div class="card-header"><center>Add new advert</center></div>
			<div class="card-body">
				<form action="newAuction" method="post">
				Name: 			<input class="form-control" type="text" name="name"><br/>
				Starting price: <input class="form-control" type="text" name="startingPrice"> <br/>
				Description: 	<textarea class="form-control"  name="description"></textarea> <br/>
				Category: 		<select class="form-control" name="advertCategory"> 
									<c:forEach items="${advertCategories }" var="ac">
										<option value="${ac.idAdvertCategory }">${ac.category }</option>
									</c:forEach>
							  	</select>
								<br/>
								<input class="form-control btn btn-outline-success" type="submit" value="Add">
				</form>
			</div>
		</div> --%>
	
		<h2 class="text-center text-black"><strong>Add Item To Auction</strong></h2>
		<br/><br/>
		 	<div class="container">
		 	<div class="row">
			 	<div class="col-md-6 offset-md-3">
					 		<form action="newAuction" method="post" enctype="multipart/form-data">			
					  			<div class="form-group row">
					    			<label class="col-md-4 col-form-label">Name</label>
					    			<div class="col-md-8">
					      				<input type="text" class="form-control" name="name" placeholder="Enter name">
					    			</div>
					  			</div>
					  			<div class="form-group row">
					    			<label class="col-md-4 col-form-label">Starting Price</label>
					    			<div class="col-md-8">
					      				<input type="number" class="form-control" name="startingPrice" placeholder="Enter price in rupees">
					    			</div>
					  			</div>
					  			<div class="form-group row">
					    			<label class="col-md-4 col-form-label">Upload Image</label>
					    			<div class="col-md-8">
					      				<div class="custom-file">
					  						<input type="file" class="form-control" name="image" id="customFile">
					  						<label class="custom-file-label text-muted" for="customFile">Choose one image file</label>
										</div>
					    			</div>
					  			</div>
					  			<div class="form-group row">
					    			<label class="col-md-4 col-form-label">Description</label>
					    			<div class="col-md-8">
					      				<textarea class="form-control" rows="4" name="description" placeholder="Enter description"></textarea>
					    			</div>
					  			</div>
					  			<div class="form-group row">
					    			<label class="col-md-4 col-form-label">Category</label>
					    			<div class="col-md-8">
					      				<select name="advertCategory" class="form-control">
					        				<option selected>Choose...</option>
					        				<c:forEach items="${advertCategories }" var="ac">
					        				<option value="${ac.idAdvertCategory }">${ac.category }</option>
					        				</c:forEach>
					      				</select>
					    			</div>
					  			</div><br/>
					  			<div class="form-group row justfiy-content-end">
					  				<div class="col-md-4">
					  					<input class="form-control btn btn-success" type="submit" value="Add to Auction">
					  				</div>
					  			</div>
							</form>
			 	</div>
		 	</div>
		 	</div>
					
	</c:if>
	
	<br/><br/><br/>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>