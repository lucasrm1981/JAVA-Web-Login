<!-- Faz a Valida��o e caso n�o esteja correta Redireciona  -->
<%
if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
%>
<center>
	<h1>
		Sem Permiss�o<br /> <a href="frmLogin.jsp">Clique aqui para Entrar</a>
	</h1>
</center>

<%} %>
