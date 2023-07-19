<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Página de Login do Usuário</title>

<link href="../css/styles.css" rel="stylesheet">
</head>


<body class="fonte" bgcolor="#aaaaaa">

	<form method="post" action="login.jsp">
		<center>
			<table border="0" width="30%" cellpadding="3">
				<thead>
					<tr>
						<th colspan="2">Login do Usuário</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>E-mail</td>
						<td><input type="email" name="email" value="" /></td>
					</tr>
					<tr>
						<td>Senha</td>
						<td><input type="password" name="password" value="" /></td>
					</tr>
					<tr>
						<td><input type="submit" value="Login" /></td>
						<td><input type="reset" value="Limpar" /></td>
					</tr>
					<tr>
						<td colspan="2">Novo Usuário <a
							href="../model/frmUsuarioCadastrar.jsp">Registrar</a></td>
					</tr>
				</tbody>
			</table>
		</center>
	</form>
</body>