package soac.miniprojet.utils;


import soac.miniprojet.model.beans.InscriptionPeriod;
import soac.miniprojet.model.dao.daos.InscriptionPeriodDAO;

import java.util.Date;


public class ScholarYearHelper {
    public static boolean isInscPeriodOpen() {
        InscriptionPeriodDAO periodDAO = new InscriptionPeriodDAO();
        InscriptionPeriod lp = periodDAO.GetLastPeriode();
        if (lp != null) {
        	return new Date().after(lp.getStartInscDate()) && new Date().before(lp.getEndInscDate());
        } else {
        	return false;
        }
    }

    public static boolean isReInscPeriodOpen() {
    /*    InscriptionPeriodDAO periodDAO = new InscriptionPeriodDAO();
        InscriptionPeriod lp = periodDAO.GetLastPeriode();
        if (lp != null) {
        	return   new Date().after(lp.getStartReinscDate()) && new Date().before(lp.getEndReinscDate());
        } else {
        	return false;
        } */
	return  isInscPeriodOpen();
        
    }
}
