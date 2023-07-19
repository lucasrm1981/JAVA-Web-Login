<!-- Verifica se o usuário está logado caso não esteja redireciona  -->
<%
if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
	response.sendRedirect("validar.jsp");//Redireciona para o validar.jsp
}
%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.crudjavaweb.dao.UsuarioDao"%>
<%@page import="com.crudjavaweb.bean.Usuario"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exibição de Usuários</title>
<link href="../css/styles.css" rel="stylesheet">

</head>
<body class="fonte">
	<!-- Exibindo o nome usuário logado na seção -->
	Saudações
	<b><%=session.getAttribute("nome")%></b>
	<br />
	<a href='logout.jsp'>Sair</a>
	<table>
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>E-mail</th>
			<th>Sexo</th>
			<th>País</th>
			<th>Salário</th>
			<th>Imagem</th>
			<th>Ações</th>
		</tr>

		<%
		try {
			UsuarioDao objUsuarioDao = new UsuarioDao();
			ArrayList<Usuario> list = objUsuarioDao.ListarUsuarios();

			for (int i = 0; i < list.size(); i++) {
		%>
		<tr>
			<td><%=list.get(i).getId()%></td>
			<td><%=list.get(i).getNome()%></td>
			<td><%=list.get(i).getEmail()%></td>
			<td><%=list.get(i).getSexo()%></td>
			<td><%=list.get(i).getPais()%></td>
			<td>
				<%
				/* Formatação para R$*/
				double salario = list.get(i).getSalario();
				DecimalFormat df = new DecimalFormat(",##0.00 ");
				String dff = df.format(salario);
				out.print("R$ " + dff);
				%>
			</td>
			<td class="centro">
				<%
				/* Caso não exista imagem Botão Inserir Imagem*/
				if (list.get(i).getImagem() == null) {
				%> <a href="../upload.jsp?id=<%=list.get(i).getId()%>"
				target="_blank" title="Sem Imagem Cadastrada">Inserir Imagem</a> <%
 } else {
 %> <img src="../img/<%=list.get(i).getImagem()%>" width="50"
				height="50"><br /> <a
				href="../upload.jsp?id=<%=list.get(i).getId()%>&imagem=<%=list.get(i).getImagem()%>"
				target="_blank" title="Atulizar Imagem">Atualizar Imagem</a> <%
 }
 %>

			</td>


			<td><a
				href="../model/frmUsuarioExcluir.jsp?id=<%=list.get(i).getId()%>&nome=<%=list.get(i).getNome()%>&imagem=<%=list.get(i).getImagem()%>">Excluir</a>|

				<a
				href="../model/frmUsuarioAtualizar.jsp?id=<%=list.get(i).getId()%>&nome=<%=list.get(i).getNome()%>&password=<%=list.get(i).getPassword()%>&email=<%=list.get(i).getEmail()%>&sexo=<%=list.get(i).getSexo()%>&pais=<%=list.get(i).getPais()%>&salario=<%=list.get(i).getSalario()%>">
					Alterar Informações</a>| <a
				href="../model/frmUsuarioAtualizarSenha.jsp?id=<%=list.get(i).getId()%>&nome=<%=list.get(i).getNome()%>">Alterar
					Senha</a></td>
		</tr>

		<%
		}

		} catch (Exception e) {
		out.print("Erro na Listagem dos Usuários");
		}
		%>

	</table>
	<center>
		<h3>
			<a href="../model/frmUsuarioCadastrar.jsp">Cadastrar Novo Usuário</a>
		</h3>
	</center>
	
	<footer>
        <!-- Rodapé-->
        <div class="rodape" id="rodape"> 

            <!-- Exibe a data atual-->
            <script src="../js/script.js"></script> - Criado por Lucas <a href="https://github.com/lucasrm1981/" target="_blank">Git Hub</a>
        </div>        
    </footer>
	
</body>
</html>