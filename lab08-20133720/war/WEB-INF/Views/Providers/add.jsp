<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Ingresar Personas</title>
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
  <li><a href="/providers">List of providers</a>
</ul>

<% List<Provider> providers = (List<Provider>) request.getAttribute("providers");%>
<%
String aux="";
String aux2="";
String emailsExist="";
String numsExist="";
for( Provider p : providers ) {
	emailsExist=emailsExist+"(?!"+p.getEmail()+")";
	numsExist=numsExist+"(?!"+p.getCelular()+")";
	if(p.getDocIde().length()==8)
		aux=aux+"(?!"+p.getDocIde()+")";
	
	else
		aux2=aux2+"(?!"+p.getDocIde()+")";
}
%>
<form action="/providers/add" method="get">

<fieldset><legend>Registro de proveedores</legend>
<div id="formulario">
<div class="fila">
		<div class="etiqueta"><label for="codIde">Documento de identificación</label></div>
		<div class="control"><input type="text" name="docIde" value="20121212121" pattern="<%=aux %>[0-9]{8}|(<%=aux2 %>(10|20)[0-9]{9})" title="No duplicados, RUC(11 dígitos), DNI(8 dígitos)." required/></div>
		</div>
<div class="fila">

		<div class="etiqueta"><label for="name">Nombre/Razon Social :</label></div>
		<div class="control"><input type="text" name="name" value="Los transportistas SA" pattern="[a-Z]{5-20}" title="Mínimo 5, Máximo 20 caracteres" required /></div>
	</div>
	<div class="fila">
		<div class="etiqueta"><label for="address">Dirección :</label></div>
		<div class="control"><input type="text" name="address"   value="Los surcos 234 - Mollendo" pattern="[a-Z]{5-20}" title="Mínimo 5, Máximo 40 caracteres" required/></div>
	</div>
	<div class="fila">
		<div class="etiqueta"><label for="celular">Celular :</label></div>
		<div class="control"><input type="text" name="celular" value="994585785" pattern="<%=numsExist %>[0-9]{6,9}" title="No duplicado, un número de contacto solo puede tener de 6(teléfono) a 9(celular) dígitos" required/></div>
	</div>
	
	<div class="fila">
		<div class="etiqueta"><label for="email">Correo :</label></div>
		<div class="control"><input type="email" name="email" value="trns@gmail.com" pattern="<%=emailsExist %>^[^@]+@[^@]+\.[a-zA-Z]{2,}$" title="No podrá ingresar un correo ya registrado."  required/></div>
	</div>
	<div class="fila">
		<div class="etiqueta"><label for="status">Estado :</label></div>
		<div class="control"><input type="radio" name="status" value="Activo" checked> Activo<br></div>
  		<div class="control"><input type="radio" name="status" value="No activo">No activo<br></div>
		
		
	</div>
	
	<input type="hidden" name="aux" value="<%=aux2+aux %>"/>
	<div class="fila">
		<div id="action"><input type="reset" value="Limpiar"/><input type="submit" value="Guardar"/></div>
	</div>
</div>
</fieldset>
</form>

</body>
</html>