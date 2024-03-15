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
public class Product implements Serializable{
    private String productName;
    private int productPrice;
    private String productImg;
    private String productDescription;
    private String productType;
    private int total;

    public Product() {
    }

    public Product(String productName, int productPrice, String productImg, String productDescription, String productType) {
        this.productName = productName;
        this.productPrice = productPrice;
        this.productImg = productImg;
        this.productDescription = productDescription;
        this.productType = productType;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
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

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }
    
    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Product{" + "productName=" + productName + ", productPrice=" + productPrice + ", productImg=" + productImg + ", productDescription=" + productDescription + ", productType=" + productType + '}';
    }
}
