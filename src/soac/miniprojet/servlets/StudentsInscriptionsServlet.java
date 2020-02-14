package soac.miniprojet.servlets;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import soac.miniprojet.api.StudentsApi;
import soac.miniprojet.api.StudentsBiblioInscAPI;
import soac.miniprojet.model.beans.Employees;
import soac.miniprojet.model.beans.Students;
import soac.miniprojet.model.beans.StudentsBiblioInsc;

/**
 * Servlet implementation class StudentsInscriptionsServlet
 */


@WebServlet("/inscriptions")
public class StudentsInscriptionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentsInscriptionsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     HttpSession session = request.getSession();
	        if (session.getAttribute("user") != null) {
	            Employees user = (Employees)session.getAttribute("user");

	            request.setAttribute("user",user.getNom()+" "+user.getPrenom());
	            request.setAttribute("role",user.getRole());

	            LinkedList<StudentsBiblioInsc> students = new StudentsBiblioInscAPI().getAll();
	            request.setAttribute("inscriptions", students);
	            this.getServletContext().getRequestDispatcher("/WEB-INF/app_views/StudentsInscriptions.jsp").forward(request, response);

	        } else response.sendRedirect(request.getContextPath() + "/login");

	}

}
