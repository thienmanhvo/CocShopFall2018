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
import thiennb.dtos.CartObj;

/**
 *
 * @author benfi
 */
public class RemoveProductFromCart extends ActionSupport {

    private String rmv;

    public String getRmv() {
        return rmv;
    }

    public void setRmv(String rmv) {
        this.rmv = rmv;
    }

    public RemoveProductFromCart() {
    }

    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();

        Map session = ActionContext.getContext().getSession();
        CartObj cart = (CartObj) session.get("shoppingCart");

        cart.removeCart(rmv);

        session.replace("shoppingCart", cart);
        return SUCCESS;
    }

}
