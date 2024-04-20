/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.demo.blog.dataBaseAccess;
import com.demo.blog.entities.Category;
import com.demo.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author hp
 */
public class PostDa {
    
    Connection con;

    public PostDa(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories(){
        ArrayList list=new ArrayList();
        
        try{
            String q="select * from categories";
            Statement st=this.con.createStatement();
            ResultSet set=st.executeQuery(q);
            while(set.next()){
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String des=set.getString("description");
                
                Category c=new Category(cid,name,des);
                list.add(c);
                
                
                
            }
            
            
            
        }
        catch (Exception e){
            e.printStackTrace();
        }
        
        
        return list;
    }
    
    
    
     public boolean savePost(Post p) {
        boolean f = false;
        try {

            String q = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
    
    
     
//     get all post
     public List<Post> getAllPosts(){
         List<Post> list=new ArrayList<>();
         try{
             String q="select * from posts order by pid desc";
             PreparedStatement pstm=con.prepareStatement(q);
             ResultSet set=pstm.executeQuery();
             while(set.next()){
                 int pid=set.getInt("pid");
                 String pTitle=set.getString("pTitle");
                 String pContent=set.getString("pContent");
                 String pCode=set.getString("pCode");
                 String pPic=set.getString("pPic");
                 Timestamp date=set.getTimestamp("pDate");
                 int catId=set.getInt("catId");
                 int userId=set.getInt("userId");
                 
                 Post ps=new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                 
                 list.add(ps);
             }
             
         }
         catch(Exception e){
             e.printStackTrace();
         }
         
//         fetch all post
         return list;
         
     }
     
     public List<Post> getPostByCatId(int catId){
         List<Post> list=new ArrayList<>();
         
         try{
             String q="select * from posts";
             PreparedStatement pstm=con.prepareStatement(q);
             ResultSet set=pstm.executeQuery();
             while(set.next()){
                 int pid=set.getInt("pid");
                 String pTitle=set.getString("pTitle");
                 String pContent=set.getString("pContent");
                 String pCode=set.getString("pCode");
                 String pPic=set.getString("pPic");
                 Timestamp date=set.getTimestamp("pDate");
                 int cId=set.getInt("catId");
                 int userId=set.getInt("userId");
                 
                 Post ps=new Post(pid, pTitle, pContent, pCode, pPic, date, cId, userId);
                 
                 list.add(ps);
             }
             
         }
         catch(Exception e){
             e.printStackTrace();
         }
         
         
         return list;
         
     }
     
     public Post getPOstByPostId(int postId){
         
         String q="select * from posts where pid=?";
         Post post=null;
         try{
              PreparedStatement pstm=this.con.prepareStatement(q);
              pstm.setInt(1,postId);
              
              ResultSet set=pstm.executeQuery();
              
              if(set.next()){
                  int pid=set.getInt("pid");
                 String pTitle=set.getString("pTitle");
                 String pContent=set.getString("pContent");
                 String pCode=set.getString("pCode");
                 String pPic=set.getString("pPic");
                 Timestamp date=set.getTimestamp("pDate");
                 int cId=set.getInt("catId");
                 int userId=set.getInt("userId");
                 
                  post=new Post(pid, pTitle, pContent, pCode, pPic, date, cId, userId);
              }

         }
         catch(Exception e){
             e.printStackTrace();
         }
         
         
         
         return post;
     }
}
