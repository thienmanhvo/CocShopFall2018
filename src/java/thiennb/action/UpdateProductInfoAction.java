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
import thiennb.daos.ProductDAO;
import thiennb.dtos.CategoryDTO;
import thiennb.dtos.ProductDTO;

/**
 *
 * @author benfi
 */
public class UpdateProductInfoAction extends ActionSupport {

    private String productID, productName, description;
    private float priceSell, priceIn;
    private boolean isSale, isNew, isBest;
    private String cate_ID;
    private int quantity;
    private float priceSale;
    private String lastSearchProductValue, keyPro;
    private List<CategoryDTO> listCate;
    private String selectedCate;

    private List list;

    public List getList() {
        list = new ArrayList();
        list.add(true);
        list.add(false);
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public List<CategoryDTO> getListCate() {
        return listCate;
    }

    public void setListCate(List<CategoryDTO> listCate) {
        this.listCate = listCate;
    }

    public String getSelectedCate() {
        return selectedCate;
    }

    public void setSelectedCate(String selectedCate) {
        this.selectedCate = selectedCate;
    }

    public String getLastSearchProductValue() {
        return lastSearchProductValue;
    }

    public void setLastSearchProductValue(String lastSearchProductValue) {
        this.lastSearchProductValue = lastSearchProductValue;
    }

    public String getKeyPro() {
        return keyPro;
    }

    public void setKeyPro(String keyPro) {
        this.keyPro = keyPro;
    }

    public String getProductID() {
        return productID;
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

    public String getCate_ID() {
        return cate_ID;
    }

    public void setCate_ID(String cate_ID) {
        this.cate_ID = cate_ID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPriceSale() {
        return priceSale;
    }

    public void setPriceSale(float priceSale) {
        this.priceSale = priceSale;
    }

    public UpdateProductInfoAction() {
    }

    @Override
    public String execute() throws Exception {
        ProductDAO dao = new ProductDAO();
        ProductDTO dto = new ProductDTO(productID, productName, description, priceSell, priceIn, isSale, isSale, isNew, isBest, cate_ID, quantity, priceSale);
        String[] str = selectedCate.split("-");
        dto.setCate_ID(str[0]);
        Map session = ActionContext.getContext().getSession();
        session.put("NOTIPRO", "true");
        if (dao.update(dto)) {
            session.put("SUCCESSPRO", "Edit Success!");
            return SUCCESS;
        } else {
            session.put("ERRORPRO", "Edit Failded!!");
            return ERROR;
        }
    }

    public void validate() {
        if (productID.length() == 0) {
            addFieldError("productID", "ProductID can't be blank!");
        }
        if (productName.length() == 0) {
            addFieldError("productName", "ProductName can't be blank!");
        }
        if (priceSale < 0) {
            addFieldError("priceSale", "PriceSale must be positive number");
        }
        if (quantity < 0) {
            addFieldError("quantity", "Quantity must be positive number");
        }
        if (priceSell < 0) {
            addFieldError("priceSell", "PriceSell must be positive number");
        }
        if (priceIn < 0) {
            addFieldError("priceIn", "PriceIn must be positive number");
        }
        if (priceSell < priceSale) {
            addActionError("Price Sell must smaller than Sale");
        }
        if (priceIn > priceSell) {
            addActionError("Price In must smaller than Sell");
        }
        HttpServletRequest request = ServletActionContext.getRequest();
        ProductDTO dto = new ProductDTO(productID, productName, description, priceSell, priceIn, isSale, isSale, isNew, isBest, cate_ID, quantity, priceSale);
        request.setAttribute("PRODUCTTOEDIT", dto);
    }
}
