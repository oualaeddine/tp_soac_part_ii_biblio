package soac.miniprojet.api;


import soac.miniprojet.model.beans.Employees;
import soac.miniprojet.model.dao.daos.EmployeesDAO;

import java.util.LinkedList;

public class EmployeesApi {

    EmployeesDAO dao;

    public EmployeesApi() {
        this.dao = new EmployeesDAO();
    }

    public boolean login(String username, String password) {
        return dao.isAuth(username, password);
    }

    public Employees getByUsername(String username) {
        return dao.getByUsername(username);
    }

    public Object getById(int id) {
        return dao.getById(id);
    }

    public boolean deleteById(int id) {
        return dao.deleteById(id);
    }

    public boolean update(Object object) {
        return dao.update(object);
    }

    public boolean add(Object object) {
        return dao.add(object);
    }

    public LinkedList<Employees> getAll() {
        return dao.getAll();
    }

    public int countAll() {
        return dao.countAll();
    }
}
