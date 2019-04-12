/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thiennb.dtos;

import java.io.Serializable;

/**
 *
 * @author benfi
 */
public class OrderDTO implements Serializable {

    private int oderID;
    private String user_Email;
    private float total;
    private boolean isDelete;

    public OrderDTO(int oderID, String user_Email, float total) {
        this.oderID = oderID;
        this.user_Email = user_Email;
        this.total = total;
    }

    public OrderDTO() {
    }

    /**
     * @return the oderID
     */
    public int getOderID() {
        return oderID;
    }

    /**
     * @param oderID the oderID to set
     */
    public void setOderID(int oderID) {
        this.oderID = oderID;
    }

    /**
     * @return the user_Email
     */
    public String getUser_Email() {
        return user_Email;
    }

    /**
     * @param user_Email the user_Email to set
     */
    public void setUser_Email(String user_Email) {
        this.user_Email = user_Email;
    }

    /**
     * @return the total
     */
    public float getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal(float total) {
        this.total = total;
    }

    /**
     * @return the isDelete
     */
    public boolean isIsDelete() {
        return isDelete;
    }

    /**
     * @param isDelete the isDelete to set
     */
    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
    }


    
}
