<!-- Faz a Validação e caso não esteja correta Redireciona  -->
<%
if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
%>
<center>
	<h1>
		Sem Permissão<br /> <a href="frmLogin.jsp">Clique aqui para Entrar</a>
	</h1>
</center>

<%} %>
