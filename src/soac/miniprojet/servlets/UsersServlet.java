package soac.miniprojet.servlets;



import soac.miniprojet.api.EmployeesApi;
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
import java.util.Date;
import java.util.LinkedList;

/**
 * Servlet implementation class UsersServlet
 */
@WebServlet("/users")
public class UsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersServlet() {
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

			LinkedList<Employees> users = new EmployeesApi().getAll();
			request.setAttribute("users",users);
			this.getServletContext().getRequestDispatcher("/WEB-INF/app_views/Users.jsp").forward(request, response);

		} else response.sendRedirect(request.getContextPath() + "/login");


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		if (session.getAttribute("user") != null) {
			Employees user = (Employees)session.getAttribute("user");

			req.setAttribute("user",user.getNom()+" "+user.getPrenom());
			req.setAttribute("role",user.getRole());


            String action = req.getParameter("action");
            switch(action) {
            
            case "add":{
            	
            	 String nom = req.getParameter("nom");
                 String prenom = req.getParameter("prenom");
                 String username = req.getParameter("username");
                 String password = req.getParameter("password");
                 String role = req.getParameter("role");


                 Employees s = new Employees();

                 s.setNom(nom);
                 s.setPrenom(prenom);
                 s.setUsername(username);
                 s.setPassword(password);
                 s.setRole(role);
                 
                

                 EmployeesApi api = new EmployeesApi();
                 api.add(s);

     			
     			doGet(req,resp);
            	
            	
            	break;}
            
            case "edit":{
            
            	String id = req.getParameter("id");
    			
    			
    			Employees s = (Employees) new EmployeesApi().getById(Integer.parseInt(id));
    			
    			
    			 String nom = req.getParameter("nom");
    	            String prenom = req.getParameter("prenom");
    	            String username = req.getParameter("username");
    	            String password = req.getParameter("password");
    	            String role = req.getParameter("role");


    	            

    	            s.setNom(nom);
    	            s.setPrenom(prenom);
    	            s.setUsername(username);
    	            s.setPassword(password);
    	            s.setRole(role);
    	            s.setId(Integer.parseInt(id));
    	            
    	           

    	            EmployeesApi api = new EmployeesApi();
    	            api.update(s);
    			doGet(req,resp);
            	
            	break;}
            
            case "delete":{
            	
            	String id = req.getParameter("id");
    			new EmployeesApi().deleteById(Integer.parseInt(id));
    			System.out.println("ani f delete a"+id);
    			doGet(req,resp);
            	
            	
            	break;
            	
            }
            }
            
           

		} else resp.sendRedirect(req.getContextPath() + "/login");

	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		if (session.getAttribute("user") != null) {
			Employees user = (Employees)session.getAttribute("user");

			req.setAttribute("user",user.getNom()+" "+user.getPrenom());
			req.setAttribute("role",user.getRole());

			String id = req.getParameter("id");
			
			
			Employees s = (Employees) new EmployeesApi().getById(Integer.parseInt(id));
			
			
			 String nom = req.getParameter("nom");
	            String prenom = req.getParameter("prenom");
	            String username = req.getParameter("username");
	            String password = req.getParameter("password");
	            String role = req.getParameter("role");


	            

	            s.setNom(nom);
	            s.setPrenom(prenom);
	            s.setUsername(username);
	            s.setPassword(password);
	            s.setRole(role);
	            s.setId(Integer.parseInt(id));
	            
	           

	            EmployeesApi api = new EmployeesApi();
	            api.update(s);
			doGet(req,resp);

		} else resp.sendRedirect(req.getContextPath() + "/login");



	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if (session.getAttribute("user") != null) {
			Employees user = (Employees)session.getAttribute("user");

			req.setAttribute("user",user.getNom()+" "+user.getPrenom());
			req.setAttribute("role",user.getRole());

			String id = req.getParameter("id");
			new EmployeesApi().deleteById(Integer.parseInt(id));

			doGet(req,resp);

		} else resp.sendRedirect(req.getContextPath() + "/login");



	}
}
