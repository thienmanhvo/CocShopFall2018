/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thiennb.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import thiennb.daos.UserDAO;

/**
 *
 * @author benfi
 */
public class DeleteUserAction extends ActionSupport {

    private String key;
    private String lastSearchUserValue;
    private String findWhat;

    public String getFindWhat() {
        return findWhat;
    }

    public void setFindWhat(String findWhat) {
        this.findWhat = findWhat;
    }

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

    public DeleteUserAction() {
    }

    public String execute() throws Exception {
        UserDAO dao = new UserDAO();
        Map session = ActionContext.getContext().getSession();
        session.put("NOTI", "true");
        if (dao.delete(key)) {
            session.put("SUCCESS", "Delete Success!");
            return SUCCESS;
        } else {
            session.put("ERROR", "Delete Failded!!");
            return ERROR;
        }

    }

}
