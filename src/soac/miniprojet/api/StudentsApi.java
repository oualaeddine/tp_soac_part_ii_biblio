package soac.miniprojet.api;


import serviceweb.ServiceDepStub;
import soac.miniprojet.model.beans.Students;
import soac.miniprojet.model.beans.StudentsBiblioInsc;
import soac.miniprojet.model.dao.daos.StudentsDAO;
import soac.miniprojet.utils.ScholarYearHelper;
import soac.miniprojet.utils.Utils;
import java.util.LinkedList;

public class StudentsApi {

    StudentsDAO dao;

    public StudentsApi() {
        this.dao = new StudentsDAO();
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


    public boolean add(Students student) {
        if (ScholarYearHelper.isInscPeriodOpen())
            return dao.add(student);
        else
            return false;
    }


    public LinkedList<Students> getAll() {
        return dao.getAll();
    }

    public int countAll() {
        return dao.countAll();
    }

    public boolean Reinscrire(StudentsBiblioInsc studentInscription) {
        if (ScholarYearHelper.isReInscPeriodOpen())
            return dao.Reinscrire(studentInscription);
        else return false;
    }

    public LinkedList<Students> getNonInscrisForCurrentYear() {
        LinkedList<Students> allStudents = new LinkedList<>();

        try {
            ServiceDepStub haja = new ServiceDepStub();
            ServiceDepStub.ListeEtudiants listeEtudiants0 = new ServiceDepStub.ListeEtudiants();
            ServiceDepStub.ListeEtudiantsResponse resultat = haja.listeEtudiants(listeEtudiants0);
            ServiceDepStub.Students[] students = resultat.get_return();
            for (ServiceDepStub.Students student : students) {
                allStudents.add(Utils.ConvertStudentStubToStudent(student));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return filteredStudentsList(allStudents);
    }

    private LinkedList<Students> filteredStudentsList(LinkedList<Students> allStudents) {
        ServiceDepStub.ScholarYear thisYear = new InscriptionPeriodAPI().getCurrentYear();
        if (thisYear != null) {
            LinkedList<Students> inscris = new StudentsDAO().getRegisteredStudentsForThisYear(thisYear.getId());
            for (Students s : allStudents) {
                System.out.println(s);
                for (Students s2 : inscris) {
                    if (s.getId() == s2.getId()) {
                        allStudents.remove(s);
                        inscris.remove(s2);
                    }
                }
            }
        }
        return allStudents;
    }

}
