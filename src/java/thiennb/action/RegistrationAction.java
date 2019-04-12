/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thiennb.action;

import com.opensymphony.xwork2.ActionSupport;
import java.util.logging.Level;
import java.util.logging.Logger;
import thiennb.daos.UserDAO;
import thiennb.dtos.UserDTO;

/**
 *
 * @author benfi
 */
public class RegistrationAction extends ActionSupport {

    private String email, firstname, lastname, password, passwordRe;

    public RegistrationAction() {
    }

    public String execute() throws Exception {
        UserDAO dao = new UserDAO();
        UserDTO dto = new UserDTO(email, lastname, firstname, "user");
        dto.setPassword(password);

        if (dao.insert(dto)) {
            addActionMessage("Registration Success");
            email = "";
            firstname = "";
            lastname = "";
            return SUCCESS;
        } else {
            addActionError("Registration Failed");
            return ERROR;
        }
    }

    @Override
    public void validate() {
        if (email.length() == 0) {
            addFieldError("email", "Email can't be blank!");
        }
        UserDAO dao = new UserDAO();
        UserDTO dto = null;
        try {
            dto = dao.getUserByEmail(email);
        } catch (Exception ex) {
            Logger.getLogger(RegistrationAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        if(dto!=null){
            addFieldError("email", "Email is existed!");
        }
        if (firstname.length() == 0) {
            addFieldError("firstname", "Frist name can't be blank!");
        }
        if (lastname.length() == 0) {
            addFieldError("lastname", "Last name can't be blank!");
        }
        if (password.length() == 0) {
            addFieldError("password", "Password can't be blank!");
        }
        if (passwordRe.length() == 0) {
            addFieldError("passwordRe", "Re-Password can't be blank!");
        }
        if (password.length() != 0 && passwordRe.length() != 0) {
            if (!password.equals(passwordRe)) {
                addActionMessage("Password and Re-Password not match");
            }
        }
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String fistname) {
        this.firstname = fistname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordRe() {
        return passwordRe;
    }

    public void setPasswordRe(String passwordRe) {
        this.passwordRe = passwordRe;
    }

}
