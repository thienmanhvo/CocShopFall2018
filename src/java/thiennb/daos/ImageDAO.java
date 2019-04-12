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

/**
 *
 * @author benfi
 */
public class ImageDAO implements Serializable {

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

    public List<ImageDTO> getAllImgByProductKey(String pro_ID) throws Exception {
        List<ImageDTO> result = null;
        try {
            String sql = "Select ImageID,Path from tbl_Image where Prod_ID=?";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            preSm.setString(1, pro_ID);
            rs = preSm.executeQuery();
            while (rs.next()) {
                if (result == null) {
                    result = new ArrayList<>();

                }
                String imageID = rs.getString("ImageID");
                String path = rs.getString("Path");
                ImageDTO dto = new ImageDTO(imageID, path, pro_ID);
                result.add(dto);
            }

        } finally {
            closeConnection();
        }
        return result;
    }
}
