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

/**
 *
 * @author Chetan
 */
@WebServlet(name = "userTestResultServlet", urlPatterns = {"/userTestResultServlet"})
public class userTestResultServlet extends HttpServlet {

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
            
            
            
           long ids = Long.parseLong(request.getParameter("id"));
            userDao sdd = new userDao();
            userModel um = sdd.getByUserId(ids);
            
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet StaffLoginServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet StaffLoginServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
            
            String full_name = request.getParameter("full_name");
            String mobile_no = request.getParameter("mobile_no");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dose_status = request.getParameter("dose_status");
            String dose_type = request.getParameter("dose_type");
            String first_dose_date = request.getParameter("first_dose_date");
            String second_dose_date = request.getParameter("second_dose_date");
            String test_completed = request.getParameter("test_completed");
            
            um.setId(ids);
            um.setFull_name(full_name);
            um.setMobile_no(mobile_no);
            um.setEmail(email);
            um.setPassword(password);
            um.setDose_status(dose_status);
            um.setDose_type(dose_type);
            um.setFirst_dose_date(first_dose_date);
            um.setSecond_dose_date(second_dose_date);
            um.setTest_completed(test_completed);
            
            String question1 = request.getParameter("question1");
            String question2 = request.getParameter("question2");
            String question3 = request.getParameter("question3");
            String question4 = request.getParameter("question4");
            String question5 = request.getParameter("question5");
            String question6 = request.getParameter("question6");
            String question7 = request.getParameter("question7");
            String question8 = request.getParameter("question8");
            String question9 = request.getParameter("question9");
            String question10 = request.getParameter("question10");
            
            
            int points = 0;
            
            if("yes".equals(question1)){
                points++;
            }
            if("yes".equals(question2)){
                points++;
            }
            if("yes".equals(question3)){
                points++;
            }
            if("yes".equals(question4)){
                points++;
            }
            if("yes".equals(question5)){
                points++;
            }
            if("yes".equals(question6)){
                points++;
            }
            if("yes".equals(question7)){
                points++;
            }
            if("yes".equals(question8)){
                points++;
            }
            if("yes".equals(question9)){
                points++;
            }
            if("yes".equals(question10)){
                points++;
            }
            
            um.setTest_result(points);
            
            userDao ud = new userDao();
            
            boolean b = ud.updateUser(um);
            
            if (b) {

                out.println("<script type=\"text/javascript\">");
                out.println("alert('your points are "+points+"');");
                out.println("location='./userHome.jsp';");

                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('something is worng');");
                out.println("location='./userHome.jsp';");
                out.println("</script>");
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
