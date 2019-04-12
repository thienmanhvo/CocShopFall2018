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
import thiennb.daos.UserDAO;
import thiennb.dtos.UserDTO;

/**
 *
 * @author benfi
 */
public class SearchUserAction extends ActionSupport {

    private List<String> searchUserTypeList;
    private String selectedSearchUserType;
    private String userSearch;
    private List<UserDTO> listSearchUser;

    public List<UserDTO> getListSearchUser() {
        return listSearchUser;
    }

    public void setListSearchUser(List<UserDTO> listSearchUser) {
        this.listSearchUser = listSearchUser;
    }

    public String getUserSearch() {
        return userSearch;
    }

    public void setUserSearch(String userSearch) {
        this.userSearch = userSearch;
    }

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

    public SearchUserAction() {
    }

    public String execute() throws Exception {
        UserDAO dao = new UserDAO();
        Map session = ActionContext.getContext().getSession();

        String noti = (String) session.get("NOTI");
        if (noti != null) {
            if (!noti.equalsIgnoreCase("true")) {
                session.remove("SUCCESS");
                session.remove("ERROR");
            }
        } else {
            session.remove("SUCCESS");
            session.remove("ERROR");
        }
        session.remove("NOTI");
        if (selectedSearchUserType.equals("Search By Name")) {

            listSearchUser = dao.searchByLikeName(userSearch);
            return SUCCESS;
        } else if (selectedSearchUserType.equals("Search By Email")) {
            listSearchUser = dao.searchByLike(userSearch, "Email");
            return SUCCESS;
        } else if (selectedSearchUserType.equals("Search By Username")) {
            listSearchUser = dao.searchByLike(userSearch, "Username");
            return SUCCESS;
        } else if (selectedSearchUserType.equals("Search By Role")) {
            listSearchUser = dao.searchByLike(userSearch, "Role");
            return SUCCESS;
        } else if (selectedSearchUserType.equals("Search By Telephone")) {
            listSearchUser = dao.searchByLike(userSearch, "Telephone");
            return SUCCESS;
        } else if (selectedSearchUserType.equals("Search By Address")) {
            listSearchUser = dao.searchByLike(userSearch, "Address");
            return SUCCESS;
        } else if (selectedSearchUserType.equals("Search By City")) {
            listSearchUser = dao.searchByLike(userSearch, "City");
            return SUCCESS;
        } else {
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("ERROR", "Not support");
            return ERROR;
        }
    }

    public void validate() {
        if (userSearch.length() == 0) {
            addFieldError("userSearch", "Search Value can't be blank!");
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("SEARCHINVALID", "Search Value can't be blank!");
        }
    }
}
