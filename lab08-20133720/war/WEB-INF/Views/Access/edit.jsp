<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.entity.*" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Usuario vista</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="description" content="Editing access">
<meta name="keywords" content="access">
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
Access p = (Access)request.getAttribute("access");
List<Role> roles=(List<Role>) request.getAttribute("roles");
List<Resource> resources=(List<Resource>) request.getAttribute("resources");
String resourcesExist="", rolesExist="";
for( Role r : roles ) {
	if(p.getRoleIdName().equalsIgnoreCase(r.getName()))
		rolesExist=rolesExist+"<option value=\""+r.getRoleId()+"\" selected=\"selected\">"+r.getName()+"</option>";
	else
	rolesExist=rolesExist+"<option value=\""+r.getRoleId()+"\">"+r.getName()+"</option>";
}
for( Resource re : resources ) {
	if(p.getResourceIdName().equalsIgnoreCase(re.getName()))
		resourcesExist=resourcesExist+"<option value=\""+re.getResourceId()+"\" selected=\"selected\">"+re.getName()+"</option>";
	else
		resourcesExist=resourcesExist+"<option value=\""+re.getResourceId()+"\">"+re.getName()+"</option>";
}
%>
<ul class="navbar">
  <li><a href="/index.html">Back...</a></li>
  <li><a href="/access">List of access</a>
  <li><a href="/access/add">Add new</a></li>
  <li><a href="/access/view?userId=<%= p.getAccessId() %>">View</a></li>
  <li><a href="/access/edit?userId=<%= p.getAccessId() %>">Update</a></li>
   <form name="post_<%= p.getAccessId() %>" style="display:none;" method="get" action="/access/delete"><input type="hidden" name="userId" value="<%= p.getAccessId() %>"/></form>
    <li><a href="#" onclick="if (confirm(&quot;Are you sure you want to delete # <%= p.getAccessId() %>?&quot;)) { document.post_<%= p.getAccessId() %>.submit(); } event.returnValue = false; return false;">Delete</a></li>

</ul>


<div class="Table">
	<div class="Title"><p>Editando el acceso de cód: <%= p.getAccessId() %> </p></div>

<form action="/access/edit" method="get">
<fieldset><legend>Editar access </legend>
<div id="formulario">
	<div class="input date required">
        <div class="etiqueta"><label for="text">Rol :</label></div>
        <select name="role" required="required">
        <%=rolesExist %>
        </select></div>
      
      <div class="input date required">
        <div class="etiqueta"><label for="text">Resource :</label></div>
        <select name="resource" required="required">
        <%=resourcesExist %>
        </select></div>  
        
	
	<div class="fila">
		<div class="etiqueta"><label for="status">Estado :</label></div>
		<div class="control"><input type="radio" name="status" value="Activo" checked> Activo<br></div>
  		<div class="control"><input type="radio" name="status" value="No activo">No activo<br></div>
	</div>
	<input type="hidden" name="id" value="<%=p.getId() %>"/>
	<div class="fila">
		<div id="action"><input type="reset" value="Regresar datos"/><input type="submit" value="Guardar"/></div>
	</div>
</div>
</fieldset>
</form>
</div>
</body>
</html>