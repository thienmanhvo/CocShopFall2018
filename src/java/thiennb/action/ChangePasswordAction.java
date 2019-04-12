/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thiennb.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import thiennb.daos.UserDAO;

/**
 *
 * @author benfi
 */
public class ChangePasswordAction extends ActionSupport {

    private String password, newPassword, newPasswordRe, email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getNewPasswordRe() {
        return newPasswordRe;
    }

    public void setNewPasswordRe(String newPasswordRe) {
        this.newPasswordRe = newPasswordRe;
    }

    public ChangePasswordAction() {
    }

    public String execute() throws Exception {
        UserDAO dao = new UserDAO();
        if (dao.updatePassword(email, newPassword)) {
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("SUCCESS", "Update Success");
            Map session = ActionContext.getContext().getSession();
            session.clear();
            return SUCCESS;
        } else {
            addActionError("Can't change password now");
            return ERROR;
        }
    }

    public void validate() {
        try {
            UserDAO dao = new UserDAO();
            Map session = ActionContext.getContext().getSession();
            String pass = dao.getUserPasswordByKey((String) session.get("USERLOGIN"));
            if (!pass.equals(password)) {
                addFieldError("password", "Old Password Incorrect");

            } else {
                if (newPassword.length() != 0) {
                    if (!newPassword.equals(newPasswordRe)) {
                        addFieldError("newPasswordRe", "Retype-Password and New Password is not match");
                    }
                }else{
                    addFieldError("newPassword", "New Password can't be blank");
                }
            }

        } catch (Exception ex) {
            Logger.getLogger(ChangePasswordAction.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
