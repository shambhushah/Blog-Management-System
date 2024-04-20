/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.demo.blog.servlets;

import com.demo.blog.dataBaseAccess.UserDa;
import com.demo.blog.entities.Message;
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
public class EditServlet extends HttpServlet {

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
            out.println("<title>Servlet EditServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            

            //fetch all data
            String email=request.getParameter("user_email");
            String name=request.getParameter("user_name");
            String password=request.getParameter("user_password");
            String about=request.getParameter("user_about");
            Part part=request.getPart("image");
            String imageName=part.getSubmittedFileName();
            
            //get the user from session
            
            HttpSession s=request.getSession();
            User user=(User)s.getAttribute("currenUser");
            
            user.setEmail(email);
            user.setName(name);
            user.setPassword(password);
            user.setAbout(about);
            String oldFile=user.getProfile();
            user.setProfile(imageName);
            
            //update to database
            UserDa userda=new UserDa(ConnectionProvider.getConnection());
            boolean ans=userda.updateUser(user);
            if(ans){
                
                String path=request.getRealPath("/")+"pic"+File.separator+user.getProfile();
                
                       String pathOld=request.getRealPath("/")+"pic"+File.separator+oldFile;
                       if(!pathOld.equals("default.png")){
                       }

                       

                
                 if(Helper.saveFile(part.getInputStream(),path)){
                     Message msg=new Message("profile details updated !","success","alert-success");
                 
                      s.setAttribute("msg", msg);
                            out.print("updated");

                        
                    
                }
                
                
                
            }
            else{
                out.print("not updated..");
                Message msg=new Message("Someething went wrong","failed","alert-danger");
                 
                      s.setAttribute("msg", msg);
            }
            response.sendRedirect("profile.jsp");
            
            
            
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
