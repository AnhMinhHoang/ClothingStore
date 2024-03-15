package DAO;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

public class UserDAOImpl extends DBContext implements UserDAO {

    @Override
    public boolean insertUser(String firstName, String lastName, String email, String password) {
        try {
            
            Connection conn = getConnection();
            // Hash the password using SHA-256
            String hashedPassword = hashPassword(password);
            System.out.println(hashedPassword);
            String sql = "INSERT INTO users (first_name, last_name, email, passwordHash) VALUES (?, ?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, firstName);
                pstmt.setString(2, lastName);
                pstmt.setString(3, email);
                pstmt.setString(4, hashedPassword);
                
                int rowsAffected = pstmt.executeUpdate();
                
                return rowsAffected > 0;
            }
        } catch (Exception e) {
        }
        return false;
    }

    private String hashPassword(String password) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] encodedHash = digest.digest(password.getBytes());

        StringBuilder hexString = new StringBuilder(2 * encodedHash.length);
        for (byte b : encodedHash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }

    @Override
    public User findByEmail(String email) {
        String query = "SELECT * FROM users WHERE email=?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

       
            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int id = rs.getInt("id"); 
                    String firstName = rs.getString("first_name");
                    String lastName = rs.getString("last_name");
                    String password = rs.getString("passwordHash");
            
                    User user = new User();
                    user.setId(id);
                    user.setFirstName(firstName);
                    user.setLastName(lastName);
                    user.setPasswordHash(password);

                    
                    return user;
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }
        return null;
    }
}