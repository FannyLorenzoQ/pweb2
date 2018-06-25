<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Ingresar acceso</title>
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
  <li><a href="/access">List of accesses</a>
</ul>

<% 
List <Role> roles=(List<Role>) request.getAttribute("roles");
List <Resource> resources=(List<Resource>) request.getAttribute("resources");

String resourcesExist="", rolesExist="";

for( Resource r : resources ) {
	resourcesExist=resourcesExist+"<option value=\""+r.getResourceId()+"\">"+r.getName()+"</option>";
}
for( Role r : roles ) {
	rolesExist=rolesExist+"<option value=\""+r.getRoleId()+"\">"+r.getName()+"</option>";
}

%>
<form action="/access/add" method="get">

<fieldset><legend>Registro de Accesos</legend>
<div id="formulario">

	<div class="input date required">
        <div class="etiqueta"><label for="text">Role :</label></div>
        <select name="role" required="required">
        <%=rolesExist %>
        </select>
    </div>
    <div class="input date required">
        <div class="etiqueta"><label for="text">Resource :</label></div>
        <select name="resource" required="required">
        <%=resourcesExist %>
        </select>
    </div>
      
	<input type="hidden" name="aux" value="oki"/>
	<div class="fila">
		<div id="action"><input type="reset" value="Limpiar"/><input type="submit" value="Guardar"/></div>
	</div>
</div>
</fieldset>
</form>

</body>
</html>