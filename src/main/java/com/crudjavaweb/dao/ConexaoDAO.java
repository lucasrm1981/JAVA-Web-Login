package com.crudjavaweb.dao;

/* Importação do parametro para conexão*/
import java.sql.Connection;
import java.sql.DriverManager;

/* Classe de */ 
public class ConexaoDAO {

	public static java.sql.Connection getConnection() {
		Connection con = null;

		try {
			/* Tipo de Banco :// IP:Porta/Nome da Base de Dados */
			String dbURL = "jdbc:mysql://localhost:3306/usuario";
			/* Usuário do Banco com Permissão nessa Base */
			String dbUsername = "root";
			/* Senha do Usuário */
			String dbPassword = "";

			/* Chama do driver de conexão com o Banco de Dados */
			Class.forName("com.mysql.jdbc.Driver");
			/* Conexão do DriverManager com as informações do Banco de Dados */
			con = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

			/* Saída da Exceção caso haja algum erro no MySQL */
		} catch (Exception e) {
			System.out.print("\nFalha ao Conectar com o Banco! \n" + e);
		}
		/* Retorno da conexão para ser usada */
		return con;

	}
}
