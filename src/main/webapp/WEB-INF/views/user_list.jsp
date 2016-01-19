<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    function confirmDelete(url)
    {
    	if (confirm("Confirm Delete?"))
    	{
    		window.location = url;
    	}
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
        <h1><span class="label label-default">User List</span></h1>
        <center>	
	    <b><span id="msg" style="font-size:9pt;">${message}</span></b>
	    </center>  
         <div class="col-md-4 col-md-offset-8">
			&nbsp;
			<div class="pull-right"><a href="<c:url value='/user/add' />">Add New User</a></div>  
    	</div>
    	
        <c:set var="count" value="0" scope="page" />
        <div class="row">
        	<div class="col-md-12">
         	 <table class="table table-bordered">
            	<thead>
              	<tr>
                	<td>No</td>
	        		<td>Username</td>
	        		<td>Email</td>
	        		<td></td>
	        		<td></td>
              	</tr>
            	</thead>
            	<tbody>
            	<c:forEach var="user" items="${userList}" varStatus="status">
            	<c:set var="count" value="${count + 1}" scope="page"/>
	        	<tr>
	        		<td>${status.index + 1}</td>
					<td>${user.username}</td>
					<td>${user.email}</td>
					<td><a href="<c:url value='/user/edit/${user.id}' />">edit</a></td>
					<td><a href="javascript:confirmDelete('<c:url value='/user/delete/${user.id}' />');">delete</a></td>
							
	        	</tr>
				</c:forEach>	
             
            	</tbody>
          	</table>
        	</div>
		</div>
        <div class="well">
	 		<span style="font-size:8pt"><c:out value="${count}" /> record(s)</span>
	 	</div>
			
      </div>

    </div><!-- /.container -->
	
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
