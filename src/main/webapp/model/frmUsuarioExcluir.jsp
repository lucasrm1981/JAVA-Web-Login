<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Exclusão de Usuário</title>

<link href="../css/styles.css" rel="stylesheet">
</head>
<body class="fonte">
	<form action="../control/excluirUsuario.jsp" method="post">
		<label>ID:</label> <input type="text" name="id"
			value="<%=request.getParameter("id")%>" readonly="true"> <label>Nome:</label>
		<input type="text" name="nome"
			value="<%=request.getParameter("nome")%>" readonly="true"> <input
			type="text" name="imagem" value="<%=request.getParameter("imagem")%>"
			readonly="true" hidden>


		<button type="submit">Excluir</button>
</body>
</html>