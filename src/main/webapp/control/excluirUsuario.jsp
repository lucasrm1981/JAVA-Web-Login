<%@page import="com.crudjavaweb.dao.UsuarioDao"%>
<%@page import="com.crudjavaweb.bean.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
try{
	Usuario objUsuario = new Usuario();
	objUsuario.setId(Integer.parseInt(request.getParameter("id")));
	objUsuario.setImagem(request.getParameter("imagem"));
	
	UsuarioDao objUsuarioDao = new UsuarioDao();
	objUsuarioDao.ExcluirUsuario(objUsuario);
	
	response.sendRedirect("../view/index.jsp");
	
}catch(Exception e){
	
}
%>

</body>
</html>