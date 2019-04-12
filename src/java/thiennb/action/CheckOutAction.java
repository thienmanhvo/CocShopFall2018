/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thiennb.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import thiennb.daos.OrderDAO;
import thiennb.daos.OrderDetailDAO;
import thiennb.daos.ProductDAO;
import thiennb.dtos.CartObj;
import thiennb.dtos.OrderDTO;
import thiennb.dtos.OrderDetailDTO;
import thiennb.dtos.ProductOder;

/**
 *
 * @author benfi
 */
public class CheckOutAction extends ActionSupport {

    public CheckOutAction() {
    }

    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        String role = (String) session.get("ROLE");
        if (role == null) {

            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("ERROR", "You must log in to Check out");
            return ERROR;
        } else {
            if (!role.equals("user")) {
                HttpServletRequest request = ServletActionContext.getRequest();
                request.setAttribute("ERROR", "Your account cannot to Checkout. Please create new or change account!");
                return ERROR;
            } else {
                CartObj cart = (CartObj) session.get("shoppingCart");
                if (cart == null) {
                    HttpServletRequest request = ServletActionContext.getRequest();
                    request.setAttribute("ERROR", "You must add to cart before check out!");
                    return ERROR;
                } else {
                    String user_email = (String) session.get("USERLOGIN");
                    float total = cart.getTotal();
                    OrderDTO dto = new OrderDTO(0, user_email, total);
                    OrderDAO dao = new OrderDAO();
                    boolean success1 = false;
                    if (dao.insert(dto)) {
                        success1 = true;
                    }
                    List<ProductOder> listProOrder = (List<ProductOder>) session.get("ListProOrder");
                    int id = dao.getMaxID();
                    boolean success = false;
                    for (ProductOder productOder : listProOrder) {
                        String Product_ID = productOder.getProductID();
                        int Quantity = productOder.getQuantity();
                        ProductDAO proDao = new ProductDAO();
                        
                        float totalDetail = productOder.getPriceSell() * Quantity;
                        OrderDetailDAO detailDAO = new OrderDetailDAO();
                        OrderDetailDTO detailDTO = new OrderDetailDTO(0, id, Product_ID, Quantity, totalDetail);
                        if (detailDAO.insert(detailDTO)) {
                            success = true;
                        } else {
                            success = false;
                        }
                    }
                    if (success && success1) {
                        HttpServletRequest request = ServletActionContext.getRequest();
                        request.setAttribute("SUCCESS", "Check out success");
                        session.remove("shoppingCart");
                        return SUCCESS;
                    } else {
                        HttpServletRequest request = ServletActionContext.getRequest();
                        request.setAttribute("ERROR", "Check out failed");
                        return ERROR;
                    }
                }
            }
        }
    }

}
