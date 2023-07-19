<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastrar Usuário</title>
</head>
<body>
	<form action="../control/inserirUsuario.jsp" method="post">

		<label>Nome:</label> <input type="text" name="nome"> <label>Senha:</label>
		<input type="text" name="password"> <label>E-mail:</label> <input
			type="email" name="email"> <label>Sexo:</label> <select
			name="sexo">
			<option value="M" selected>Mulher</option>
			<option value="H">Homen</option>
		</select> <label>País:</label> <input type="text" name="pais"> <label>Salário:</label>
		<input type="text" name="salario">

		<button type="submit">Cadastrar</button>

	</form>
</body>
</html>