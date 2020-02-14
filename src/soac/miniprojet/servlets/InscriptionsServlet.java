package soac.miniprojet.servlets;


import soac.miniprojet.api.StudentsApi;
import soac.miniprojet.model.beans.Employees;
import soac.miniprojet.model.beans.Students;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;

/**
 * Servlet implementation class InscriptionsServlet
 */
@WebServlet("/inscription")
public class InscriptionsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public InscriptionsServlet() {
        super();
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

            LinkedList<Students> students = new StudentsApi().getNonInscrisForCurrentYear();
            request.setAttribute("students", students);
            this.getServletContext().getRequestDispatcher("/WEB-INF/app_views/new_inscription.jsp").forward(request, response);

        } else response.sendRedirect(request.getContextPath() + "/login");

    }


    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            Employees user = (Employees)session.getAttribute("user");

            request.setAttribute("user",user.getNom()+" "+user.getPrenom());
            request.setAttribute("role",user.getRole());

            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String date_naiss = request.getParameter("date_naiss");
            String sexe = request.getParameter("sexe");
            String num_bac = request.getParameter("num_bac");
            Students s = new Students();

            s.setNom(nom);
            s.setPrenom(prenom);
            try {
				s.setDateNaiss(new SimpleDateFormat("yyyy-MM-dd").parse(date_naiss));
			} catch (ParseException e) {
				e.printStackTrace();
			}
            s.setSexe(sexe);
            s.setNumBac(num_bac);

            StudentsApi api = new StudentsApi();
            api.add(s);

            response.sendRedirect(request.getContextPath() + "/students");

        } else response.sendRedirect(request.getContextPath() + "/login");



    }
}
