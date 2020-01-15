/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registracijaVozila.baza;

import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.JOptionPane;
import registracijaVozila.data.Registracija;

/**
 *
 * @author Admin
 */
public class RegistracijaBaza {

    public static void insertRegistracija(Registracija registracija, int userId){
        Baza baza = new Baza();
        
        try{
            baza.poveziSaBazom();
            
            String chk = "Select * From REGISTRACIJA Where REGISTARSKA_OZNAKA='"+registracija.getRegistarskaOznaka()+"'";
            ResultSet rs = baza.naredba1.executeQuery(chk);
            if(rs.next()) {
                JOptionPane.showMessageDialog(null,"Vozilo sa takvom registracijom vec postoji u bazi!");
                return;
            }
            
            
            String insert = "INSERT INTO Registracija (IME, PREZIME, JMBG, ADRESA, KONTAKT_TELEFON, REGISTARSKA_OZNAKA, MARKA, MODEL, BOJA, BROJ_SASIJE, GODINA_PROIZVODNJE, ZAPREMINA_MOTORA, SNAGA_MOTORA, DATUM_REGISTRACIJE, REGISTROVAN_DO, KORISNIK_ID) VALUES ("
                        +"'"+registracija.getIme()+"'"+", "
                        +"'"+registracija.getPrezime()+"'"+", "
                        +"'"+registracija.getJmbg()+"'"+", "
                        +"'"+registracija.getAdresa()+"'"+", "
                        +"'"+registracija.getKontakt()+"'"+", "
                        +"'"+registracija.getRegistarskaOznaka().toUpperCase()+"'"+", "
                        +"'"+registracija.getMarka()+"'"+", "
                        +"'"+registracija.getModel()+"'"+", "
                        +"'"+registracija.getBoja()+"'"+", "
                        +"'"+registracija.getBrojSasije()+"'"+", "
                        +registracija.getGodiste()+", " 
                        +registracija.getZapreminaMotora()+", "  
                        +registracija.getSnaga()+", "
                        +"sysdate"+", "
                        +"add_months(sysdate,12)"+",'" + userId + "')";
            rs=baza.naredba1.executeQuery(insert);
             JOptionPane.showMessageDialog(null,"Uspesno ste registrovali vozilo!");

            
           
            
            
        }catch(Exception e){
            JOptionPane.showMessageDialog(null,"Greska pri upisu u bazu, proverite da li ste popunili sva polja, i da li su podaci pravilno uneti!");
        }finally{
            baza.zatvoriBazu();
        }
    }
}
