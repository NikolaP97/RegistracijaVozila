/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registracijaVozila.data;

/**
 *
 * @author Admin
 */
public class Registracija {
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
    private int snaga;
    
    
    

    public Registracija() {
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

    public int getSnaga() {
        return snaga;
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

    public void setSnaga(int snaga) {
        this.snaga = snaga;
    }

    @Override
    public String toString() {
        return "Registracija{" + "ime=" + ime + ", prezime=" + prezime + ", jmbg=" + jmbg + ", adresa=" + adresa + ", kontakt=" + kontakt + ", registarskaOznaka=" + registarskaOznaka + ", marka=" + marka + ", model=" + model + ", boja=" + boja + ", brojSasije=" + brojSasije + ", godiste=" + godiste + ", zapreminaMotora=" + zapreminaMotora + ", snaga=" + snaga + '}';
    }

    

    
    
   
}
