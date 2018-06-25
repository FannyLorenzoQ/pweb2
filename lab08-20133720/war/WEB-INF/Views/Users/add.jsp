<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Ingresar usuario</title>
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
  <li><a href="/users">List of users</a>
</ul>

<% List<User> users = (List<User>) request.getAttribute("users");
List <Role> roles=(List<Role>) request.getAttribute("roles");
String aux="";
String emailsExist="", rolesExist="";
for( User p : users ) {
	emailsExist=emailsExist+"(?!"+p.getEmail()+")";
}

for( Role r : roles ) {
	rolesExist=rolesExist+"<option value=\""+r.getRoleId()+"\">"+r.getName()+"</option>";
}

for(int i=1970; i<2018;i++)
	aux="<option value=\""+i+"\">"+i+"</option>"+aux;
	
%>
<form action="/users/add" method="get">

<fieldset><legend>Registro de Usuarios</legend>
<div id="formulario">

	<div class="input date required">
        <div class="etiqueta"><label for="text">Rol :</label></div>
        <select name="role" required="required">
        <%=rolesExist %>
        </select>
        
	<div class="fila">
		<div class="etiqueta"><label for="email">Correo :</label></div>
		<div class="control"><input type="email" name="email" value="trns@gmail.com" pattern="<%=emailsExist %>^[^@]+@[^@]+\.[a-zA-Z]{2,}$" title="No podrá ingresar un correo ya registrado."  required/></div>
	</div>
	
	<div class="fila">
        <div class="etiqueta"><label for="text">Fecha de nacimiento :</label></div>
        <select name="birth[year]" required="required">
        <option value="2018" selected="selected">2018</option><%=aux %>
        </select>
        <select name="birth[month]" required="required">
        <option value="01">January</option><option value="02">February</option><option value="03">March</option><option value="04">April</option><option value="05" selected="selected">May</option><option value="06">June</option><option value="07">July</option><option value="08">August</option><option value="09">September</option><option value="10">October</option><option value="11">November</option><option value="12">December</option>
        </select>
        <select name="birth[day]" required="required">
        <option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option><option value="05">5</option><option value="06">6</option><option value="07">7</option><option value="08">8</option><option value="09">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17" selected="selected">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
        </select>
        </div>
        
	<div class="fila">
		<div class="etiqueta"><label for="gender">Genero :</label></div>
		<div class="control"><input type="radio" name="gender" value="true" checked> Femenino<br></div>
  		<div class="control"><input type="radio" name="gender" value="false">Masculino<br></div>
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