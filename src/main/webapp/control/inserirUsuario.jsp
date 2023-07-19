<%@page import="com.crudjavaweb.dao.UsuarioDao"%>
<%@page import="com.crudjavaweb.bean.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Usuário</title>
</head>
<body>
	<%
	try {
		Usuario objUsuario = new Usuario();
		objUsuario.setNome(request.getParameter("nome"));
		objUsuario.setPassword(request.getParameter("password"));
		objUsuario.setEmail(request.getParameter("email"));
		objUsuario.setSexo(request.getParameter("sexo"));
		objUsuario.setPais(request.getParameter("pais"));
		objUsuario.setSalario(Double.parseDouble(request.getParameter("salario")));

		UsuarioDao objUsuarioDao = new UsuarioDao();
		objUsuarioDao.CadastrarUsuario(objUsuario);
		
		response.sendRedirect("../view/index.jsp");

	} catch (Exception e) {

	}
	%>

</body>
</html>