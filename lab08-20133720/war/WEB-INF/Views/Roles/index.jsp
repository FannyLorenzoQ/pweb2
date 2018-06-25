<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">
<head>
<title>Roles</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="description" content="List of roles">
<meta name="keywords" content="roles">
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
  <li><a href="/roles">List of roles</a>
   <li><a href="/roles/add">Add new role</a></li>
</ul>

<%
List<Role> roles = (List<Role>)request.getAttribute("roles");
%>

<fieldset><legend>Registro de roles</legend>
<div class="Table">
	<div class="Title"><p>Mostrando <%= roles.size()%> roles</p></div>
	<div class="Heading">
	<div class="Cell"><p>Código</p></div>
	<div class="Cell"><p>Nombre</p></div>
	<div class="Cell"><p>Estatus</p></div>
	<div class="Cell"><p>Creación</p></div>
	<div class="Cell"><p>Acciones</p></div>	
		
	</div>

<%for( Role p : roles ) {%>
	<div class="Row">
		<div class="Cell"><p><%= p.getRoleId() %></p></div>
		<div class="Cell"><p><%= p.getName() %></p></div>
		<div class="Cell"><p><%= p.getStatusMostrar() %></p></div>
		<div class="Cell"><p><%= p.getCreatedFormatted() %></p></div>
		
		<div class="Cell">
		<a href="/roles/view?roleId=<%= p.getRoleId() %>"><img src="/img/icon_view.JPG" alt="View" width="20" height="20" title="View"></a>
        <a href="/roles/edit?roleId=<%= p.getRoleId()%>"><img src="/img/icon_edit.JPG" alt="Edit" width="20" height="20" title="Edit"></a>
        <form name="post_<%= p.getRoleId() %>" style="display:none;" method="get" action="/roles/delete"><input type="hidden" name="roleId" value="<%= p.getRoleId() %>"/></form>
            <a href="#" onclick="if (confirm(&quot;Are you sure you want to delete # <%= p.getRoleId() %>?&quot;)) { document.post_<%= p.getRoleId() %>.submit(); } event.returnValue = false; return false;">
            <img src="/img/icon_delete.JPG" alt="Delete" width="20" height="20" title="Delete"></a></div>

	</div>
<%}%>
</div>
</fieldset>
</body>
</html>