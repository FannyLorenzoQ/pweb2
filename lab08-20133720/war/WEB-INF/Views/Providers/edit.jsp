<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.entity.*" %>
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

<% 
Provider p = (Provider)request.getAttribute("proveedor");
List<Provider> providers = (List<Provider>) request.getAttribute("providers");

String aux="";
String aux2="";
String emailsExist="";
String numsExist="";
for( Provider t : providers ) {
	if(t.getProviderid().equals(p.getProviderid())) {
		aux=aux+"";
	}else{
		emailsExist=emailsExist+"(?!"+t.getEmail()+")";
		numsExist=numsExist+"(?!"+t.getCelular()+")";
		if(t.getDocIde().length()==8 )
			aux=aux+"(?!"+t.getDocIde()+")";
		else 
			aux2=aux2+"(?!"+t.getDocIde()+")";
	}
}
%>
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
	<div class="Title"><p>Editando al proveedor Nro: <%= p.getProviderid() %> </p></div>

<form action="/providers/edit" method="get">
<fieldset><legend>Registro de proveedores</legend>
<div id="formulario">
	<div class="fila">
	    <div class="etiqueta"><label for="docIde">Documento de identificación</label></div>
		<div class="control"><input type="text" name="docIde" maxlength="11" value="<%= p.getDocIde() %>" pattern="<%=aux %>[0-9]{8}|(<%=aux2 %>(10|20)[0-9]{9})" title="RUC(11 dígitos), DNI(8 dígitos), no duplicados" required/></div>
	</div>
	<div class="fila">
		<div class="etiqueta"><label for="name">Nombre/Razon Social :</label></div>
		<div class="control"><input type="text" name="name" maxlength="20" value="<%= p.getName() %>" pattern="[a-Z]{5-20}" title="Mínimo 5, Máximo 20 caracteres" required /></div>
	</div>
	<div class="fila">
		<div class="etiqueta"><label for="address">Dirección :</label></div>
		<div class="control"><input type="text" name="address" maxlength="40" value="<%= p.getAddress() %>" pattern="[a-Z]{5-20}" title="Mínimo 5, Máximo 20 caracteres" required/></div>
	</div>
	<div class="fila">
		<div class="etiqueta"><label for="celular">Celular :</label></div>
		<div class="control"><input type="text" name="celular" maxlength="12" value="<%= p.getCelular() %>" pattern="<%=numsExist %>[0-9]{6,9}" title="No duplicado, un número de contacto solo puede tener de 6(teléfono) a 9(celular) dígitos" required/></div>
	</div>
	
	<div class="fila">
		<div class="etiqueta"><label for="email">Correo :</label></div>
		<div class="control"><input type="email" name="email" maxlength="20" value="<%= p.getEmail() %>" pattern="<%=emailsExist %>^[^@]+@[^@]+\.[a-zA-Z]{2,}$" title="No podrá ingresar un correo ya registrado." required/></div>
	</div>
	<div class="fila">
		<div class="etiqueta"><label for="status">Estado :</label></div>
		<div class="control"><input type="radio" name="status" value="Activo" checked> Activo<br></div>
  		<div class="control"><input type="radio" name="status" value="No activo">No activo<br></div>
	</div>
	
	<input type="hidden" name="id" value="<%=p.getProviderid()%>"/>
	<div class="fila">
		<div id="action"><input type="reset" value="Regresar datos"/><input type="submit" value="Modificar"/></div>
	</div>
</div>
</fieldset>
</form>

</div>
</body>
</html>