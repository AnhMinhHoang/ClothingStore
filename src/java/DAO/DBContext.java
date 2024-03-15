package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBContext {
    
    private final String serverName = "GauDan\\GAUDAN";
    private final String dbName = "Project";
    private final String userID = "sa";
    private final String password = "minhvn2004";

    public Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://" + serverName + ";databaseName=" + dbName+";encrypt=false;trustServerCertificate=false;loginTimeout=30;";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }

    public void closeConnection(Connection con, PreparedStatement ps, ResultSet rs) throws SQLException {
        if (rs != null && !rs.isClosed()) {
            rs.close();
        }
        if (ps != null && !ps.isClosed()) {
            ps.close();
        }
        if (con != null && !con.isClosed()) {
            con.close();
        }
    }
    public static void main(String[] args) throws Exception {
        System.out.println(new DBContext().getConnection());
    }
}