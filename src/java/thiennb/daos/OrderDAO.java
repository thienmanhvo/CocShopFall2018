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
import java.util.List;
import thiennb.db.MyConnection;
import thiennb.dtos.OrderDTO;

/**
 *
 * @author benfi
 */
public class OrderDAO implements Serializable {

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

    public List<OrderDTO> getOrderByUserID(String id) throws Exception {
        List<OrderDTO> result = null;
        OrderDTO dto = null;
        try {
            String sql = "Select OderID,User_Email,Total from tbl_Order "
                    + "where User_Email =? and isDelete =0";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            preSm.setString(1, id);
            rs = preSm.executeQuery();
            while (rs.next()) {
                int oderID = rs.getInt("OderID");
                String user_Email = rs.getString("User_Email");
                float total = rs.getFloat("Total");
                dto = new OrderDTO(oderID, user_Email, total);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }

        return result;
    }

    public int getMaxID() throws Exception {
        int id = -1;
        try {
            String sql = "SELECT MAX(OrderID) as ID FROM tbl_Order";
            conn = MyConnection.getMyConnection();

            preSm = conn.prepareStatement(sql);
            rs = preSm.executeQuery();
            if (rs.next()) {
                id = rs.getInt("ID");
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    public boolean insert(OrderDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert into tbl_Order(User_Email,Total,isDelete)"
                    + " values(?,?,0)";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            ;
            preSm.setString(1, dto.getUser_Email());
            preSm.setFloat(2, dto.getTotal());
            check = preSm.executeUpdate() > 0;

        } finally {
            closeConnection();
        }
        return check;
    }

}
