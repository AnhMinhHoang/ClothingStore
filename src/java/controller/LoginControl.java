/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.UserDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.MessageDigest;
import model.User;

/**
 *
 * @author GoldCandy
 */
public class LoginControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        
        if(remember != null){
            Cookie cookieEmail = new Cookie("cookieEmail", email);
            Cookie cookiePass = new Cookie("cookiePass", password);
            Cookie cookieRemember = new Cookie("cookieRemember", remember);

            cookieEmail.setMaxAge(60*60*1);
            cookiePass.setMaxAge(60*60*1);
            cookieRemember.setMaxAge(60*60*1);

            response.addCookie(cookieEmail);
            response.addCookie(cookiePass);
            response.addCookie(cookieRemember);
        }

        HttpSession session = request.getSession();
        User user = authenticateUser(email, password);
        if (user != null) {
            session.setAttribute("currentUser", user);
            session.setAttribute("userID", user.getId());
            session.setAttribute("userEmail", email);
            session.setMaxInactiveInterval(600);

            if (user.isAdmin()) {

                response.sendRedirect("admin");
            } else {

                response.sendRedirect("Home");
            }

        } else {
            
            request.setAttribute("errorMessage", "login.wrong");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
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

    private User authenticateUser(String email, String password) {
        UserDAOImpl udi = new UserDAOImpl();
        User user = udi.findByEmail(email);

        try {
            String passwordHashed = hashPassword(password);
            if (user != null && user.getPasswordHash().equals(passwordHashed)) {
                return user;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
