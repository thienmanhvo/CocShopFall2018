/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thiennb.action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import java.util.Map;
import thiennb.daos.ProductDAO;
import thiennb.dtos.ProductDTO;

/**
 *
 * @author benfi
 */
public class LoadProductAction extends ActionSupport {

    private static final double NUMBER_OF_PRO_INPAGE = 6.0;
    private String productID, productName, description;
    private float priceSell, priceIn;
    private boolean isDelete, isSale, isNew, isBest;
    private List<ProductDTO> listAllPro;
    private int numOfPageHome;

    public int getNumOfPageHome() {
        return numOfPageHome;
    }

    public void setNumOfPageHome(int numOfPageHome) {
        this.numOfPageHome = numOfPageHome;
    }

    public String getProductID() {
        return productID;
    }

    public List<ProductDTO> getListAllPro() {
        return listAllPro;
    }

    public void setListAllPro(List<ProductDTO> listAllPro) {
        this.listAllPro = listAllPro;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPriceSell() {
        return priceSell;
    }

    public void setPriceSell(float priceSell) {
        this.priceSell = priceSell;
    }

    public float getPriceIn() {
        return priceIn;
    }

    public void setPriceIn(float priceIn) {
        this.priceIn = priceIn;
    }

    public boolean isIsDelete() {
        return isDelete;
    }

    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
    }

    public boolean isIsSale() {
        return isSale;
    }

    public void setIsSale(boolean isSale) {
        this.isSale = isSale;
    }

    public boolean isIsNew() {
        return isNew;
    }

    public void setIsNew(boolean isNew) {
        this.isNew = isNew;
    }

    public boolean isIsBest() {
        return isBest;
    }

    public void setIsBest(boolean isBest) {
        this.isBest = isBest;
    }

    public LoadProductAction() {
    }

    public String execute() throws Exception {
        ProductDAO dao = new ProductDAO();
        listAllPro = dao.getAllProduct();
        numOfPageHome = (int) Math.ceil(listAllPro.size() / NUMBER_OF_PRO_INPAGE);

        Map session = ActionContext.getContext().getSession();

        String role = (String) session.get("ROLE");

        if (role != null) {
            if (!role.equals("admin")) {

                return SUCCESS;
            } else {
                return "admin";
            }
        } else {
            return SUCCESS;
        }
    }

}
