<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Create New User</title>
</head>
<body >
<section style="margin: auto; margin-top: 40px; width: 30%; border: 0.5px solid; border-radius: 25px;  box-shadow: 1px 1px #888888; align-items: center; padding: 20px;" >
		<form action="AddNewUser" method="post">
			<div style="text-align:center; color: white; background-color: #097317; border-radius: 5px; padding: 15px;"  class="">
   			 <span style="padding: 15px;">Please enter your information</span>
  			</div> 
  			 <div style="padding: 20px;"  class="">
		 		<label for="uname"style="margin-bottom: 15px;"><b>Username:</b></label><br> 
    			<input type="text" placeholder="Enter Username" name="user" style="width: 70%; margin-bottom: 10px; ">
				<br>
				<label for="email"style="margin-bottom: 15px;"><b>Email:</b></label><br> 
    			<input type="email" placeholder="Enter Email" name="email" style="width: 70%; margin-bottom: 10px; ">
				<br>
				
  				<label for="psw" style="margin-bottom: 15px;"><b>Password:</b></label><br>
    			<input type="password" placeholder="Enter Password" name="pass" style="width: 70%; margin-bottom: 10px;">
				<br>
    			<button style="background-color: #097317;" type="submit" class="btn btn-primary">Create</button>
			</div>		
		</form>
</section>
</body>
</html>