<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.util.List"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Proveedor vista</title>
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

<% Provider p = (Provider)request.getAttribute("proveedor"); %>
<ul class="navbar">
   <li><a href="/index.html">Back...</a></li>
  <li><a href="/providers">List of providers</a>
  <li><a href="/providers/add">Add new</a></li>
<li><a href="/providers/view?providerId=<%= p.getProviderid() %>">View</a></li>
  <li><a href="/providers/edit?providerId=<%= p.getProviderid() %>">Update</a></li>
   <form name="post_<%= p.getProviderid() %>" style="display:none;" method="get" action="/providers/delete"><input type="hidden" name="providerId" value="<%= p.getProviderid() %>"/></form>
    <li><a href="#" onclick="if (confirm(&quot;Are you sure you want to delete # <%= p.getProviderid() %>?&quot;)) { document.post_<%= p.getProviderid() %>.submit(); } event.returnValue = false; return false;">Delete</a></li>

</ul>


<div class="Table">
	<div class="Title"><p>Mostrando al proveedor Nro: <%= p.getId() %> </p></div>
	<div class="users view large-9 medium-8 columns content">

    <table class="vertical-table">
        <tr>
            <th scope="row">Código:</th>
            <td><%= p.getProviderid() %></td>
        </tr>
        <tr>
            <th scope="row">Fecha de registro:</th>
            <td><%= p.getFechaFormatted() %></td>
        </tr>
        <tr>
            <th scope="row">RUC/DNI:</th>
            <td><%= p.getDocIde() %></td>
        </tr>
        <tr>
            <th scope="row">Nombre/Razón Social:</th>
            <td><%= p.getName() %></td>
        </tr>
        <tr>
            <th scope="row">Dirección:</th>
            <td><%= p.getAddress() %></td>
        </tr>
        <tr>
            <th scope="row">Nro de contacto:</th>
            <td><%= p.getCelular() %></td>
        </tr>
        <tr>
            <th scope="row">Correo electrónico:</th>
            <td><%= p.getEmail() %></td>
        </tr>
        <tr>
            <th scope="row">Status:</th>
            <td><%= p.getStatusMostrar() %></td>
        </tr>
    </table>
</div>


</div>
</body>
</html>