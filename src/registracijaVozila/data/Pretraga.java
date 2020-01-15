/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registracijaVozila.data;

import java.sql.ResultSet;
import java.util.Date;
import javax.swing.JOptionPane;
import registracijaVozila.baza.Baza;
import registracijaVozila.ekrani.PocetnaStranaEkran;

/**
 *
 * @author Admin
 */
public class Pretraga {
    private int id;
    private String ime;
    private String prezime;
    private long jmbg;
    private String adresa;
    private String kontakt;
    private String registarskaOznaka;
    private String marka;
    private String model;
    private String boja;
    private String brojSasije;
    private int godiste;
    private int zapreminaMotora;
    private int snagaMotora;
    private Date datumReg;
    private Date regDo;
    private int korisnikId;
    private String korisnik;

    public void setKorisnik(String korisnik) {
        this.korisnik = korisnik;
    }

    public int getKorisnikId() {
        return korisnikId;
    }

    public void setKorisnikId(int korisnikId) {
        this.korisnikId = korisnikId;
        Baza baza = new Baza();
        try {
            baza.poveziSaBazom();
            String sql="SELECT USERNAME FROM korisnik WHERE ID="+getKorisnikId();
            ResultSet rs=baza.naredba1.executeQuery(sql);
            
            if(rs.next()){
                String username = rs.getString("USERNAME");
                setKorisnik(username);
            }else{
                JOptionPane.showMessageDialog(null,"Doslo je do greske u bazi!");
            }
        } catch(Exception e){
            System.out.println(e);
        }
    }

    public String getKorisnik() {
        return korisnik;
    }

    public Pretraga() {
    }

    public int getId() {
        return id;
    }

    public String getIme() {
        return ime;
    }

    public String getPrezime() {
        return prezime;
    }

    public long getJmbg() {
        return jmbg;
    }

    public String getAdresa() {
        return adresa;
    }

    public String getKontakt() {
        return kontakt;
    }

    public String getRegistarskaOznaka() {
        return registarskaOznaka;
    }

    public String getMarka() {
        return marka;
    }

    public String getModel() {
        return model;
    }

    public String getBoja() {
        return boja;
    }

    public String getBrojSasije() {
        return brojSasije;
    }

    public int getGodiste() {
        return godiste;
    }

    public int getZapreminaMotora() {
        return zapreminaMotora;
    }

    public int getSnagaMotora() {
        return snagaMotora;
    }

    public Date getDatumReg() {
        return datumReg;
    }

    public Date getRegDo() {
        return regDo;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    public void setPrezime(String prezime) {
        this.prezime = prezime;
    }

    public void setJmbg(long jmbg) {
        this.jmbg = jmbg;
    }

    public void setAdresa(String adresa) {
        this.adresa = adresa;
    }

    public void setKontakt(String kontakt) {
        this.kontakt = kontakt;
    }

    public void setRegistarskaOznaka(String registarskaOznaka) {
        this.registarskaOznaka = registarskaOznaka;
    }

    public void setMarka(String marka) {
        this.marka = marka;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public void setBoja(String boja) {
        this.boja = boja;
    }

    public void setBrojSasije(String brojSasije) {
        this.brojSasije = brojSasije;
    }

    public void setGodiste(int godiste) {
        this.godiste = godiste;
    }

    public void setZapreminaMotora(int zapreminaMotora) {
        this.zapreminaMotora = zapreminaMotora;
    }

    public void setSnagaMotora(int snagaMotora) {
        this.snagaMotora = snagaMotora;
    }

    public void setDatumReg(Date datumReg) {
        this.datumReg = datumReg;
    }

    public void setRegDo(Date regDo) {
        this.regDo = regDo;
    }

    @Override
    public String toString() {
        return "--------------------------------------------------------------------------------\n"
                +"ID u bazi:"+id
                +"\nIme i prezime vlasnika vozila: " + ime +" "+ prezime + "[ JMBG: " + jmbg + " ] "
                +"\n--------------------------------------------------------------------------------\n"
                +"Adresa i kontakt vlasnika: "+adresa + " || " + kontakt
                +"\n--------------------------------------------------------------------------------\n"
                +"Podaci o vozilu: " + "\nRegistarksa oznaka: " +registarskaOznaka + "\nMarka: " + marka + "\nModel: " + model 
                +"\nBroj sasije: " + brojSasije +"\nBoja: " + boja +  "\nGodina proizvodnje: " + godiste 
                +"\nZapremina Motora: " + zapreminaMotora + "\nSnaga Motora  u kW: " + snagaMotora + "\nDatum registracije: " + datumReg 
                +"\nDatum isteka registracije: " + regDo
                +"\nAzurirao: " + korisnik 
                +"\n--------------------------------------------------------------------------------\n";
    }
    
    
    
}
