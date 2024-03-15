/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Product;

/**
 *
 * @author GoldCandy
 */
public class ProductDAOImpl extends DBContext{
    public ArrayList<Product> listAllProduct(){
        ArrayList<Product> list = new ArrayList<>();
        try(Connection con = getConnection()){
            String sql = ("Select * from products");
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                list.add(new Product(rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
        }
        catch(Exception e){
        }
        return list;
    }
    
    public ArrayList<Product> listAllCategory(String category){
        ArrayList<Product> list = new ArrayList<>();
        try(Connection con = getConnection()){
            String sql = ("select * from products "
                    + "where productType = ?");
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, category);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                list.add(new Product(rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
        }
        catch(Exception e){
        }
        return list;
    }
//    
//    public ArrayList<Product> listAllSearch(String search){
//        
//    }
//    
//    public ArrayList<Product> listAllSort(String type){
//        
//    }
    
    public static void main(String[] args) {
        ArrayList<Product> list = new ProductDAOImpl().listAllCategory("Tee");
        for(Product item: list){
            System.out.println(item);
        }
    }
}
