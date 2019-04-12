/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thiennb.action;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import thiennb.daos.UserDAO;
import thiennb.dtos.UserDTO;

/**
 *
 * @author benfi
 */
public class UpdateUserInfoAction extends ActionSupport {

    private String firstname, lastname, email, username, city, address, phone;
    private String findWhat, lastSearchUserValue, key;

    public String getFindWhat() {
        return findWhat;
    }

    public void setFindWhat(String findWhat) {
        this.findWhat = findWhat;
    }

    public String getLastSearchUserValue() {
        return lastSearchUserValue;
    }

    public void setLastSearchUserValue(String lastSearchUserValue) {
        this.lastSearchUserValue = lastSearchUserValue;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public UpdateUserInfoAction() {
    }

    public String execute() throws Exception {
        UserDAO dao = new UserDAO();
        UserDTO dto = new UserDTO(email, username, lastname, firstname, address, city, phone);
        Map session = ActionContext.getContext().getSession();
        session.put("NOTI", "true");
        if (dao.update(dto)) {
            session.put("SUCCESS", "Edit Success!");
            return SUCCESS;
        } else {
            session.put("ERROR", "Edit Failded!!");
            return ERROR;
        }
    }

    public void validate() {
        if (firstname.length() == 0) {
            addFieldError("firstname", "First Name can't be blank!");
        }
        if (lastname.length() == 0) {
            addFieldError("lastname", "Lastname Name can't be blank!");
        }
        if (email.length() == 0) {
            addFieldError("email", "Email can't be blank!");
        } else {
            if (!email.matches("\\w+@\\w+[.]\\w+")) {
                addFieldError("email", "Email must have @xxx.xxx, Ex: example@gmail.com");
            }
        }
        if (phone.length() != 0) {
            if (!phone.matches("[0]\\d{9}")) {
                addFieldError("phone", "Invalid phone Number.Phone number must have 10 number, first with 0");
            }
        }
        UserDTO dto = new UserDTO(email, username, lastname, firstname, address, city, phone);
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("USERTOEDIT", dto);
    }

}
