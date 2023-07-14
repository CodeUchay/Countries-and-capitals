<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<section style="margin: auto; margin-top: 40px; width: 30%; border: 0.5px solid; border-radius: 25px;  box-shadow: 1px 1px #888888; align-items: center; padding: 20px;" >
		<form action="UserLogin" method="post">
			<div style="text-align:center; color: white; background-color: #1d71f0; border-radius: 5px; padding: 15px;"  class="">
   			 <span style="padding: 15px;">Please enter your login information</span>
  			</div> 
  			 <div style="padding: 20px;"  class="">
		 		<label for="uname"style="margin-bottom: 15px;"><b>Username:</b></label><br> 
    			<input type="text" placeholder="Enter Username" name="user" style="width: 70%; margin-bottom: 10px; ">
				<br>
  				<label for="psw" style="margin-bottom: 15px;"><b>Password:</b></label><br>
    			<input type="password" placeholder="Enter Password" name="pass" style="width: 70%; margin-bottom: 10px;">
				<br>
    			<button style="background-color: #1d71f0;" type="submit" class="btn btn-primary">Submit</button>
    			<span><a href="NewUser.jsp">New User?</a></span>
			</div>		
		</form>
		<%
		String errorMessage = (String) request.getAttribute("errorMessage");
		%>
		<%
		if (errorMessage != null) {
		%>
		<div class="alert alert-danger alert-dismissible fade in">
			 <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
			 <strong><%=errorMessage%></strong>
		</div>
		<%
		}
		%>
	</section>
	<section style="margin: auto; margin-top: 20px; width: 30%; align-items: center; padding: 20px;" >
	 	<div class="alert alert-info alert-dismissible fade in">
   		 	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		 	<span> This site uses cookies. By continuing to browse this site, you are agreeing to our use of cookies</span>
 		 </div>
	</section>
</body>
</html>