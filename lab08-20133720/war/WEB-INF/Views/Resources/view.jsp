<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.util.List"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>resource vista</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="description" content="Resources">
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

<% Resource p = (Resource)request.getAttribute("resource"); %>
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
	<div class="Title"><p>Mostrando el recurso de Cód: <%= p.getId() %> </p></div>
	<div class="users view large-9 medium-8 columns content">

    <table class="vertical-table">
        <tr>
            <th scope="row">Código:</th>
            <td><%= p.getResourceId() %></td>
        </tr>
         <tr>
            <th scope="row">Nombre:</th>
            <td><%= p.getName() %></td>
        </tr>
        <tr>
            <th scope="row">Estatus:</th>
            <td><%= p.getStatusMostrar() %></td>
        </tr>
        <tr>
            <th scope="row">Fecha de registro:</th>
            <td><%= p.getCreatedFormatted() %></td>
        </tr>
    </table>
</div>


</div>
</body>
</html>