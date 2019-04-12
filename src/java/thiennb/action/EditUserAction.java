/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thiennb.action;

import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import thiennb.daos.UserDAO;
import thiennb.dtos.UserDTO;

/**
 *
 * @author benfi
 */
public class EditUserAction extends ActionSupport {

    private String key;
    private String lastSearchUserValue;
    private String findWhat;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getLastSearchUserValue() {
        return lastSearchUserValue;
    }

    public void setLastSearchUserValue(String lastSearchUserValue) {
        this.lastSearchUserValue = lastSearchUserValue;
    }

    public String getFindWhat() {
        return findWhat;
    }

    public void setFindWhat(String findWhat) {
        this.findWhat = findWhat;
    }

    public EditUserAction() {
    }

    public String execute() throws Exception {
        UserDAO dao = new UserDAO();
        UserDTO dto = dao.getUserByEmail(key);
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("USERTOEDIT", dto);
        request.setAttribute("key", key);
        request.setAttribute("lastSearchUserValue", lastSearchUserValue);
        request.setAttribute("findWhat", findWhat);
        return SUCCESS;
    }

}
