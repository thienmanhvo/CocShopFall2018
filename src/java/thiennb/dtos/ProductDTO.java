/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thiennb.dtos;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author benfi
 */
public class ProductDTO implements Serializable{

    private String productID, productName, description;
    private float priceSell, priceIn;
    private boolean isDelete, isSale, isNew, isBest;
    private String cate_ID;
    private int quantity;
    private List<ImageDTO> listImg;
    private float priceSale;

    public ProductDTO() {
    }

    public List<ImageDTO> getListImg() {
        return listImg;
    }

    public float getPriceSale() {
        return priceSale;
    }

    public void setPriceSale(float priceSale) {
        this.priceSale = priceSale;
    }

    public void setListImg(List<ImageDTO> listImg) {
        this.listImg = listImg;
    }

    public ProductDTO(String productID, String productName, String description, float priceSell, float priceIn, boolean isSale, boolean isNew, boolean isBest, float priceSale) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.priceSell = priceSell;
        this.priceIn = priceIn;
        this.isSale = isSale;
        this.isNew = isNew;
        this.isBest = isBest;
        this.priceSale = priceSale;
    }

    public ProductDTO(String productID, String productName, String description, float priceSell, float priceIn, boolean isDelete, boolean isSale, boolean isNew, boolean isBest, String cate_ID, int quantity, float priceSale) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.priceSell = priceSell;
        this.priceIn = priceIn;
        this.isDelete = isDelete;
        this.isSale = isSale;
        this.isNew = isNew;
        this.isBest = isBest;
        this.cate_ID = cate_ID;
        this.quantity = quantity;
        this.priceSale = priceSale;
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

    public boolean isIsDelete() {
        return isDelete;
    }

    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
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

}
