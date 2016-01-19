<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	if (document.getElementById("username").value=="")
	{
		setMsg("User Name cannot be Empty");
		document.getElementById("username").focus();
		return false;
	}
	else if (document.getElementById("email").value=="")
	{
		setMsg("Email cannot be Empty");
		document.getElementById("email").focus();
		return false;
	}
	else if (document.getElementById("password").value!="")
	{
	//	alert(document.getElementById("password").value);
	//	alert(document.getElementById("repassword").value);
		if (document.getElementById("password").value!=document.getElementById("repassword").value)
		{
			//alert("dun match");
			setMsg("Passwords do not match");
			document.getElementById("password").focus();
			return false;
		}
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

  <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Project MVC</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="${pageContext.request.contextPath}/user/list?">User List</a></li>
            <li><a href="${pageContext.request.contextPath}/login?">Logout</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    
    <div class="container">

      <div class="starter-template">
	   <h1><span class="label label-default">User Registration</span></h1>

	   <span id="msg" style="font-size:9pt;">${message}</span>      
      <br/>
<form:form method="POST" action="${pageContext.request.contextPath}${action}" modelAttribute="user" onsubmit="return check();">
	<form:input type="hidden" path="id" id="id"/>
   <div class="form-group row">
    <label for="inputName2" class="col-sm-2 form-control-label">Name</label>
    <div class="col-sm-10">
     <!-- <input type="text" class="form-control" id="inputName2" placeholder="Name">-->
      <form:input path="username" type="text" class="form-control" id="username" placeholder="Name"></form:input>
    </div>
  </div>
  <div class="form-group row">
    <label for="inputEmail3" class="col-sm-2 form-control-label">Email</label>
    <div class="col-sm-10">
      <!--  <input type="email" class="form-control" id="inputEmail3" placeholder="Email">-->
      <form:input path="email" class="form-control" id="email" placeholder="Email"></form:input>
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword3" class="col-sm-2 form-control-label">Password</label>
    <div class="col-sm-10">
      <!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password">-->
      <form:password path="password" class="form-control" id="password" placeholder="Password"/>
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword4" class="col-sm-2 form-control-label">Re-Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="repassword" placeholder="Password">
    </div>
  </div>
 
  <div class="form-group row">
    <div class="col-sm-offset-2 col-sm-10">
	<c:choose>
		<c:when test="${edit}">
			 <button type="submit" class="btn btn-secondary">Update</button>
		</c:when>
		<c:otherwise>
			 <button type="submit" class="btn btn-secondary">Register</button>
		</c:otherwise>
	</c:choose>
     
    </div>
  </div>
</form:form>
      
      
    <!--   
	<h1>User Registration</h1>
	<b><span id="msg" style="font-size:9pt;">${message}</span></b>
	<form:form method="POST" action="${pageContext.request.contextPath}${action}" modelAttribute="user" onsubmit="return check();">
	<form:input type="hidden" path="id" id="id"/>
	<table>
	<tbody>
		<tr>
			<td>User Name:</td>
			<td><form:input path="username"></form:input></td>
		</tr>
		<tr>
			<td>Email:</td>
			<td><form:input path="email"></form:input></td>
		</tr>
		<tr>
			<td>Password:</td>
			<td><form:password path="password" /></td>
		</tr>
		<tr>
			<td>Re-Password:</td>
			<td><input id="repassword" type="password"/></td>
		</tr>
		<tr>
			<td>
				<c:choose>
				    <c:when test="${edit}">
						<input type="submit" value="Update"/>
					</c:when>
					<c:otherwise>
						<input type="submit" value="Register"/>
					</c:otherwise>
					</c:choose>
			
			</td>
			<td></td>
		</tr>
	</tbody>
	</table>
	</form:form>-->
	</div>
	</div>

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
