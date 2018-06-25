<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.util.List"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Access vista</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="description" content="Access">
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

<% Access p = (Access)request.getAttribute("access"); %>
<ul class="navbar">
   <li><a href="/index.html">Back...</a></li>
  <li><a href="/access">List of access</a>
  <li><a href="/access/add">Add new</a></li>
<li><a href="/access/view?accessId=<%= p.getAccessId() %>">View</a></li>
  <li><a href="/access/edit?accessId=<%= p.getAccessId() %>">Update</a></li>
   <form name="post_<%= p.getAccessId() %>" style="display:none;" method="get" action="/access/delete"><input type="hidden" name="accessId" value="<%= p.getAccessId() %>"/></form>
    <li><a href="#" onclick="if (confirm(&quot;Are you sure you want to delete # <%= p.getAccessId() %>?&quot;)) { document.post_<%= p.getAccessId() %>.submit(); } event.returnValue = false; return false;">Delete</a></li>

</ul>


<div class="Table">
	<div class="Title"><p>Mostrando access Cod: <%= p.getId() %> </p></div>
	<div class="users view large-9 medium-8 columns content">

    <table class="vertical-table">
        <tr>
            <th scope="row">Código:</th>
            <td><%= p.getAccessId() %></td>
        </tr>
         <tr>
            <th scope="row">Role:</th>
            <td><%= p.getRoleIdName() %></td>
        </tr>
         <tr>
            <th scope="row">Resource:</th>
            <td><%= p.getResourceIdName() %></td>
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