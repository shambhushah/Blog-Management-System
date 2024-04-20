/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.demo.blog.helper;

/**
 *
 * @author shambhu.shah
 */
import java.sql.*;
public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnection(){
        try{
            if(con==null){
                //driver class load
            Class.forName("com.mysql.jdbc.Driver");
            
            //create connection 
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demoblog","root","root");
            }
            
        }
        catch(Exception e){
            e.printStackTrace();}
        
        return con;
    }
    
}
