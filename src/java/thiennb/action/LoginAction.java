/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thiennb.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import thiennb.daos.UserDAO;

/**
 *
 * @author benfi
 */
public class LoginAction extends ActionSupport {

    private String email, password;
    private static final String ERROR = "error";
    private static final String ADMIN = "admin";
    private static final String USER = "user";

    public LoginAction() {
    }

    @Override
    public String execute() throws Exception {
        String url = ERROR;
        UserDAO dao = new UserDAO();
        HttpServletRequest request = ServletActionContext.getRequest();
        String role = dao.checkLogin(email, password);
        if (role.equals("failed")) {
            request.setAttribute("ERROR", "INVALID Username or Password");
        } else {
            Map session = ActionContext.getContext().getSession();
            session.put("USERLOGIN", email);
            if (role.equals("admin")) {
                session.put("ROLE", "admin");
                url = ADMIN;
            } else if (role.equals("user")) {
                session.put("ROLE", "user");
                url = USER;
            } else {
                request.setAttribute("ERROR", "Your role is not support!");
            }
        }
        return url;
    }

    
    @Override
    public void validate() {
        if (email.length() == 0) {
            addFieldError("email", "Email can't be blank!");
        } else if (!email.matches("\\w+@\\w+[.]\\w+")) {
            addFieldError("email", "Email must have @xxx.xxx, Ex: example@gmail.com");
        }
        if (password.length() == 0) {
            addFieldError("password", "Password can't be blank!");
        }

    }

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

}
