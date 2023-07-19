package com.crudjavaweb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/* Deletar Arquivo*/
import java.io.File;

import com.crudjavaweb.bean.Usuario;

public class UsuarioDao {
	Connection con;
	PreparedStatement ps;

	/* Cadastro do Usuário */
	public void CadastrarUsuario(Usuario objUsuario) throws ClassCastException {
		/* Query de Inserção das informações */
		String sql = "INSERT INTO usuario(nome,password,email,sexo,pais,salario) VALUES(?,sha1(?),?,?,?,?)";
		/* Novo Objeto de Conexão*/
		new ConexaoDAO();
		/* Recebimento da Nova Conexão */
		con = ConexaoDAO.getConnection();
		/* Método de funcionamento normal */
		try {
/* Cria a conexão com o banco para execução da query*/
			ps = con.prepareStatement(sql);

			/* passagem dos elementos do objeto para a query na ordem do ? */
			ps.setString(1, objUsuario.getNome());
			ps.setString(2, objUsuario.getPassword());
			ps.setString(3, objUsuario.getEmail());
			ps.setString(4, objUsuario.getSexo());
			ps.setString(5, objUsuario.getPais());
			ps.setDouble(6, objUsuario.getSalario());

			/* Executa a Query*/
			ps.execute();
			
			/* Fecha a Conexão*/
			ps.close();

			/* Caso ocorra algum erro chama a excecão do SQL*/
		} catch (SQLException e) {
			System.out.println("Erro ao Cadastrar!\n" + e);
		}
	}

	/* Listando os usuários através de um ArrayList com o conteúdo do objeto */
	public ArrayList<Usuario> ListarUsuarios() {
		/* Cria uma conexão*/
		Connection con;
		/* Cria um PreparedStatement*/
		PreparedStatement ps;
		/* Cria um ResultSet*/
		ResultSet rs;
		/* Cria um novo ArrayList com o conteúdo do Objeto usuário */
		ArrayList<Usuario> list = new ArrayList<>();

		try {
			/* Query de seleção de todos os usuários*/
			String sql = "SELECT * FROM usuario";

			con = ConexaoDAO.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery(sql);

			/* Enquanto existir um registro será exibido*/
			while (rs.next()) {
				/* CRia o objeto*/
				Usuario usuario = new Usuario();

				/* Gera os Objetos na Lista*/
				usuario.setId(rs.getInt(1));
				usuario.setNome(rs.getString(2));
				usuario.setEmail(rs.getString(4));
				usuario.setSexo(rs.getString(5));
				usuario.setPais(rs.getString(6));
				usuario.setSalario(rs.getDouble(7));
				usuario.setImagem(rs.getString(8));

				/* Adiciona o próximo objeto gerado comn as novas informações */
				list.add(usuario);
			}

		} catch (SQLException e) {
			System.out.println("\n Erro ao exibir Dados! \n" + e);
		}
		return list;

	}

	/* Atualizar usuário */
	public void AtualizarUsuario(Usuario objUsuario) throws ClassCastException {
		String sql = "UPDATE usuario SET nome=?, email=?, sexo=?, pais=?, salario=? WHERE id=?";
		new ConexaoDAO();
		con = ConexaoDAO.getConnection();
		try {

			ps = con.prepareStatement(sql);

			ps.setString(1, objUsuario.getNome());
			ps.setString(2, objUsuario.getEmail());
			ps.setString(3, objUsuario.getSexo());
			ps.setString(4, objUsuario.getPais());
			ps.setDouble(5, objUsuario.getSalario());

			ps.setInt(6, objUsuario.getId());

			ps.execute();
			ps.close();

		} catch (SQLException e) {
			System.out.println("Erro ao Cadastrar!\n" + e);
		}
	}

	/* Atualizar Imagem do usuário */
	public void AtualizarUsuarioImagem(Usuario objUsuario) throws ClassCastException {
		String sql = "UPDATE usuario SET imagem=? WHERE id=?";
		new ConexaoDAO();
		con = ConexaoDAO.getConnection();
		try {

			ps = con.prepareStatement(sql);

			ps.setString(1, objUsuario.getImagem());

			ps.setInt(2, objUsuario.getId());

			ps.execute();
			ps.close();

			/* Deletando a imagem Antiga do usuário */
			File file = new File("C:\\Users\\lucas.monteiro\\eclipse-workspace\\javaweblogin\\src\\main\\webapp\\img\\"
					+ objUsuario.getImagem());
			file.delete();

		} catch (SQLException e) {
			System.out.println("Erro ao Atualizar!\n" + e);
		}
	}

	/* Excluir Usuário */
	public void ExcluirUsuario(Usuario objUsuario) throws ClassCastException {
		String sql = "DELETE FROM usuario WHERE id=?";
		new ConexaoDAO();
		con = ConexaoDAO.getConnection();
		try {

			ps = con.prepareStatement(sql);

			ps.setInt(1, objUsuario.getId());

			ps.execute();
			ps.close();

			/* Deletando a imagem do usuário */
			File file = new File("C:\\Users\\lucas.monteiro\\eclipse-workspace\\javaweblogin\\src\\main\\webapp\\img\\"
					+ objUsuario.getImagem());
			file.delete();

		} catch (SQLException e) {
			System.out.println("Erro ao Excluir!\n " + e);
		}
	}

	/* Atualizar Senhha do Usuário */
	public void AtualizarUsuarioSenha(Usuario objUsuario) throws ClassCastException {
		String sql = "UPDATE usuario SET password=sha1(?) WHERE id=?";
		new ConexaoDAO();
		con = ConexaoDAO.getConnection();
		try {

			ps = con.prepareStatement(sql);

			ps.setString(1, objUsuario.getPassword());

			ps.setInt(2, objUsuario.getId());

			ps.execute();
			ps.close();

		} catch (SQLException e) {
			System.out.println("Erro ao Atualizar Senha!\n" + e);
		}
	}

}
