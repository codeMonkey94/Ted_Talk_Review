package tedtalk.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tedtalkDB.Controller.NetworkAdminController;
import tedtalkDB.model.Student;

public class createstudentservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("Create Student Servlet: doGet");	
		// call JSP to generate empty form
		req.getRequestDispatcher("/_view/createStudent.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("Create Student Servlet: doPost");
		
		NetworkAdminController NAController = new NetworkAdminController();
		Student handle = new Student();

		NAController.addStudents(handle.getUserName(), handle.getPassword(), handle.getEmail(), handle.getSection(), handle.getMajor());
		
		req.setAttribute("studHandle", handle);//CREATING AN ATTRIB TO USE IN JSP
		
		// now call the JSP to render the new page
		req.getRequestDispatcher("/_view/createStudent.jsp").forward(req, resp);
	}
	
}
