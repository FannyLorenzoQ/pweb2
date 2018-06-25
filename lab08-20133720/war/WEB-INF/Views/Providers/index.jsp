<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">
<head>
<title>Proveedores</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="description" content="List of Providers">
<meta name="keywords" content="providers">
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
  <li><a href="/providers">List of providers</a>
   <li><a href="/providers/add">Add new</a></li>
</ul>

<%
List<Provider> providers = (List<Provider>) request.getAttribute("providers");
%>
<fieldset><legend>Registro de proveedores</legend>
<div class="Table">
	<div class="Title"><p>Mostrando <%= providers.size() %> providers</p></div>
	<div class="Heading">
	<div class="Cell"><p>Código</p></div>
	<div class="Cell"><p>Fecha de registro</p></div>
	<div class="Cell"><p>RUC/DNI</p></div>
		<div class="Cell"><p>Nombre/Razón social</p></div>
		<div class="Cell"><p>Dirección</p></div>
		<div class="Cell"><p>Nro de Contacto</p></div>
		<div class="Cell"><p>Correo electrónico</p></div>
		<div class="Cell"><p>Estatus</p></div>
		<div class="Cell"><p>Acciones</p></div>
		
	</div>

<%for( Provider p : providers ) {%>
	<div class="Row">
		<div class="Cell"><p><%= p.getProviderid() %></p></div>
		<div class="Cell"><p><%= p.getFechaFormatted() %></p></div>
		<div class="Cell"><p><%= p.getDocIde() %></p></div>
		<div class="Cell"><p><%= p.getName() %></p></div>
		<div class="Cell"><p><%= p.getAddress() %></p></div>
		<div class="Cell"><p><%= p.getCelular() %></p></div>
		<div class="Cell"><p><%= p.getEmail() %></p></div>
		<div class="Cell"><p><%= p.getStatusMostrar() %></p></div>
		
		<div class="Cell">
		<a href="/providers/view?providerId=<%= p.getProviderid() %>"><img src="/img/icon_view.JPG" alt="View" width="20" height="20" title="View"></a>
                	<a href="/providers/edit?providerId=<%= p.getProviderid()%>"><img src="/img/icon_edit.JPG" alt="Edit" width="20" height="20" title="Edit"></a>
            <form name="post_<%= p.getProviderid() %>" style="display:none;" method="get" action="/providers/delete"><input type="hidden" name="providerId" value="<%= p.getProviderid() %>"/></form>
            <a href="#" onclick="if (confirm(&quot;Are you sure you want to delete # <%= p.getProviderid() %>?&quot;)) { document.post_<%= p.getProviderid() %>.submit(); } event.returnValue = false; return false;"><img src="/img/icon_delete.JPG" alt="Delete" width="20" height="20" title="Delete"></a></div>

	</div>
<%}%>
</div>
</fieldset>
</body>
</html>