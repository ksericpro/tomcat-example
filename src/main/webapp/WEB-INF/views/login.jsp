<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/bootstrap-3.3.6/favicon.ico">

    <title>Starter Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap-3.3.6/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap-3.3.6/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/templates/starter-template.css" rel="stylesheet">
    
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/templates/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="${pageContext.request.contextPath}/resources/bootstrap-3.3.6/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="${pageContext.request.contextPath}/resources/bootstrap-3.3.6/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
<!-- Customize Javascript-->
<script language="javascript">
<!--
function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

function check()
{
	if (document.getElementById("email").value=="")
	{
		setMsg("Email cannot be Empty");
		document.getElementById("email").focus();
		return false;
	}
	else if (document.getElementById("password").value=="")
	{
		setMsg("Passwords cannot be Empty");
		document.getElementById("password").focus();
		return false;
	}
	else 
	{
		if (!validateEmail(document.getElementById("email").value))
		{
			setMsg("Email wrong format");
			document.getElementById("email").focus();
			return false;
		}
	}
	
	setMsg("Submiting....")
	return true;
}

function setMsg(text)
{
	var d = document.getElementById("msg");
	d.innerHTML = text;
}
-->
</script>
<%@ page isELIgnored="false"%>
<body>
	<div class="container">
		<center>	
	    <b><span id="msg" style="font-size:9pt;">${message}</span></b>
	    </center>  
    	
      
	  <form:form class="form-signin" method="POST" action="${pageContext.request.contextPath}/login/process" modelAttribute="user" onsubmit="return check();">
	    <form:input type="hidden" path="id" id="id"/>
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
      <!--   <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>-->
         <form:input path="email" class="form-control" id="email" placeholder="Email"></form:input>
        
        <label for="inputPassword" class="sr-only">Password</label>
        <!--<input type="password" id="inputPassword" class="form-control" placeholder="Password" required>-->
          <form:password path="password" class="form-control" id="password" placeholder="Password"/>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
     </form:form>

    </div> <!-- /container -->

	<!--<h2>Hello, ${name}. Welcome to Spring MVC!</h2>
    <img src="${pageContext.request.contextPath}/resources/images/car.jpg" alt="car"/>-->	
	
	 <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="${pageContext.request.contextPath}/resources/bootstrap-3.3.6/assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap-3.3.6/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap-3.3.6/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>