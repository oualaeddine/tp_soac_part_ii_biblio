package soac.miniprojet.model.dao;

import java.sql.SQLException;
import java.sql.Statement;

public abstract class DAO {
    protected Statement             statement;

    public DAO() {
        DbConnector.createConnexion();
        if (statement == null)
            statement = DbConnector.getStatment();
    }



    public boolean deleteById(int id, String table) {
        try {
            statement.execute("DELETE FROM " + table + " WHERE id = " + id);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }





}
