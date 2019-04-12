/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thiennb.action;

import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import thiennb.daos.CategoryDAO;
import thiennb.dtos.CategoryDTO;

/**
 *
 * @author benfi
 */
public class AccessInsertProduct extends ActionSupport {

    private List<CategoryDTO> listCate;
    private String selectedCate;
    private List list;

    public List<CategoryDTO> getListCate() {
        return listCate;
    }

    public List getList() {
        list = new ArrayList();
        list.add(true);
        list.add(false);
        return list;
    }

    public void setList(List list) {
        this.list = list;
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

    public AccessInsertProduct() {
    }

    public String execute() throws Exception {
        initListCate();
        return SUCCESS;
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
