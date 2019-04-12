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
public class OrderDetailDTO implements Serializable{

    private int id, oder_ID;
    private String product_ID;
    int quantity;
    private float total;

    public OrderDetailDTO(int id, int oder_ID, String product_ID, int quantity, float total) {
        this.id = id;
        this.oder_ID = oder_ID;
        this.product_ID = product_ID;
        this.quantity = quantity;
        this.total = total;
    }

    public OrderDetailDTO() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOder_ID() {
        return oder_ID;
    }

    public void setOder_ID(int oder_ID) {
        this.oder_ID = oder_ID;
    }

    public String getProduct_ID() {
        return product_ID;
    }

    public void setProduct_ID(String product_ID) {
        this.product_ID = product_ID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }
    
}
