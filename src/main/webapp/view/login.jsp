<%@ page import="java.sql.*"%>
<%@ page import="com.crudjavaweb.dao.ConexaoDAO"%>

<%
 String email = request.getParameter("email"); /*Recebimento do email */
 
 String password = request.getParameter("password"); /*Recebimento do senha */
 
 Connection con = ConexaoDAO.getConnection();
 Statement st = con.createStatement(); 
 ResultSet rs; 
 /* Query que verifica se o usu�rio e senha s�o corretas */
 rs = st.executeQuery("SELECT * FROM usuario WHERE email='" + email + "' and password=sha1('" + password + "')");
 /* Caso tenha uma verifica��o correta */
	if (rs.next()) 
		{ 
		/* Cria os Elementos da Se��o*/
			session.setAttribute("email", email); 
			session.setAttribute("nome", rs.getString("nome")); 
			/* Redireciona para p�gina index */
			response.sendRedirect("index.jsp");
		} 
	else 
		{ 
		/* Caso login seja incorreto*/
			out.println("E-mail ou Senha Inv�lidos <a href='index.jsp'>Tente Novamente</a>"); 
} 
%>
