<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.entity.*" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Usuario vista</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="description" content="Editing users">
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
<% 
User p = (User)request.getAttribute("user");
List<User> users = (List<User>) request.getAttribute("users");
List<Role> roles=(List<Role>) request.getAttribute("roles");
String [] mes={"Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Setiembre","Octubre","Noviembre","Diciembre"};
String [] dia={"01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"};

String años="", meses="", dias=""; // Años 
String emailsExist="", rolesExist="";
for( User t : users ) {
	if(t.getUserId().equals(p.getUserId())) {
		String aux="";
	}else{
		emailsExist=emailsExist+"(?!"+t.getEmail()+")";
	}
}
for( Role r : roles ) {
	if(p.getRoleIdName().equalsIgnoreCase(r.getName()))
		rolesExist=rolesExist+"<option value=\""+r.getRoleId()+"\" selected=\"selected\">"+r.getName()+"</option>";
	else
	rolesExist=rolesExist+"<option value=\""+r.getRoleId()+"\">"+r.getName()+"</option>";
}
String date=p.getBirthFormatted();
String a="",m="",d=""; // 02/04/2018
a=date.substring(6);
m=date.substring(3, 5);
d=date.substring(0, 2);

for(int i=1970; i<2018;i++)

	if(a.equalsIgnoreCase(""+i))
		años="<option value=\""+i+"\" selected=\"selected\">"+i+"</option>"+años;
	else
		años="<option value=\""+i+"\">"+i+"</option>"+años;

for(int j=1; j<=12;j++) {
	if(dia[j-1].equals(m))
		meses="<option value=\""+dia[j-1]+"\" selected=\"selected\">"+mes[j-1]+"</option>"+meses;
	else
	meses="<option value=\""+dia[j-1]+"\">"+mes[j-1]+"</option>"+meses;
}
for(int j=1; j<=12;j++){
	if(d.equals(dia[j-1]))
		dias="<option value=\""+dia[j-1]+"\" selected=\"selected\">"+dia[j-1]+"</option>"+dias;
	else
	dias="<option value=\""+dia[j-1]+"\">"+dia[j-1]+"</option>"+dias;
}
	
%>
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
	<div class="Title"><p>Editando al usuario de cód: <%= p.getUserId() %> </p></div>

<form action="/users/edit" method="get">
<fieldset><legend>Editar usuario </legend>
<div id="formulario">
	<div class="input date required">
        <div class="etiqueta"><label for="text">Rol :</label></div>
        <select name="role" required="required">
        <%=rolesExist %>
        </select>
        
	<div class="fila">
		<div class="etiqueta"><label for="email">Correo :</label></div>
		<div class="control"><input type="email" name="email" value="<%=p.getEmail() %>" pattern="<%=emailsExist %>^[^@]+@[^@]+\.[a-zA-Z]{2,}$" title="No podrá ingresar un correo ya registrado."  required/></div>
	</div>
	
	<div class="fila">
        <div class="etiqueta"><label for="text">Fecha de nacimiento :</label></div>
        <select name="birth[year]" required="required"><%=años %></select>
        <select name="birth[month]" required="required"><%=meses %></select>
        <select name="birth[day]" requ+ired="required"><%=dias %></select>
        </div>
        
	<div class="fila">
		<div class="etiqueta"><label for="gender">Género :</label></div>
		<div class="control"><input type="radio" name="gender" value="Femenino" checked> Femenino<br></div>
  		<div class="control"><input type="radio" name="gender" value="Masculino">Masculino<br>
	</div>
	<div class="fila">
		<div class="etiqueta"><label for="status">Estado :</label></div>
		<div class="control"><input type="radio" name="status" value="Activo" checked> Activo<br></div>
  		<div class="control"><input type="radio" name="status" value="No activo">No activo<br>
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