package soac.miniprojet.utils;

import serviceweb.ServiceDepStub;
import soac.miniprojet.model.beans.Students;

public class Utils {
    public static Students ConvertStudentStubToStudent(ServiceDepStub.Students student) {
        Students stud = new Students();

        stud.setId(student.getId());
        stud.setNom(student.getNom());
        stud.setPrenom(student.getPrenom());
        stud.setSexe(student.getSexe());
        stud.setDateInsc(student.getDateInsc());
        stud.setDateNaiss(student.getDateNaiss());
        stud.setNumBac(student.getNumBac());

        return stud;
    }
}
