<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">
<head>
<title>resources</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="description" content="List of resources">
<meta name="keywords" content="resources">
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
  <li><a href="/resources">List of resources</a>
   <li><a href="/resources/add">Add new resource</a></li>
</ul>

<%
List<Resource> resources = (List<Resource>)request.getAttribute("resources");
%>

<fieldset><legend>Registro de recursos</legend>
<div class="Table">
	<div class="Title"><p>Mostrando <%= resources.size()%> recursos</p></div>
	<div class="Heading">
	<div class="Cell"><p>Código</p></div>
	<div class="Cell"><p>Nombre</p></div>
	<div class="Cell"><p>Estatus</p></div>
	<div class="Cell"><p>Creación</p></div>
	<div class="Cell"><p>Acciones</p></div>	
		
	</div>

<%for(Resource p : resources ) {%>
	<div class="Row">
		<div class="Cell"><p><%= p.getResourceId() %></p></div>
		<div class="Cell"><p><%= p.getName() %></p></div>
		<div class="Cell"><p><%= p.getStatusMostrar() %></p></div>
		<div class="Cell"><p><%= p.getCreatedFormatted() %></p></div>
		
		<div class="Cell"><p>
		<a href="/resources/view?resourceId=<%= p.getResourceId() %>"><img src="/img/icon_view.JPG" alt="View" width="20" height="20" title="View"></a>
         <a href="/resources/edit?resourceId=<%= p.getResourceId()%>"><img src="/img/icon_edit.JPG" alt="Edit" width="20" height="20" title="Edit"></a>
            <form name="post_<%= p.getResourceId() %>" style="display:none;" method="get" action="/resources/delete"><input type="hidden" name="resourceId" value="<%= p.getResourceId() %>"/></form>
            <a href="#" onclick="if (confirm(&quot;Are you sure you want to delete # <%= p.getResourceId() %>?&quot;)) { document.post_<%= p.getResourceId() %>.submit(); } event.returnValue = false; return false;"><img src="/img/icon_delete.JPG" alt="Delete" width="20" height="20" title="Delete"></a></p></div>

	</div>
<%}%>
</div>
</fieldset>
</body>
</html>