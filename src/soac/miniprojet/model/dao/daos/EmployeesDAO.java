package soac.miniprojet.model.dao.daos;


import soac.miniprojet.model.beans.Employees;
import soac.miniprojet.model.dao.DAO;
import soac.miniprojet.model.dao.DAOInterface;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class EmployeesDAO extends DAO implements DAOInterface {
    @Override
    public Object getById(int id) {
        ResultSet result;
        try {
            result = statement.executeQuery("SELECT * FROM Employees WHERE id=" + id);
            if (result.next()) {
                Employees employe = new Employees();
                employe.setId(result.getInt("id"));
                employe.setNom(result.getString("nom"));
                employe.setPrenom(result.getString("prenom"));
                employe.setRole(result.getString("role"));
                employe.setUsername(result.getString("username"));
                employe.setPassword(result.getString("password"));
                return employe;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean isAuth(String username, String password) {
        ResultSet result;
        int count = 0;
        try {

            result = statement.executeQuery("select count(id) FROM Employees " +
                    " WHERE " +
                    "`username` like '" + username + "' " +
                    "and " +
                    "`password` like '" + password + "' " +
                    ";");
            if (result.next()) {
                count = result.getInt("count(id)");
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Employees getByUsername(String username) {
        ResultSet result;
        try {
            result = statement.executeQuery("SELECT * FROM Employees WHERE username like'" + username + "'");
            if (result.next()) {
                Employees employe = new Employees();
                employe.setId(result.getInt("id"));
                employe.setNom(result.getString("nom"));
                employe.setPrenom(result.getString("prenom"));
                employe.setRole(result.getString("role"));
                employe.setUsername(result.getString("username"));
                employe.setPassword(result.getString("password"));
                return employe;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    @Override
    public boolean deleteById(int id) {
        return deleteById(id, "Employees");
    }

    @Override
    public boolean update(Object object) {

        Employees employe = (Employees) object;
        try {
            statement.execute("UPDATE Employees SET " +
                    "nom = '" + employe.getNom() + "'," +
                    "prenom = '" + employe.getPrenom() + "'," +
                    "role = '" + employe.getRole() + "'," +
                    "username = '" + employe.getUsername() + "'," +
                    "password = '" + employe.getPassword() + "'" +


                    " WHERE Employees.id=" + employe.getId() + ";");
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean add(Object object) {
        Employees employe = (Employees) object;
        try {
            statement.execute("INSERT INTO Employees (`nom`,`prenom`,`role`,`username`,`password` ) VALUES(" +
                    "'" + employe.getNom() + "'," +
                    "'" + employe.getPrenom() + "'," +
                    "'" + employe.getRole() + "'" + "," +
                    "'" + employe.getUsername() + "'," +
                    "'" + employe.getPassword() + "'" + 

                    ");");
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public LinkedList<Employees> getAll() {
        LinkedList<Employees> list = new LinkedList<>();
        ResultSet result;
        try {
            result = statement.executeQuery("SELECT * FROM Employees;");
            while (result.next()) {
                Employees employe = new Employees();
                employe.setId(result.getInt("id"));
                employe.setNom(result.getString("nom"));
                employe.setPrenom(result.getString("prenom"));
                employe.setRole(result.getString("role"));
                employe.setUsername(result.getString("username"));
                employe.setPassword(result.getString("password"));

                list.add(employe);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int countAll() {
        ResultSet result;
        try {
            result = statement.executeQuery("SELECT count(id) FROM Employees;");
            if (result.next()) {
                return result.getInt("count(id)");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
