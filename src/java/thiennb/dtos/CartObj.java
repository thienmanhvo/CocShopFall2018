/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thiennb.dtos;

import java.io.Serializable;
import java.util.HashMap;

/**
 *
 * @author benfi
 */
public class CartObj implements Serializable {

    private String customerEmail;
    private HashMap<String, ProductOder> cart;

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public HashMap<String, ProductOder> getCart() {
        return cart;
    }

    public void setCart(HashMap<String, ProductOder> cart) {
        this.cart = cart;
    }

    public CartObj(String customerEmail) {
        this.customerEmail = customerEmail;
        this.cart = new HashMap<>();
    }

    public CartObj() {
        this.customerEmail = "Guest";
        this.cart = new HashMap<>();
    }

    public void addToCart(ProductOder dto) throws Exception {
        if (this.cart.containsKey(dto.getProductID())) {
            int quantity = this.cart.get(dto.getProductID()).getQuantity() + 1;
            dto.setQuantity(quantity);
        }
        this.cart.put(dto.getProductID(), dto);
    }

    public void removeCart(String id) throws Exception {
        if (this.cart.containsKey(id)) {
            this.cart.remove(id);
        }
    }

    public float getTotal() throws Exception {
        float result = 0;
        for (ProductOder dto : this.cart.values()) {
            result += (dto.getQuantity() * dto.getPriceSell());
        }
        return result;
    }

    public void add(ProductOder dto) throws Exception {
        if (this.cart.containsKey(dto.getProductID())) {
            int quantity = this.cart.get(dto.getProductID()).getQuantity() + 1;
            dto.setQuantity(quantity);
        }
        this.cart.put(dto.getProductID(), dto);
    }

    public void remove(String id) throws Exception {
        if (this.cart.containsKey(id)) {
            this.cart.remove(id);
        }
    }

    public float getTotall() throws Exception {
        float result = 0;
        for (ProductOder productOder : this.cart.values()) {
            result += (productOder.getQuantity()) * productOder.getPriceSell();
        }
        return result;
    }
}
