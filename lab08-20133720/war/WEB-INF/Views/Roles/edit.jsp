<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.entity.*" %>
<%@ page import="java.util.List"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Roles vista</title>
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

<% 
Role p = (Role)request.getAttribute("role");
List<Role> roles = (List<Role>) request.getAttribute("roles");

String aux="";
String nameExist="";
for( Role t : roles ) {
	if(t.getRoleId()==p.getRoleId()) {
		aux=aux+"";
	}else{
		nameExist=nameExist+"(?!"+t.getName()+")";
		}
}
%>
<ul class="navbar">
  <li><a href="/index.html">Back...</a></li>
  <li><a href="/roles">List of roles</a>
  <li><a href="/roles/add">Add new</a></li>
  <li><a href="/roles/view?roleId=<%= p.getRoleId() %>">View</a></li>
  <li><a href="/roles/edit?roleId=<%= p.getRoleId() %>">Update</a></li>
   <form name="post_<%= p.getRoleId() %>" style="display:none;" method="get" action="/roles/delete"><input type="hidden" name="roleId" value="<%= p.getRoleId() %>"/></form>
    <li><a href="#" onclick="if (confirm(&quot;Are you sure you want to delete # <%= p.getRoleId() %>?&quot;)) { document.post_<%= p.getRoleId() %>.submit(); } event.returnValue = false; return false;">Delete</a></li>

</ul>


<div class="Table">
	<div class="Title"><p>Editando el rol Nro: <%= p.getRoleId() %> </p></div>

<form action="/roles/edit" method="get">
<fieldset><legend>Registro de roles</legend>
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
	
	<input type="hidden" name="id" value="<%=p.getRoleId()%>"/>
	<div class="fila">
		<div id="action"><input type="reset" value="Regresar datos"/><input type="submit" value="Modificar"/></div>
	</div>
</div>
</fieldset>
</form>

</div>
</body>
</html>