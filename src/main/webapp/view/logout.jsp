
<%
/* Limpando Informa��es da Se��o */
session.setAttribute("email", null);
session.invalidate();

/* Redirecionando para o formul�rio de login*/
response.sendRedirect("frmLogin.jsp");
%>
