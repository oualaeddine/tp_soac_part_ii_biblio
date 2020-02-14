package soac.miniprojet.servlets;

import soac.miniprojet.api.EmployeesApi;
import soac.miniprojet.model.beans.Employees;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class AuthServlet
 */
@WebServlet("/login")
public class AuthServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthServlet() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            if (request.getAttribute("error") == null)
                request.setAttribute("error", false);

            if (!(boolean) request.getAttribute("error"))
                request.setAttribute("error", false);

            this.getServletContext().getRequestDispatcher("/WEB-INF/app_views/Login.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/dashboard");
        }

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EmployeesApi employeeApi = new EmployeesApi();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        

        System.out.println(username + " " + password);

        boolean isAuth = employeeApi.login(username, password);

        if (isAuth) {
            HttpSession session = request.getSession();
            Employees employee = employeeApi.getByUsername(username);
            session.setAttribute("user", employee);
            response.sendRedirect(request.getContextPath() + "/dashboard");
        } else {
            request.setAttribute("error", true);
            doGet(request, response);
        }
    }



}
