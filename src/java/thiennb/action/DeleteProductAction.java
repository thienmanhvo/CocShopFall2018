/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thiennb.action;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import thiennb.daos.ProductDAO;

/**
 *
 * @author benfi
 */
public class DeleteProductAction extends ActionSupport {

    private String keyPro;
    private String lastSearchProductValue;

    public String getKeyPro() {
        return keyPro;
    }

    public void setKeyPro(String keyPro) {
        this.keyPro = keyPro;
    }

    public String getLastSearchProductValue() {
        return lastSearchProductValue;
    }

    public void setLastSearchProductValue(String lastSearchProductValue) {
        this.lastSearchProductValue = lastSearchProductValue;
    }

    public DeleteProductAction() {
    }

    public String execute() throws Exception {
        ProductDAO dao = new ProductDAO();
        Map session = ActionContext.getContext().getSession();
        session.put("NOTIPRO", "true");
        if (dao.delete(keyPro)) {
            session.put("SUCCESSPRO", "Delete Success!");
            return SUCCESS;
        } else {
            session.put("ERRORPRO", "Delete Failded!!");
            return ERROR;
        }
    }

}
