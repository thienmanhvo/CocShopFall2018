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
import thiennb.dtos.UserDTO;

/**
 *
 * @author benfi
 */
public class AccessUpdateAction extends ActionSupport {

    private String email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public AccessUpdateAction() {
    }

    public String execute() throws Exception {

        UserDAO dao = new UserDAO();
        UserDTO dto = dao.getUserByEmail(email);
        Map session = ActionContext.getContext().getSession();
        String userlogin = (String) session.get("USERLOGIN");
        if (userlogin != null) {
            if (userlogin.equals(email)) {
                if (dto == null) {
                    HttpServletRequest request = ServletActionContext.getRequest();
                    request.setAttribute("ERROR", "You must Login to change your account");
                    return ERROR;
                } else {
                    session = ActionContext.getContext().getSession();
                    session.put("USER", dto);
                    return SUCCESS;
                }
            } else {
                HttpServletRequest request = ServletActionContext.getRequest();
                request.setAttribute("ERROR", "Your account is different");
                return ERROR;
            }
        } else {
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("ERROR", "You must Login to change your account");
            return ERROR;
        }
    }
}
