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
import thiennb.dtos.UserDTO;

/**
 *
 * @author benfi
 */
public class UserDAO implements Serializable {

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

    public List<UserDTO> searchByLikeName(String name) throws Exception {
        List<UserDTO> result = null;
        try {
            String sql = "Select Email,Username,Firstname,Lastname,Role,Telephone,Address,City From tbl_Users where ((Firstname like ? or Lastname like ?) and isDelete = 0) "
                    + "and Role != 'admin'";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            preSm.setString(1, "%" + name + "%");
            preSm.setString(2, "%" + name + "%");
//            preSm.setString(3, adminEmail);
            rs = preSm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String email = rs.getString("Email");
                String username = rs.getString("Username");
                String firstname = rs.getString("Firstname");
                String lastname = rs.getString("Lastname");
                String telephone = rs.getString("Telephone");
                String role = rs.getString("Role");
                String address = rs.getString("Address");
                String city = rs.getString("City");
                UserDTO dto = new UserDTO(email, username, lastname, firstname, address, city, telephone);
                dto.setRole(role);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<UserDTO> searchByLike(String search, String likeWhat) throws Exception {
        List<UserDTO> result = null;
        try {
            String sql = "";
            if (likeWhat.equalsIgnoreCase("email")) {
                sql = "Select Email,Username,Firstname,Lastname,Role,Telephone,Address,City From tbl_Users where (Email like ? and isDelete = 0) "
                        + "and Role != 'admin'";
            } else if (likeWhat.equalsIgnoreCase("username")) {
                sql = "Select Email,Username,Firstname,Lastname,Role,Telephone,Address,City From tbl_Users where (Username like ? and isDelete = 0) "
                        + "and Role != 'admin'";
            } else if (likeWhat.equalsIgnoreCase("role")) {
                sql = "Select Email,Username,Firstname,Lastname,Role,Telephone,Address,City From tbl_Users where (Role like ? and isDelete = 0) "
                        + "and Role != 'admin'";
            } else if (likeWhat.equalsIgnoreCase("telephone")) {
                sql = "Select Email,Username,Firstname,Lastname,Role,Telephone,Address,City From tbl_Users where (Telephone like ? and isDelete = 0) "
                        + "and Role != 'admin'";
            } else if (likeWhat.equalsIgnoreCase("Address")) {
                sql = "Select Email,Username,Firstname,Lastname,Role,Telephone,Address,City From tbl_Users where (Address like ? and isDelete = 0) "
                        + "and Role != 'admin'";
            } else if (likeWhat.equalsIgnoreCase("City")) {
                sql = "Select Email,Username,Firstname,Lastname,Role,Telephone,Address,City From tbl_Users where (City like ? and isDelete = 0) "
                        + "and Role != 'admin'";
            }
            if (sql.length() == 0) {
                return null;
            }
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            preSm.setString(1, "%" + search + "%");
//            preSm.setString(2, adminEmail);
            rs = preSm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String email = rs.getString("Email");
                String username = rs.getString("Username");
                String firstname = rs.getString("Firstname");
                String lastname = rs.getString("Lastname");
                String telephone = rs.getString("Telephone");
                String role = rs.getString("Role");
                String address = rs.getString("Address");
                String city = rs.getString("City");
                UserDTO dto = new UserDTO(email, username, lastname, firstname, address, city, telephone);
                dto.setRole(role);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean delete(String email) throws Exception {
        boolean check = false;
        try {
            String sql = "Update tbl_Users Set isDelete = 1 where Email =?";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            preSm.setString(1, email);
            check = preSm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public String checkLogin(String email, String password) throws Exception {
        String role = "failed";
        try {
            String sql = "Select Role From tbl_Users where Email =? and Password =? and isDelete =0";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            preSm.setString(1, email);
            preSm.setString(2, password);
            rs = preSm.executeQuery();
            if (rs.next()) {
                role = rs.getString("Role");
            }
        } finally {
            closeConnection();
        }
        return role;
    }

    public String getRoleByKey(String email) throws Exception {
        String role = "failed";
        try {
            String sql = "Select Role From tbl_Users where Email =? and isDelete =0";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            preSm.setString(1, email);
            rs = preSm.executeQuery();
            if (rs.next()) {
                role = rs.getString("Role");
            }
        } finally {
            closeConnection();
        }
        return role;
    }

    public boolean insert(UserDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert into tbl_Users(Email,Username,Lastname,Firstname,Password,Role,isDelete) Values(?,?,?,?,?,?,0)";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            preSm.setString(1, dto.getEmail());
            preSm.setString(2, dto.getUsername());
            preSm.setString(3, dto.getLastname());
            preSm.setString(4, dto.getFirstname());
            preSm.setString(5, dto.getPassword());
            preSm.setString(6, dto.getRole());
            check = preSm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean update(UserDTO dto) throws Exception {

        boolean check = false;
        try {
            String sql = "Update tbl_Users set Username =?,Lastname=?,Firstname =?,"
                    + "Telephone=?,Address=?,City=? where Email=? ";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            preSm.setString(1, dto.getUsername());
            preSm.setString(2, dto.getLastname());
            preSm.setString(3, dto.getFirstname());
            preSm.setString(4, dto.getTelephone());
            preSm.setString(5, dto.getAddress());
            preSm.setString(6, dto.getCity());
            preSm.setString(7, dto.getEmail());
            check = preSm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean updatePassword(String email, String password) throws Exception {

        boolean check = false;
        try {
            String sql = "Update tbl_Users set Password=? where Email=? and isDelete =0";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            preSm.setString(1, password);
            preSm.setString(2, email);

            check = preSm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public UserDTO getUserByEmail(String email) throws Exception {
        UserDTO dto = null;
        try {
            String sql = "Select Username,Lastname,Firstname,Telephone,Address,City,Role From tbl_Users where Email =? and isDelete =0";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            preSm.setString(1, email);
            rs = preSm.executeQuery();
            if (rs.next()) {
                String username = rs.getString("Username");
                String lastname = rs.getString("Lastname");
                String firstname = rs.getString("Firstname");
                String telephone = rs.getString("Telephone");
                String address = rs.getString("Address");
                String city = rs.getString("City");
                String role = rs.getString("Role");
                dto = new UserDTO(email, username, lastname, firstname, address, city, telephone);
                dto.setRole(role);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public String getUserPasswordByKey(String email) throws Exception {
        String pass = null;
        try {
            String sql = "Select Password from tbl_Users where Email=? and isDelete =0";
            conn = MyConnection.getMyConnection();
            preSm = conn.prepareStatement(sql);
            preSm.setString(1, email);
            rs = preSm.executeQuery();
            if (rs.next()) {
                pass = rs.getString("Password");
            }
        } finally {
            closeConnection();
        }
        return pass;
    }

}
