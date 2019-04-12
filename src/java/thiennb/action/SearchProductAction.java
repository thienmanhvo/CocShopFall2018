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
import thiennb.dtos.ImageDTO;
import thiennb.dtos.ProductDTO;

/**
 *
 * @author benfi
 */
public class SearchProductAction extends ActionSupport {

    private static final double NUMBER_OF_PRO_INPAGE = 6.0;
    private String proDSearch = null;
    private List<ProductDTO> listPro = null;
    private int numOfPage;

    private List<ImageDTO> listImg;
    private String path;

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }


    public List<ImageDTO> getListImg() {
        return listImg;
    }

    public void setListImg(List<ImageDTO> listImg) {
        this.listImg = listImg;
    }


    public SearchProductAction() {

    }


    public int getNumOfPage() {
        return numOfPage;
    }

    public void setNumOfPage(int numOfPage) {
        this.numOfPage = numOfPage;
    }

    public String getProDSearch() {
        return proDSearch;
    }

    public void setProDSearch(String proDSearch) {
        this.proDSearch = proDSearch;
    }

    public List<ProductDTO> getListPro() {
        return listPro;
    }

    public void setListPro(List<ProductDTO> listPro) {
        this.listPro = listPro;
    }

    public String execute() throws Exception {
        ProductDAO dao = new ProductDAO();
        listPro = dao.findByLikeName(proDSearch);
        numOfPage = (int) Math.ceil(listPro.size() / NUMBER_OF_PRO_INPAGE);
        Map session = ActionContext.getContext().getSession();
        HttpServletRequest request = ServletActionContext.getRequest();
        String str = (String) session.get("SHOWMSS");

        if (str != null) {
            request.setAttribute("SUCCESS", "Add to cart Successfully");
        }
        session.remove("SHOWMSS");
        return SUCCESS;
    }

    public void validate() {
        if (proDSearch.length() == 0) {
            addFieldError("proDSearch", "Search value can't be blank!");
        }
    }

}
