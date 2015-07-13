package packCordova;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import packBD.GestorBD;

/**
 * Servlet implementation class LogInApi
 */
@WebServlet("/api/LogInApi")
public class LogInApi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LogInApi() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user, passw;

		try{
			user = request.getParameter("usuario");
			passw = request.getParameter("contrasena");
		}
		catch (NullPointerException e){
			user = "";
			passw = "";
		}

		int id = 0;

		boolean registrado = false;
		String loggedID = String.valueOf(System.currentTimeMillis());

		JSONObject respuesta = new JSONObject();

		if (!user.equals("") && !passw.equals("")){
			id = GestorBD.getGestorBD().checkUser(user, passw);	
		}

		if (id != 0)
		{
			registrado = true;
			UsuariosLoggeados.getMyUsuariosLogeados().addUsuario(loggedID, id);
		}
		respuesta.put("loggedid",loggedID);
		respuesta.put("valido", registrado);

		System.out.println("pedido");
		response.setContentType("application/json");
		response.setHeader("Access-Control-Allow-Origin", "*");
		PrintWriter pw = response.getWriter();
		pw.write(respuesta.toString());

	}

}