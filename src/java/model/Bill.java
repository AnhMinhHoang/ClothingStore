/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;

/**
 *
 * @author GoldCandy
 */
public class Bill implements Serializable{
    private String productImg;
    private String productName;
    private int productPrice;
    private int quantity;
    private int total;
    private int allTotal;

    public Bill() {
    }

    public Bill(String productImg, String productName, int productPrice, int quantity, int total, int allTotal) {
        this.productImg = productImg;
        this.productName = productName;
        this.productPrice = productPrice;
        this.quantity = quantity;
        this.total = total;
        this.allTotal = allTotal;
    }

    public int getAllTotal() {
        return allTotal;
    }

    public void setAllTotal(int allTotal) {
        this.allTotal = allTotal;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Bill{" + "productImg=" + productImg + ", productName=" + productName + ", productPrice=" + productPrice + ", quantity=" + quantity + ", total=" + total + ", allTotal=" + allTotal + '}';
    }
}
