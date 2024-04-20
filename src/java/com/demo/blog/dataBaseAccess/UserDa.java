/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.demo.blog.dataBaseAccess;
import com.demo.blog.entities.User;
import java.sql.*;

/**
 *
 * @author hp
 */
public class UserDa {
    private Connection con;

    public UserDa(Connection con) {
        this.con=con;
    }
    
//    method to insert user's data to the database
    
    public boolean saveUser(User user){
         boolean f=false;

        try{
            //user database
            String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement pstm= this.con.prepareStatement(query);
            pstm.setString(1,user.getName());
            pstm.setString(2,user.getEmail());
            pstm.setString(3,user.getPassword());
            pstm.setString(4,user.getGender());
            pstm.setString(5,user.getAbout());
            
            pstm.executeUpdate();
            f=true;
            
            
        }
        catch(Exception e){
            e.printStackTrace();
            
        }
        return f;
    }
    //get  user by username and userpasswor
    
    public User getUserByEmailAndPassword(String email,String password){
        User user=null;
        try{
            String query="select * from user where email=? and password=?";
            PreparedStatement pstm=con.prepareStatement(query);
            pstm.setString(1, email);
            pstm.setString(2, password);
            
            ResultSet set=pstm.executeQuery();
            
            if(set.next()){
                user=new User();
                String name=set.getString("name");
                user.setName(name);
                
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return user;
        
       
    
    
    

    
    
        
    
    }
    
    
    public boolean updateUser(User user){
        boolean f=false;
        try{
            String query="update user set name=?,email=?,password=?, gender=?,about=?,profile=? where id=?";
            PreparedStatement p=con.prepareStatement(query);
            p.setString(1,user.getName());
            p.setString(2,user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5,user.getAbout());
            p.setString(6,user.getProfile());
            p.setInt(7, user.getId());
            
            
            p.executeUpdate();
            f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    public User getUserByUserId(int userId){
        User user=null;
        
        String q="select * from user where id=?";
        
        try{
            PreparedStatement p=con.prepareStatement(q);
            p.setInt(1,userId);
            ResultSet set=p.executeQuery();
            if(set.next()){
                user=new User();
                String name=set.getString("name");
                user.setName(name);
                
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }

            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        
        return  user;
    }
}
