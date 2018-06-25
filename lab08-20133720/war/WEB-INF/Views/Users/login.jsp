<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">
<head>
<title>Login</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="description" content="Usuario logeado">
<meta name="keywords" content="login">
<meta name="author" content="Fanny Lorenzo">

<link rel="stylesheet" type="text/css" href="/css/estilo.css">
</head>
<body>
<!-- Menú de navegación del sitio -->
<div id="pitch" >
	<ul id="menu">
            <li><a href="/users">Users</a></li>
            <li><a href="/providers">Providers</a></li>
            <li><a href="/access">Access</a></li>
            <li><a href="/roles">Roles</a></li>
            <li><a href="/resources">Resources</a></li>
            <li><a href="/users/login">Login</a></li>
            <li><a href="/users/logout">Logout</a></li>
     </ul>
</div>

<ul class="navbar">
   <li><a href="/index.html">Back...</a></li>
  <li><a href="/users/login">Login</a>
   <li><a href="/users/logout">Logout</a></li>
</ul>

<%
User user = (User)request.getAttribute("user");
%>
<div class="Table">
	<div class="Title"><p>Mostrando usuario actual</p></div>
	<div class="Heading">
	<div class="Cell"><p>Nickname</p></div>
	<div class="Cell"><p>Email</p></div>	
		
	</div>

	<div class="Row">
		<div class="Cell"><p><%= user.getNickname() %></p></div>
		<div class="Cell"><p><%= user.getEmail() %></p></div>
		
	</div>
</div>
</body>
</html>