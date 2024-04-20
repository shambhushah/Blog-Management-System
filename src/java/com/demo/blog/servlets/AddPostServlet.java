/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.demo.blog.servlets;

import com.demo.blog.dataBaseAccess.PostDa;
import com.demo.blog.entities.Post;
import com.demo.blog.entities.User;
import com.demo.blog.helper.ConnectionProvider;
import com.demo.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author hp
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddPostServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            out.println("hello");
            String pC=request.getParameter("pContent");
            String pTitle=request.getParameter("pTitle");
            String pProgram=request.getParameter("pProgram");
            int cid=Integer.parseInt(request.getParameter("cid"));
            
            Part pic=request.getPart("pic");
            
            
            HttpSession session=request.getSession();
            User user=(User)session.getAttribute("currenUser");
            
            Post p=new Post(pTitle,pC,pProgram,pic.getSubmittedFileName(),null,cid,user.getId());
            //out.println(p.getpTitle()+"this from object:");
            
            PostDa pd=new PostDa(ConnectionProvider.getConnection());
            
            if(pd.savePost(p)){
                String path = request.getRealPath("/") + "pic" + File.separator + pic.getSubmittedFileName();
                Helper.saveFile(pic.getInputStream(), path);
                out.println("done");
                
            }
            else{
                out.println("error");
                
            }
            
          
            out.println("</body>");
            out.println("</html>");
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
