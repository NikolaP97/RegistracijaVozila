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
public class Login {
    private int id;
    private String username;

    public Login() {
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }
    

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    @Override
    public String toString() {
        return "Korisnik: " + username + " [id=" + id+"]";
    }

    

    

    
    
}
