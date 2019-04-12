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
import thiennb.daos.ProductDAO;
import thiennb.dtos.ProductDTO;

/**
 *
 * @author benfi
 */
public class SearchProductActionByAdmin extends ActionSupport {

    private String productSearch;
    private List<ProductDTO> listSearchProduct;

    public String getProductSearch() {
        return productSearch;
    }

    public void setProductSearch(String productSearch) {
        this.productSearch = productSearch;
    }

    public List<ProductDTO> getListSearchProduct() {
        return listSearchProduct;
    }

    public void setListSearchProduct(List<ProductDTO> listSearchProduct) {
        this.listSearchProduct = listSearchProduct;
    }

    public SearchProductActionByAdmin() {
    }

    public String execute() throws Exception {
        ProductDAO dao = new ProductDAO();
        Map session = ActionContext.getContext().getSession();
        String noti = (String) session.get("NOTIPRO");
        if (noti != null) {
            if (!noti.equalsIgnoreCase("true")) {
                session.remove("SUCCESSPRO");
                session.remove("ERRORPRO");
            }
        } else {
            session.remove("SUCCESSPRO");
            session.remove("ERRORPRO");
        }
        session.remove("NOTIPRO");
        listSearchProduct = dao.findByLikeNameOrID(productSearch);
        return SUCCESS;
    }

    public void validate() {
        if (productSearch.length() == 0) {
            addFieldError("productSearch", "Search Value can't be blank!");
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("SEARCHPROINVALID", "Search Value can't be blank!");
        }
    }
}
