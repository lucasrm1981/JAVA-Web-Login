<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Página Atualizar Senha</title>
</head>
<body>
	<form action="../control/atualizarUsuarioSenha.jsp" method="post">

		<label>ID:</label> <input name="id"
			value="<%=request.getParameter("id")%>" readonly="true"> <label>Digite
			sua Nova Senha:</label> <input type="password" name="password"
			placeholder="Nova Senha"
			value="<%=request.getParameter("password")%>">



		<button type="submit">Atualizar</button>

	</form>
</body>
</html>