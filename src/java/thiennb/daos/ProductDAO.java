/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thiennb.daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import thiennb.db.MyConnection;
import thiennb.dtos.ImageDTO;
import thiennb.dtos.ProductDTO;

/**
 *
 * @author benfi
 */
public class ProductDAO implements Serializable {

    private Connection conn;
    private PreparedStatement preSm;
    ResultSet rs;

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (preSm != null) {
            preSm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public List<ProductDTO> getAllProduct() throws Exception {
        List<ProductDTO> result = null;
        try {
            String sql = "Select ProductID,ProductName,Description,PriceSell,PriceIn,isSale,isNew,isBest,PriceSale from tbl_Product "
                    + "where isDelete = 0";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            rs = preSm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String productID = rs.getString("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                float priceSell = rs.getFloat("PriceSell");
                float priceIn = rs.getFloat("PriceIn");
                boolean isSale = rs.getBoolean("isSale");
                boolean isNew = rs.getBoolean("isNew");
                boolean isBest = rs.getBoolean("isBest");
                float priceSale = rs.getFloat("PriceSale");
                ImageDAO dao = new ImageDAO();
                List<ImageDTO> list = dao.getAllImgByProductKey(productID);
                ProductDTO dto = new ProductDTO(productID, productName, description, priceSell, priceIn, isSale, isNew, isBest, priceSale);
                dto.setListImg(list);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<ProductDTO> findByLikeName(String search) throws Exception {
        List<ProductDTO> result = null;
        ProductDTO dto = null;
        try {
            String sql = "Select ProductID,ProductName,Description,PriceSell,PriceIn,isSale,isNew,isBest,Cate_ID,Quantity,PriceSale from tbl_Product"
                    + " where ProductName like ? and isDelete =0 ";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            preSm.setString(1, "%" + search + "%");
            rs = preSm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String productID = rs.getString("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                float priceSell = rs.getFloat("PriceSell");
                float priceIn = rs.getFloat("PriceIn");
                boolean isSale = rs.getBoolean("isSale");
                boolean isNew = rs.getBoolean("isNew");
                boolean isBest = rs.getBoolean("isBest");
                String cate_ID = rs.getString("Cate_ID");
                int quantity = rs.getInt("Quantity");
                float priceSale = rs.getFloat("PriceSale");
                ImageDAO dao = new ImageDAO();
                List<ImageDTO> list = dao.getAllImgByProductKey(productID);
                dto = new ProductDTO(productID, productName, description, priceSell, priceIn, isBest, isSale, isNew, isBest, cate_ID, quantity, priceSale);
                dto.setListImg(list);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<ProductDTO> findByLikeNameOrID(String search) throws Exception {
        List<ProductDTO> result = null;
        ProductDTO dto = null;
        try {
            String sql = "Select ProductID,ProductName,Description,PriceSell,PriceIn,isSale,isNew,isBest,Cate_ID,Quantity,PriceSale from tbl_Product"
                    + " where (ProductName like ? or ProductID like ?) and isDelete =0";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            preSm.setString(1, "%" + search + "%");
            preSm.setString(2, "%" + search + "%");
            rs = preSm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String productID = rs.getString("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                float priceSell = rs.getFloat("PriceSell");
                float priceIn = rs.getFloat("PriceIn");
                boolean isSale = rs.getBoolean("isSale");
                boolean isNew = rs.getBoolean("isNew");
                boolean isBest = rs.getBoolean("isBest");
                String cate_ID = rs.getString("Cate_ID");
                int quantity = rs.getInt("Quantity");
                float priceSale = rs.getFloat("PriceSale");
                ImageDAO dao = new ImageDAO();
                List<ImageDTO> list = dao.getAllImgByProductKey(productID);
                dto = new ProductDTO(productID, productName, description, priceSell, priceIn, isBest, isSale, isNew, isBest, cate_ID, quantity, priceSale);
                dto.setListImg(list);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean delete(String key) throws Exception {
        boolean check = false;
        try {
            String sql = "Update tbl_Product Set isDelete = 1 where ProductID =?";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            preSm.setString(1, key);
            check = preSm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public ProductDTO getProductByPrimaryKey(String key) throws Exception {
        ProductDTO result = null;
        try {
            String sql = "Select ProductID,ProductName,Description,PriceSell,PriceIn,isSale,isNew,isBest,Cate_ID,Quantity,PriceSale from tbl_Product"
                    + " where  ProductID=? and isDelete =0";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            preSm.setString(1, key);
            rs = preSm.executeQuery();
            if (rs.next()) {
                String productID = rs.getString("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                float priceSell = rs.getFloat("PriceSell");
                float priceIn = rs.getFloat("PriceIn");
                boolean isSale = rs.getBoolean("isSale");
                boolean isNew = rs.getBoolean("isNew");
                boolean isBest = rs.getBoolean("isBest");
                String cate_ID = rs.getString("Cate_ID");
                int quantity = rs.getInt("Quantity");
                float priceSale = rs.getFloat("PriceSale");
                ImageDAO dao = new ImageDAO();
                List<ImageDTO> list = dao.getAllImgByProductKey(productID);
                result = new ProductDTO(productID, productName, description, priceSell, priceIn, isBest, isSale, isNew, isBest, cate_ID, quantity, priceSale);
                result.setListImg(list);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean update(ProductDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "Update tbl_Product set ProductName=?,Description=?,PriceSell=?,PriceIn=?,isSale=?,isNew=?,isBest=?,"
                    + "Cate_ID=?,Quantity=?,PriceSale=? "
                    + " where  ProductID=?";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            preSm.setString(1, dto.getProductName());
            preSm.setString(2, dto.getDescription());
            preSm.setFloat(3, dto.getPriceSell());
            preSm.setFloat(4, dto.getPriceIn());
            preSm.setBoolean(5, dto.isIsSale());
            preSm.setBoolean(6, dto.isIsNew());
            preSm.setBoolean(7, dto.isIsBest());
            preSm.setString(8, dto.getCate_ID());
            preSm.setInt(9, dto.getQuantity());
            preSm.setFloat(10, dto.getPriceSale());
            preSm.setString(11, dto.getProductID());
            check = preSm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean insert(ProductDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert into tbl_Product(ProductID,ProductName,Description,PriceSell,PriceIn,isSale,isNew,isBest,Cate_ID,Quantity,PriceSale,isDelete)"
                    + " values(?,?,?,?,?,?,?,?,?,?,?,0)";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            preSm.setString(1, dto.getProductID());
            preSm.setString(2, dto.getProductName());
            preSm.setString(3, dto.getDescription());
            preSm.setFloat(4, dto.getPriceSell());
            preSm.setFloat(5, dto.getPriceIn());
            preSm.setBoolean(6, dto.isIsSale());
            preSm.setBoolean(7, dto.isIsNew());
            preSm.setBoolean(8, dto.isIsBest());
            preSm.setString(9, dto.getCate_ID());
            preSm.setInt(10, dto.getQuantity());
            preSm.setFloat(11, dto.getPriceSale());
            check = preSm.executeUpdate() > 0;

        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean getQuantityProduct(String id) throws Exception {
        boolean check = false;
        return check;
    }
}
