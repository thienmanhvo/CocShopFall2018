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

/**
 *
 * @author benfi
 */
public class AccessAdminAction extends ActionSupport {

    private List<String> searchUserTypeList;
    private String selectedSearchUserType;

    public List<String> getSearchUserTypeList() {
        return searchUserTypeList;
    }

    public void setSearchUserTypeList(List<String> searchUserTypeList) {
        this.searchUserTypeList = searchUserTypeList;
    }

    public String getSelectedSearchUserType() {
        return selectedSearchUserType;
    }

    public void setSelectedSearchUserType(String selectedSearchUserType) {
        this.selectedSearchUserType = selectedSearchUserType;
    }

    public AccessAdminAction() {
    }

    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();

        String role = (String) session.get("ROLE");

        if (role != null) {
            if (role.equals("admin")) {
                initializeList();
                return SUCCESS;
            } else {
                HttpServletRequest request = ServletActionContext.getRequest();
                request.setAttribute("ERROR", "You can't access to this page");
                return ERROR;
            }
        } else {
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("ERROR", "You must Login to access this page");
            return ERROR;
        }
    }

    private void initializeList() {

        searchUserTypeList = new ArrayList<String>();
        searchUserTypeList.add("Search By Email");
        searchUserTypeList.add("Search By Name");
        searchUserTypeList.add("Search By Username");
        searchUserTypeList.add("Search By Role");
        searchUserTypeList.add("Search By Telephone");
        searchUserTypeList.add("Search By Address");
        searchUserTypeList.add("Search By City");

    }
}
