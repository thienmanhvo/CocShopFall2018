/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thiennb.action;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import thiennb.daos.CategoryDAO;
import thiennb.daos.ProductDAO;
import thiennb.dtos.CategoryDTO;
import thiennb.dtos.ProductDTO;

/**
 *
 * @author benfi
 */
public class InsertProductAction extends ActionSupport {

    private String productID, productName, description;
    private float priceSell, priceIn;
    private boolean isSale, isNew, isBest;
    private String cate_ID;
    private int quantity;
    private float priceSale;
    private List list;
    private List<CategoryDTO> listCate;
    private String selectedCate;

    public List<CategoryDTO> getListCate() {
        return listCate;
    }

    public List getList() {
        list= new ArrayList();
        list.add(true);
        list.add(false);
        return list;
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

    public InsertProductAction() {
    }

    @Override
    public String execute() throws Exception {
        ProductDAO dao = new ProductDAO();
        ProductDTO dto = new ProductDTO(productID, productName, description, priceSell, priceIn, isSale, isSale, isNew, isBest, cate_ID, quantity, priceSale);
        String[] str = selectedCate.split("-");
        dto.setCate_ID(str[0]);
        initListCate();
        if (dao.insert(dto)) {
            addActionMessage("Insert Success!");
            return SUCCESS;
        } else {
            addActionError("Insert Failded!");
            return ERROR;
        }
    }

    public void validate() {

        if (productID.length() == 0) {
            addFieldError("productID", "ProductID can't be blank!");
        }
        ProductDAO dao = new ProductDAO();
        ProductDTO dto = null;
        try {
            dto = dao.getProductByPrimaryKey(productID);
        } catch (Exception ex) {
            Logger.getLogger(InsertProductAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (dto != null) {
            addFieldError("productID", "ProductID is existed");
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
        dto = new ProductDTO(productID, productName, description, priceSell, priceIn, isSale, isSale, isNew, isBest, cate_ID, quantity, priceSale);
        request.setAttribute("PRODUCT", dto);
        initListCate();
    }

    private void initListCate() {
        CategoryDAO dao = new CategoryDAO();
        try {
            getList();
            setListCate(dao.getAllCategory());
        } catch (Exception ex) {
            Logger.getLogger(EditProdctAction.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
