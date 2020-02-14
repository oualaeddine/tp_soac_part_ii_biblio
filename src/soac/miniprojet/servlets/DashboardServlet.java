package soac.miniprojet.servlets;


import soac.miniprojet.api.InscriptionPeriodAPI;
import soac.miniprojet.api.StudentsBiblioInscAPI;
import soac.miniprojet.model.beans.Employees;
import soac.miniprojet.model.beans.InscriptionPeriod;
import soac.miniprojet.model.dao.daos.InscriptionPeriodDAO;
import soac.miniprojet.utils.ScholarYearHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class DashboardServlet
 */
@WebServlet({"/dashboard", "/Dashboard"})
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private InscriptionPeriodAPI periodApi;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardServlet() {
        super();
        periodApi = new InscriptionPeriodAPI();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            Employees user = (Employees) session.getAttribute("user");

            request.setAttribute("user", user.getNom() + " " + user.getPrenom());
            request.setAttribute("role", user.getRole());

            InscriptionPeriod period = new InscriptionPeriodDAO().GetLastPeriode();


            request.setAttribute("start_year", user.getRole());
            request.setAttribute("end_year", user.getRole());

            if (period != null) {
            	 request.setAttribute("start_period", new SimpleDateFormat("yyyy-MM-dd").format(period.getStartInscDate()));
                 request.setAttribute("end_period", new SimpleDateFormat("yyyy-MM-dd").format(period.getEndInscDate()));
                 request.setAttribute("period_id", period.getId());
            }
           

            this.getServletContext().getRequestDispatcher("/WEB-INF/app_views/Dashboard.jsp").forward(request, response);
        } else response.sendRedirect(request.getContextPath() + "/login");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            Employees user = (Employees) session.getAttribute("user");

            request.setAttribute("user", user.getNom() + " " + user.getPrenom());
            request.setAttribute("role", user.getRole());
            String debut = request.getParameter("start");
            String fin = request.getParameter("end");
            try {
                switch (request.getParameter("action")) {
                    case "add_periode": {
                        if (!ScholarYearHelper.isInscPeriodOpen()) {
                            InscriptionPeriod period = new InscriptionPeriod();
                            period.setStartInscDate(new SimpleDateFormat("yyyy-MM-dd").parse(debut));
                            period.setEndInscDate(new SimpleDateFormat("yyyy-MM-dd").parse(fin));
                            period.setYear( periodApi.getCurrentYear().getId());
                            periodApi.add(period);
                        }
                        break;
                    }
                    case "edit_periode": {
                        System.out.println("editing");
                        if (ScholarYearHelper.isInscPeriodOpen()) {
                            InscriptionPeriod period = new InscriptionPeriod();
                            String _id = request.getParameter("id");
                            int id = Integer.parseInt(_id);
                            period.setId(id);
                            period.setStartInscDate(new SimpleDateFormat("yyyy-MM-dd").parse(debut));
                            period.setEndInscDate(new SimpleDateFormat("yyyy-MM-dd").parse(fin));

                            periodApi.update(period);
                        }
                        break;
                    }
                    case "end_periode": {
                        if (ScholarYearHelper.isInscPeriodOpen()) {
                            String _id = request.getParameter("id");
                            int id = Integer.parseInt(_id);
                            InscriptionPeriod period = (InscriptionPeriod) periodApi.getById(id);
                            period.setEndInscDate(new Date());
                            periodApi.update(period);
                            System.out.println("deleted");
                        }
                        break;
                    }
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
            doGet(request, response);

        } else response.sendRedirect(request.getContextPath() + "/login");

    }

}
