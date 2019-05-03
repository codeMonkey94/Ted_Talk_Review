package tedtalk.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tedtalkDB.model.Account;
import tedtalkDB.persist.DerbyDatabase;

public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String username = null;
	private DerbyDatabase derby;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("Login Servlet: doGet");	
		username = (String) req.getSession().getAttribute("username");
		// call JSP to generate empty form
		if(username != null) {
			req.getSession().setAttribute("username", null);
			resp.sendRedirect(req.getContextPath() + "/login");
		}
		else {
			req.getRequestDispatcher("/_view/login.jsp").forward(req, resp);
		}
		// call JSP to generate empty form
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("Login Servlet: doPost");
		
		//ProfileModel model = new ProfileModel();
		//ProfileController controller = new ProfileController();
		//controller.setModel(model);

		// set "game" attribute to the model reference
		// the JSP will reference the model elements through "game"	
		String user = req.getParameter("u");
		String pass = req.getParameter("p");

		//model.setUser(user);
		//model.setPass(pass);
		derby = new DerbyDatabase();	//used derby instead of controller
		//Question for the future how do we decide which controller to use if we don't know if they actually have an account yet
		
		if(derby.checkCredentials(user, pass)) {	//replaced controller methods with derby methods
			Account login = derby.setLogin(user);
			HttpSession session = req.getSession(true);
			session.setAttribute("username", login.getUserName());
			session.setAttribute("email", login.getEmail());
			session.setAttribute("profID", login.getprofID());
			session.setAttribute("section", "Section");	//need to change this depending if they are student/admin/ or professor
			
			System.out.println("Login Servlet: Login Successful");
			resp.sendRedirect(req.getContextPath() + "/home");
		}
		
		else{
			req.setAttribute("response", "Incorrect Username or Password");
			System.out.println("Login Servlet: Login Failed");				
			req.getRequestDispatcher("/_view/login.jsp").forward(req, resp);
			}
		// now call the JSP to render the new page	
	}
}
