/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thiennb.action;

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
public class EditProdctAction extends ActionSupport {

    private String keyPro;
    private String lastSearchProductValue;

    private List<CategoryDTO> listCate;
    private String selectedCate;
    private List list;

    public List getList() {
        list = new ArrayList();
        list.add(true);
        list.add(false);
        return list;
    }

    public EditProdctAction() {
    }

    public String execute() throws Exception {
        ProductDAO dao = new ProductDAO();
        ProductDTO dto = dao.getProductByPrimaryKey(getKeyPro());

        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("PRODUCTTOEDIT", dto);
        request.setAttribute("keyPro", getKeyPro());
        request.setAttribute("lastSearchProductValue", getLastSearchProductValue());

        initListCate(dto.getCate_ID());
        return SUCCESS;
    }

    private void initListCate(String cate_ID) {
        CategoryDAO dao = new CategoryDAO();
        try {
            setListCate(dao.getAllCategory());
            CategoryDTO dto = dao.findByPrimaryKey(cate_ID);
            selectedCate = dto.toString();
            getList();
        } catch (Exception ex) {
            Logger.getLogger(EditProdctAction.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * @return the keyPro
     */
    public String getKeyPro() {
        return keyPro;
    }

    /**
     * @param keyPro the keyPro to set
     */
    public void setKeyPro(String keyPro) {
        this.keyPro = keyPro;
    }

    /**
     * @return the lastSearchProductValue
     */
    public String getLastSearchProductValue() {
        return lastSearchProductValue;
    }

    /**
     * @param lastSearchProductValue the lastSearchProductValue to set
     */
    public void setLastSearchProductValue(String lastSearchProductValue) {
        this.lastSearchProductValue = lastSearchProductValue;
    }

    /**
     * @return the listCate
     */
    public List<CategoryDTO> getListCate() {
        return listCate;
    }

    /**
     * @param listCate the listCate to set
     */
    public void setListCate(List<CategoryDTO> listCate) {
        this.listCate = listCate;
    }

    /**
     * @return the selectedCate
     */
    public String getSelectedCate() {
        return selectedCate;
    }

    /**
     * @param selectedCate the selectedCate to set
     */
    public void setSelectedCate(String selectedCate) {
        this.selectedCate = selectedCate;
    }

}
