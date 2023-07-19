package fileuploadservlet;

/* IMPORTAÇÕES PARA FUNCIONAMENTO DO HTTP SERVELET*/
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

/* Criptografia*/
import java.math.BigInteger;
import java.security.MessageDigest;

/*  Conversão da data*/
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/* Banco de Dados */
import com.crudjavaweb.dao.UsuarioDao;
import com.crudjavaweb.bean.Usuario;

/* The Java file upload Servlet example */
/* Classe que chamará o arquivo name e passagem do arquivo pelo servlet que está no FORM urlPatterns*/
@WebServlet(name = "FileUploadServlet", urlPatterns = { "/fileuploadservlet" })
/* Parametros de configuração do arquivo */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		maxFileSize = 1024 * 1024 * 10, // 10 MB
		maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class FileUploadServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			/* Recebimento do arquivo pelo form */
			Part filePart = request.getPart("file");

			String fileName = filePart.getSubmittedFileName();/* Nome do Arquivo */

			/* Data para nome unico */
			Date dataAtual = new Date();
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			String dataFormatada = dateFormat.format(dataAtual);

			/* Geracao do nome em MD5 com extenção .jpg */
			String md5Name = getMD5(dataFormatada);
			String newName = md5Name + ".jpg";

			/* Parte do Banco de Dados */
			Usuario objUsuario = new Usuario();
			objUsuario.setId(Integer.parseInt(request.getParameter("id")));
			objUsuario.setImagem(newName);

			UsuarioDao objUsuarioDao = new UsuarioDao();
			objUsuarioDao.AtualizarUsuarioImagem(objUsuario);

			/* Movimentação do Arquivo com novo nome gerado */
			for (Part part : request.getParts()) {
				/* Caminho fisico onde será salvo o arquivo */
				part.write("C:\\Users\\lucas.monteiro\\eclipse-workspace\\javaweblogin\\src\\main\\webapp\\img\\"
						+ newName);
			}
			// response.getWriter().print("Arquivo salvo com Sucesso.");/* Resposta depois
			// do envio*/
			response.sendRedirect("view/index.jsp");
		} catch (Exception e) {
			response.getWriter().print("<script>alert('Erro ao Salvar!');</script>");
			response.getWriter().print("<a href='upload.html'>VOLTAR</a>");
		}
	}

	/* Função geradora do hash em MD5 */
	public static String getMD5(String input) {

		String toReturn = null;
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			digest.reset();
			digest.update(input.getBytes("utf8"));
			toReturn = String.format("%032x", new BigInteger(1, digest.digest()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return toReturn;
	}
}
