/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thiennb.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import thiennb.daos.ProductDAO;
import thiennb.dtos.CartObj;
import thiennb.dtos.ProductDTO;
import thiennb.dtos.ProductOder;

/**
 *
 * @author benfi
 */
public class AddProductToCartAction extends ActionSupport {


    private String idProD;


    public String getIdProD() {
        return idProD;
    }

    public void setIdProD(String idProD) {
        this.idProD = idProD;
    }

    public AddProductToCartAction() {
    }

    public String execute() throws Exception {

        Map session = ActionContext.getContext().getSession();
        ProductDAO dao = new ProductDAO();
        ProductDTO productDto = dao.getProductByPrimaryKey(idProD);

        ProductOder dto = new ProductOder();
        if (productDto.isIsSale()) {
            dto.setPriceSell(productDto.getPriceSale());
        } else {
            dto.setPriceSell(productDto.getPriceSell());
        }
        dto.setProductID(productDto.getProductID());
        dto.setQuantity(1);
        dto.setProductName(productDto.getProductName());
        CartObj cart = (CartObj) session.get("shoppingCart");
        if (cart == null) {
            cart = new CartObj();
        }
        cart.addToCart(dto);
        
        session.put("shoppingCart", cart);
        return SUCCESS;
    }

}
