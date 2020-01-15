/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registracijaVozila.baza;
import java.sql.*;
/**
 *
 * @author Admin
 */
public class Baza {
    public Connection dbConn = null;
    public Statement naredba1 = null;
    
    public void poveziSaBazom(){
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            dbConn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "registracija", "registracija" );
            
            System.out.println("Veza sa bazom je: "+dbConn);
            System.out.println("Veza uspostavljena\n");
            
            naredba1 = dbConn.createStatement();
        }catch(Exception e){
            System.out.println("Greska pri komunikaciji sa bazom: "+e.getMessage());
        }
    }
    
    public void zatvoriBazu(){
        try{
            if(naredba1 != null){
                naredba1.close();
            }
            if(dbConn != null){
                dbConn.close();
            }
        }catch(Exception e){
            System.out.println("SQL izuzetak za vreme close(): "+e.getMessage());
        }
    }
    
}
