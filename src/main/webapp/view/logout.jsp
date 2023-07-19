
<%
/* Limpando Informações da Seção */
session.setAttribute("email", null);
session.invalidate();

/* Redirecionando para o formulário de login*/
response.sendRedirect("frmLogin.jsp");
%>
