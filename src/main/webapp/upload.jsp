<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload de Imagem</title>

<link href="../css/styles.css" rel="stylesheet">
</head>
<body class="fonte">
	<!-- Envia as informações através do metodo POST e o arquivo pelo  enctype="multipart/form-data"-->
	<form method="post" action="fileuploadservlet"
		enctype="multipart/form-data">
		<!-- Passagem do ID do usuário para associar a imagem-->
		<input name="id" value="<%=request.getParameter("id")%>">

		<!--  Passagem do arquivo -->
		<input type="file" name="file" /> <input type="submit" value="Upload" />
	</form>
</body>
</html>