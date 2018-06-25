<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.util.List"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Role vista</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="description" content="Role">
<meta name="keywords" content="role">
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

<% Role p = (Role)request.getAttribute("role"); %>
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
	<div class="Title"><p>Mostrando el role de Cód: <%= p.getId() %> </p></div>
	<div class="users view large-9 medium-8 columns content">

    <table class="vertical-table">
        <tr>
            <th scope="row">Código:</th>
            <td><%= p.getRoleId() %></td>
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