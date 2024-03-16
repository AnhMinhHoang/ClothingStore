/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Bill;
import model.Product;

/**
 *
 * @author GoldCandy
 */
public class ProductDAOImpl extends DBContext {

    public ArrayList<Product> listAllProduct() {
        ArrayList<Product> list = new ArrayList<>();
        try (Connection con = getConnection()) {
            String sql = ("Select * from products");
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Product> listAllCategory(String category) {
        ArrayList<Product> list = new ArrayList<>();
        try (Connection con = getConnection()) {
            String sql = ("select * from products "
                    + "where productType = ?");
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, category);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void insertBill(int productID, int userID) {
        try (Connection con = getConnection()) {
            String sql = ("insert into bills values(?, ?)");
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, productID);
            stmt.setInt(2, userID);
            stmt.executeQuery();
        } catch (Exception e) {
        }
    }

    public ArrayList<Bill> getAllUserCart(int id) {
        ArrayList<Bill> list = new ArrayList<>();
        try (Connection con = getConnection()) {
            String sql = ("select productImg, productName, productPrice, Count(bills.productId) as quantity, Sum(products.productPrice) as total,"
                    + "("
                    + "	select sum(products.productPrice) from bills"
                    + "	join products on bills.productId = products.productId"
                    + "	join users on bills.userId = users.id "
                    + "	where users.id = ?"
                    + ") as allTotal"
                    + " from bills"
                    + " join products on bills.productId = products.productId"
                    + " join users on bills.userId = users.id  "
                    + " where users.id = ?"
                    + " group by productImg, productName, productPrice");
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.setInt(2, id);
            stmt.executeQuery();
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Bill( rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public void purchase(int id){
        try (Connection con = getConnection()) {
            String sql = ("delete from bills where userId = ?");
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.executeQuery();
        } 
        catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        ArrayList<Bill> list = new ProductDAOImpl().getAllUserCart(1);
        System.out.println(list.size());
        for (Bill item : list) {
            System.out.println(item);
        }
    }
}
