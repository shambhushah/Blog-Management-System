<%-- 
    Document   : index
    Created on : Mar 25, 2024, 4:14:26 PM
    Author     : shambhu.shah
--%>

<%@page import="java.util.List"%>
<%@page import="com.demo.blog.dataBaseAccess.PostDa"%>
<%@page import="com.demo.blog.entities.User"%>
<%@page import="com.demo.blog.entities.Post"%>
<%@page import="com.demo.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

         <style>
              .banner-background{
                   clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 94%, 68% 84%, 31% 88%, 0 93%, 0 0);




                    }
         </style>
    </head>
    <body>
        <!--nav bar-->
        <%@include file="normal_navbar.jsp" %>
        
        <!--banner-->
        
        <div class="conatainer-fluid banner-background">
            <div class="jumbotron primary-background text-white">
                <div class="container">
                <h3 class="display-3" style="font-weight:500">Welcome</h3>
                <hr>
                <h3 style="font-weight:400">Blog</h3>
                <p style="font-weight:400;font-size: 20px">Welcome to the Blog Management System, your destination for expressing your creativity and connecting with others through written content. Whether it's sharing your personal experiences, discussing your passions, or exploring new ideas, this platform provides you with the tools to make your voice heard and engage with a community of like-minded individuals. Start writing, sharing, and inspiring today!</p>
                <button class="btn btn-outine-light btn-lg"><span class="fa fa-edit"></span> starts! it's free</button>
                <a href="login_page.jsp" class="btn btn-outine-light btn-lg"><span class="fa fa-user-circle-o fa-spin"></span> login</a>
                </div>
            </div>
            
            
        </div>
        <br>
        <%
            

    
                Post ps=new Post();
                PostDa d=new PostDa(ConnectionProvider.getConnection());

                List<Post> ls=d.getAllPosts();
                for(Post l:ls){
                
            
               %>
               
               
            
        <!--cards-->
        <div class="container">
             
                 <div class="card-group my-2">
  <div class="card">
    <img class="card-img-top" src="<%=l.getpPic() %>" alt="Card image cap">
    <div class="card-body">
      <h5 class="card-title"><%=l.getpTitle() %></h5>
      <p class="card-text"><%=l.getpContent() %></p>
      <p class="card-text"><small class="text-muted"><%=l.getpDate() %></small></p>
    </div>
  </div>
    <div class="card mx-2">
    <img class="card-img-top" src="<%=l.getpPic() %>" alt="Card image cap">
    <div class="card-body">
      <h5 class="card-title"><%=l.getpTitle() %></h5>
      <p class="card-text"><%=l.getpContent() %></p>
      <p class="card-text"><small class="text-muted"><%=l.getpDate() %></small></p>
    </div>
  </div>
 
</div>

        </div>
                             <% 
                   }
               %>
       
        
        
        
        
        <!--//java script-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
   
<script>
//    $(document).ready(function(){
//        alert("document loaded");
//    })
    
    </script>
    
    </body>
</html>
