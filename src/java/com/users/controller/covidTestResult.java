/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.users.controller;

import com.users.dao.userResultDao;
import com.users.model.userResultModel;
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
@WebServlet(name = "covidTestResult", urlPatterns = {"/covidTestResult"})
public class covidTestResult extends HttpServlet {

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
           
            String email = request.getParameter("email");
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
            
            userResultModel urm = new userResultModel();
            
            urm.setEmail(email);
            urm.setQuestion1(question1);
            urm.setQuestion2(question2);
            urm.setQuestion3(question3);
            urm.setQuestion4(question4);
            urm.setQuestion5(question5);
            urm.setQuestion6(question6);
            urm.setQuestion7(question7);
            urm.setQuestion8(question8);
            urm.setQuestion9(question9);
            urm.setQuestion10(question10);
            
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
            
            urm.setPoints(points);
  
            HttpSession session = request.getSession();
            
            userResultDao urd = new userResultDao();
  
            boolean b = urd.addUserResult(urm);
            
            if (b) {

                session.setAttribute("userResult", b);
                
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Thank you! your points are "+points+"');");
                out.println("location='./logout.jsp';");

                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('something is worng please try again later');");
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
