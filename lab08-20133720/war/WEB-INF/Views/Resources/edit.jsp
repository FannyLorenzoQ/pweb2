<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.entity.*" %>
<%@ page import="java.util.List"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Resources vista</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="description" content="List of resources">
<meta name="keywords" content="resource">
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

<% 
Resource p = (Resource)request.getAttribute("resource");
List<Resource> resources = (List<Resource>) request.getAttribute("resources");

String aux="";
String nameExist="";
for( Resource t : resources ) {
	if(t.getResourceId()==p.getResourceId()) {
		aux=aux+"";
	}else{
		nameExist=nameExist+"(?!"+t.getName()+")";
		}
}
%>
<ul class="navbar">
  <li><a href="/index.html">Back...</a></li>
  <li><a href="/resources">List of resources</a>
  <li><a href="/resources/add">Add new</a></li>
  <li><a href="/resources/view?resourceId=<%= p.getResourceId() %>">View</a></li>
  <li><a href="/resources/edit?resourceId=<%= p.getResourceId() %>">Update</a></li>
   <form name="post_<%= p.getResourceId() %>" style="display:none;" method="get" action="/resources/delete"><input type="hidden" name="resourceId" value="<%= p.getResourceId() %>"/></form>
    <li><a href="#" onclick="if (confirm(&quot;Are you sure you want to delete # <%= p.getResourceId() %>?&quot;)) { document.post_<%= p.getResourceId() %>.submit(); } event.returnValue = false; return false;">Delete</a></li>

</ul>


<div class="Table">
	<div class="Title"><p>Editando el recurso Nro: <%= p.getResourceId() %> </p></div>

<form action="/resources/edit" method="get">
<fieldset><legend>Registro de recursos</legend>
<div id="formulario">

	<div class="fila">
		<div class="etiqueta"><label for="name">Nombre :</label></div>
		<div class="control"><input type="text" name="name" maxlength="20" value="<%= p.getName() %>" pattern="<%=nameExist %>[a-Z]{5-20}" title="Mínimo 5, Máximo 20 caracteres" required /></div>
	</div>

	<div class="fila">
		<div class="etiqueta"><label for="status">Estado :</label></div>
		<div class="control"><input type="radio" name="status" value="Activo" checked> Activo<br></div>
  		<div class="control"><input type="radio" name="status" value="No activo">No activo<br>
	</div>
	
	<input type="hidden" name="id" value="<%=p.getResourceId()%>"/>
	<div class="fila">
		<div id="action"><input type="reset" value="Regresar datos"/><input type="submit" value="Modificar"/></div>
	</div>
</div>
</fieldset>
</form>

</div>
</body>
</html>