package model;

import java.util.Date;

public class User {
    private int id;
    private String firstName;
    private String lastName;
    private String phoneNumber;
    private String email;
    private String passwordHash;
    private boolean isAdmin;
    private boolean isVendor;
    private Date registeredAt;
    private Date lastLogin;
    private String intro;
    private String profile; 

    public User() {
    }

    public User(int id, String firstName, String lastName, String phoneNumber, String email, String passwordHash, boolean isAdmin, boolean isVendor, Date registeredAt, Date lastLogin, String intro, String profile) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.passwordHash = passwordHash;
        this.isAdmin = isAdmin;
        this.isVendor = isVendor;
        this.registeredAt = registeredAt;
        this.lastLogin = lastLogin;
        this.intro = intro;
        this.profile = profile;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public boolean isIsVendor() {
        return isVendor;
    }

    public void setIsVendor(boolean isVendor) {
        this.isVendor = isVendor;
    }

    public Date getRegisteredAt() {
        return registeredAt;
    }

    public void setRegisteredAt(Date registeredAt) {
        this.registeredAt = registeredAt;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    
    
}