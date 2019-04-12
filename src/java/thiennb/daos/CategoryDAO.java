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
import thiennb.dtos.CategoryDTO;

/**
 *
 * @author benfi
 */
public class CategoryDAO implements Serializable{

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

    public List<CategoryDTO> getAllCategory() throws Exception {
        List<CategoryDTO> result = null;
        try {
            String sql = "Select CategoryID,Name,Description from tbl_Category where isDelete =0";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            rs = preSm.executeQuery();
            while (rs.next()) {
                if (result == null) {
                    result = new ArrayList<>();
                }
                String categoryID = rs.getString("CategoryID");
                String name = rs.getString("Name");
                String description = rs.getString("Description");
                CategoryDTO dto = new CategoryDTO(categoryID, name, description);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;

    }

    public CategoryDTO findByPrimaryKey(String id) throws Exception {
        CategoryDTO result = null;
        try {

            String sql = "Select CategoryID,Name,Description from tbl_Category where isDelete =0 and  CategoryID =?";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            preSm.setString(1, id);
            rs = preSm.executeQuery();
            if (rs.next()) {
                String categoryID = rs.getString("CategoryID");
                String name = rs.getString("Name");
                String description = rs.getString("Description");
                result = new CategoryDTO(categoryID, name, description);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
