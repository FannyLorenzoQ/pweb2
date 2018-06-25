<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.util.List"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>user vista</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="description" content="User">
<meta name="keywords" content="users">
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
<% User p = (User)request.getAttribute("user"); %>
<ul class="navbar">
   <li><a href="/index.html">Back...</a></li>
  <li><a href="/users">List of users</a>
  <li><a href="/users/add">Add new</a></li>
<li><a href="/users/view?userId=<%= p.getUserId() %>">View</a></li>
  <li><a href="/users/edit?userId=<%= p.getUserId() %>">Update</a></li>
   <form name="post_<%= p.getUserId() %>" style="display:none;" method="get" action="/users/delete"><input type="hidden" name="userId" value="<%= p.getUserId() %>"/></form>
    <li><a href="#" onclick="if (confirm(&quot;Are you sure you want to delete # <%= p.getUserId() %>?&quot;)) { document.post_<%= p.getUserId() %>.submit(); } event.returnValue = false; return false;">Delete</a></li>

</ul>


<div class="Table">
	<div class="Title"><p>Mostrando al user Cód: <%= p.getId() %> </p></div>
	<div class="users view large-9 medium-8 columns content">

    <table class="vertical-table">
        <tr>
            <th scope="row">Código:</th>
            <td><%= p.getUserId() %></td>
        </tr>
        <tr>
            <th scope="row">Correo electrónico:</th>
            <td><%= p.getEmail() %></td>
        </tr>
       
        <tr>
            <th scope="row">Rol:</th>
            <td><%= p.getRoleIdName() %></td>
        </tr>
        <tr>
            <th scope="row">Cumpleaños:</th>
            <td><%= p.getBirthFormatted() %></td>
        </tr>
        <tr>
            <th scope="row">Género:</th>
            <td><%= p.getGenderMostrar() %></td>
        </tr>
        
        <tr>
            <th scope="row">Status:</th>
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