/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.users.controller;

import com.users.dao.userDao;
import com.users.model.userModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Chetan
 */
@WebServlet(name = "userSignupServlet", urlPatterns = {"/userSignupServlet"})
public class userSignupServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String full_name = request.getParameter("full_name");
            String mobile_no = request.getParameter("mobile_no");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dose_status = request.getParameter("dose_status");
            String dose_type = request.getParameter("dose_type");
            String first_dose_date = request.getParameter("first_dose_date");
            String second_dose_date = request.getParameter("second_dose_date");
            String test_completed = request.getParameter("test_completed");
            
            userModel um = new userModel();
            um.setFull_name(full_name);
            um.setMobile_no(mobile_no);
            um.setEmail(email);
            um.setPassword(password);
            um.setDose_status(dose_status);
            um.setDose_type(dose_type);
            um.setFirst_dose_date(first_dose_date);
            um.setSecond_dose_date(second_dose_date);
            um.setTest_completed(test_completed);
            
            userDao ud = new userDao();
            
            userModel emailCheck = ud.userEmailCheck(um);
            
            if(emailCheck != null){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('email is already in use');");
                out.println("location='signup.jsp';");
                out.println("</script>");
                ud.deleteuser(um);
            }
            else {
            boolean b = ud.addUser(um);
                if(b){
                    out.println("<script type=\"text/javascript\">");
                out.println("alert('Account has been created successfully');");
                out.println("location='login.jsp';");

                out.println("</script>");
                }
                else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('something went worng, please try again later');");
                out.println("location='signup.jsp';");
                out.println("</script>");
            }
            }
            
            
            
            
        }
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
