/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thiennb.dtos;

import java.io.Serializable;

/**
 *
 * @author benfi
 */
public class UserDTO implements Serializable{

    private String email, username, lastname,firstname, password, role,address,city,telephone;
    private boolean isDelete;

    public UserDTO(String email, String lastname, String firstname, String role) {
        this.email = email;
        this.lastname = lastname;
        this.firstname = firstname;
        this.role = role;
    }

    public UserDTO(String email, String username, String lastname, String firstname, String address, String city, String telephone) {
        this.email = email;
        this.username = username;
        this.lastname = lastname;
        this.firstname = firstname;
        this.address = address;
        this.city = city;
        this.telephone = telephone;
    }
    
    public UserDTO(String username, String lastname, String firstname, String address, String city, String telephone) {
        this.username = username;
        this.lastname = lastname;
        this.firstname = firstname;
        this.address = address;
        this.city = city;
        this.telephone = telephone;
    }

    public UserDTO() {
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public boolean isIsDelete() {
        return isDelete;
    }

    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
    }

}
