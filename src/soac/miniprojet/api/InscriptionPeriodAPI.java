package soac.miniprojet.api;

import serviceweb.ServiceDepStub;
import soac.miniprojet.model.dao.daos.InscriptionPeriodDAO;
import java.util.LinkedList;

public class InscriptionPeriodAPI {

    InscriptionPeriodDAO dao;

    public InscriptionPeriodAPI() {
        this.dao = new InscriptionPeriodDAO();
    }

    public Object getById(int id) {

        return dao.getById(id);
    }


    public boolean deleteById(int id) {

        return dao.deleteById(id, "students_biblio_insc");
    }


    public boolean update(Object object) {

        return dao.update(object);
    }


    public boolean add(Object object) {

        return dao.add(object);
    }


    public LinkedList getAll() {
        return dao.getAll();
    }

    public int countAll() {
        return dao.countAll();
    }

    public ServiceDepStub.ScholarYear getCurrentYear() {
        ServiceDepStub.AnneeScolaire yy = new ServiceDepStub.AnneeScolaire();
        try {
            ServiceDepStub.AnneeScolaireResponse anneeResp = new ServiceDepStub().anneeScolaire(yy);
           System.out.println(anneeResp.get_return().getId());
            return anneeResp.get_return();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
