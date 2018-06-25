<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Ingresar Roles</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">


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
</ul>

<% List<Role> roles = (List<Role>) request.getAttribute("roles");%>
<%
String aux="";
String nameExist="";

for( Role p : roles ) {
	nameExist=nameExist+"(?¡"+p.getName()+")";
	}
%>
<form action="/roles/add" method="get">

<fieldset><legend>Registro de roles</legend>
<div id="formulario">

	<div class="fila">
	<div class="etiqueta"><label for="name">Nombre :</label></div>
		<div class="control"><input type="text" name="name" value="" pattern="<%=nameExist %>[a-Z]{5-15}" title="Mínimo 5, Máximo 20 caracteres" required /></div>
	</div>
			
	<input type="hidden" name="aux" value="<%=nameExist %>"/>
	<div class="fila">
		<div id="action"><input type="reset" value="Limpiar"/><input type="submit" value="Guardar"/></div>
	</div>
</div>
</fieldset>
</form>

</body>
</html>