package soac.miniprojet;


import serviceweb.ServiceDepStub;
import serviceweb.ServiceDepStub.ListeEtudiants;
import serviceweb.ServiceDepStub.ListeEtudiantsResponse;

import java.util.Arrays;


public class MainTest {

    public static void main(String[] args) {
        try {
            ServiceDepStub haja = new ServiceDepStub();

            ListeEtudiants listeEtudiants0 = new ListeEtudiants();
            ListeEtudiantsResponse resultat = haja.listeEtudiants(listeEtudiants0);
            ServiceDepStub.Students[] students = resultat.get_return();
            for (int i = 0; i < students.length; i++) {
                System.out.println(students[i].getId());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
