/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thiennb.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import thiennb.dtos.CartObj;
import thiennb.dtos.ProductOder;

/**
 *
 * @author benfi
 */
public class ViewCartAction extends ActionSupport {

    private List<ProductOder> listProOrder;

    public List<ProductOder> getListProOrder() {
        return listProOrder;
    }

    public void setListProOrder(List<ProductOder> listProOrder) {
        this.listProOrder = listProOrder;
    }

    public ViewCartAction() {
    }

    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();

        CartObj cart = (CartObj) session.get("shoppingCart");
        if (cart == null) {
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("ERROR", "You must add product to cart to view Cart");
            return ERROR;
        }
        if (listProOrder == null) {
            listProOrder = new ArrayList<>();
        }
        for (ProductOder value : cart.getCart().values()) {
            listProOrder.add(value);
        }
        session.put("ListProOrder", listProOrder);
        return SUCCESS;
    }

}
