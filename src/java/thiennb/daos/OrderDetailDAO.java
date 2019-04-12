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
import thiennb.db.MyConnection;
import thiennb.dtos.OrderDetailDTO;

/**
 *
 * @author benfi
 */
public class OrderDetailDAO implements Serializable {
    
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
    
    public boolean insert(OrderDetailDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert into tbl_Order_Detail(Order_ID,Product_ID,Quantity,Total)"
                    + " values(?,?,?,?)";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            preSm.setInt(1, dto.getOder_ID());
            preSm.setString(2, dto.getProduct_ID());
            preSm.setInt(3, dto.getQuantity());
            preSm.setFloat(4, dto.getTotal());
            check = preSm.executeUpdate() > 0;
            
        } finally {
            closeConnection();
        }
        return check;
    }
}
