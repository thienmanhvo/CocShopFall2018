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
public class ImageDTO implements Serializable{

    private String imageID, path, prod_ID;

    public ImageDTO() {
    }

    public ImageDTO(String imageID, String path, String prod_ID) {
        this.imageID = imageID;
        this.path = path;
        this.prod_ID = prod_ID;
    }

    public String getImageID() {
        return imageID;
    }

    public void setImageID(String imageID) {
        this.imageID = imageID;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getProd_ID() {
        return prod_ID;
    }

    public void setProd_ID(String prod_ID) {
        this.prod_ID = prod_ID;
    }

}
