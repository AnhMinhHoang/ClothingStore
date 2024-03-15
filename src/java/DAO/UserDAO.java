package DAO;

// register 

import model.User;

public interface UserDAO  {
    boolean insertUser(String firstName,String lastName,String email,String password);
    User findByEmail(String email);
}