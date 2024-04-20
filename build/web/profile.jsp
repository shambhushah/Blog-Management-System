<%-- 
    Document   : profile
    Created on : Mar 27, 2024, 6:12:24 PM
    Author     : hp
--%>
<%@page import="java.util.List"%>
<%@page import="com.demo.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.blog.entities.Category"%>
<%@page import="com.demo.blog.dataBaseAccess.PostDa"%>
<%@page import="com.demo.blog.helper.ConnectionProvider"%>
<%@page import="com.demo.blog.entities.Message"%>
<%@page errorPage="error_page.jsp" %>
<%@page import="com.demo.blog.entities.User"%>
 <%
           User user=(User)session.getAttribute("currenUser");
    
            if(user==null){
                    response.sendRedirect("login_page.jsp");
                }
    %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <!--css-->
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <style>
             body{
                background: url(img/backgr.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
       
        
        <!--//nav bar-->
        
         <nav class="navbar navbar-expand-lg navbar-light primary-background">
            <a href="index.jsp" class="navbar-brand" href="#"><span class="fa fa-asterisk	
"></span> Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="#"><span class="fa fa-bell"></span> Learn with  <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fa fa-edit"></span>
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming language</a>
          <a class="dropdown-item" href="#">Data structure</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Artificial</a>
        </div>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="#"><span class="fa fa-id-badge"></span> Contact</a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span> doPost</a>
      </li>
      
     
     
    </ul>
      <ul class="navbar-nav mr-right">
           <li class="nav-item">
          <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-model" ><span class="fa fa-user-circle "></span> <%= user.getName()  %></a>
      </li>
           <li class="nav-item">
          <a class="nav-link" href="LogoutServlet"><i class="fa fa-circle-o-notch fa-spin"></i> Logout</a>
      </li>
          
          
      </ul>
  </div>
</nav>
        
        
        <!--end of nav bar-->
        <% 
                        Message m=(Message)session.getAttribute("msg");
                        if(m!=null){
                        %>
                        <div class="alert <%= m.getCssClass() %>" role="alert">
                            <%= m.getContent() %>
  
</div>
                        <%
                            session.removeAttribute("msg");
                        
                            }
                        
                        %>
        
                        
                        <!--main body of page-->
                        
                        <main>
                            <div class="container">
                                <div class="row mt-5">
                                    <!--first col-->
                                                                         
                                    <div class="col-md-4">
                                        <!--type-->
                                               <div class="list-group">
                                                   <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active">
                                               All Posts
                                              </a>
                                              <%
                                                  PostDa ps=new PostDa(ConnectionProvider.getConnection());
                                                  ArrayList<Category> ls=ps.getAllCategories();
                                                  for(Category c:ls){
                                                  
                                                  
                                              %>
                                              <a href="#" onclick="getPosts(<%=c.getCid() %>,this)" class=" c-link list-group-item list-group-item-action"><%=c.getName() %></a>
                                              <%
                                                  }
%>
                                              
                                            </div>
                                    </div>
                                    <div class="col-md-8" id>
                                        <!--post-->
                                        <div class="container text-center" id="loader">
                                            <i class="fa fa-refresh fa-3x fa-spin"></i>
                                            <h3 class="mt-2">Loading...</h3>
                                            
                                        </div>
                                        <div class="container-fluid" id="post-container">
                                            
                                        </div>
                                        
                                        
                                    </div>
                                    </div>
                            </div>
                        </main>
                        
                        <!--end body of page-->
        <!--start of modal-->
        
        <!-- Button trigger modal -->


<!-- Modal -->
                    <div class="modal fade" id="profile-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header primary-background text-white text-center">
                              <h5 class="modal-title" id="exampleModalLabel">Tech Blog </h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          
                              <div class="container text-center" >
                                                                    <h5 class="modal-title" id="exampleModalLabel"> <%=user.getName()  %> </h5>

                                  <img src="pic/<%=user.getProfile() %>">
                                  
                                  <!--details-->
                                  <div id="profile-details">
                                  <table class="table">
  
                                                    <tbody>
                                                      <tr>
                                                        <th scope="row">ID</th>
                                                        <td> </td>

                                                      </tr>
                                                      <tr>
                                                        <th scope="row">Email:</th>
                                                        <td><%=user.getEmail() %> </td>

                                                      </tr>
                                                      <tr>
                                                        <th scope="row">Gender:</th>
                                                        <td><%=user.getGender() %> </td>

                                                      </tr>
                                                      <tr>
                                                        <th scope="row">About:</th>
                                                        <td><%=user.getAbout() %> </td>

                                                      </tr>
                                                      <tr>
                                                        <th scope="row">Register on:</th>
                                                        <td><%=user.getDateTime().toString() %> </td>

                                                      </tr>
                                                    </tbody>
                                                  </table>
                                                        </div>
                                            <div id="profile-edit" style="display: none">
                                                <h4>Please edit carefully</h4>
                                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                                    <table class="table">
                                                        <tr>
                                                            <td>Id:</td>
                                                            <td><%= user.getId() %>  </td>
                                                        </tr>
                                                        <tr>
                                                            <td>email:</td>
                                                            <td><input type="email" name="user_email" value="<%=user.getEmail() %> ">  </td>
                                                        </tr>
                                                        <tr>
                                                            <td>name</td>
                                                            <td><input type="text" name="user_name" value="<%=user.getName() %> ">  </td>
                                                        </tr>
                                                        <tr>
                                                            <td>password</td>
                                                            <td><input type="password" name="user_password" value="<%=user.getPassword()%> " > </td>
                                                        </tr>
                                                        <tr>
                                                            <td>About</td>
                                                            <td><textarea rows="3" class="form-control" name="user_about"><%=user.getAbout() %> </textarea> </td>
                                                        </tr>
                                                        <tr>
                                                            <td>new profile </td>
                                                            <td><input type="file" name="image" class="form-control"> </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Gender</td>
                                                            <td><%=user.getGender() %>  </td>
                                                        </tr>

                                                    </table>
                                                        <div class="container">
                                                            <button type="submit" class="btn btn-outline-primary">save</button>
                                                        </div>



                                                </form>
                                            </div>
           

                              </div>                  
                          
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button id="edit-profile-button" type="button" class="btn btn-primary">edit</button>
                          </div>
                        </div>
                      </div>
                    </div>
        
        
        
        <!--end of profile modal-->
        
        <!--add post modal-->
        
        
        <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide the post Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <div class="modal-body">
            
            <form action="AddPostServlet" method="post" id="add-post-form">
                <div class="form-group">
                    <select class="form-control" name="cid">
                       <option selected disabled>--select category--</option>
                       
                       <%
                           PostDa postD= new PostDa(ConnectionProvider.getConnection());
                           ArrayList<Category> list=postD.getAllCategories();
                           for(Category c:list)
                           {
                           %>
                           <option name="cid" value="<%= c.getCid() %>"><%= c.getName() %></option>
                    
                    <% 
                        }
                    %>
                </select>
                </div>
                <div class="form-group">
                    <input type="text" name="pTitle" placeholder="Enter post title" class="form-control">
                        
                </div>
                <div class="form-control">
                    <textarea placeholder="Enter your content" name="pContent" class="form-control" style="height:200px"></textarea>
                </div>
                <div class="form-control">
                    <textarea placeholder="Enter your program(if any)" name="pProgram" class="form-control" style="height:100px"></textarea>
                </div>
                <div class="form-control">
                    <label><i class="fa fa-file-image-o"></i>select your image</label><br>
                    <input type="file" name="pic">
                        
                </diV>
                <div class="container text-center">
                    <button type="submit" class="btn btn-outline-primary">Post</button>
                </div>
                     
            </form>
        </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
       
      </div>
    </div>
  </div>
</div>
        
        
        <!--end poast modal-->
        
        
        
        
        
        
        
        
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<!--<script src="js/myjs.js" type="text/javascript"></script>-->
<script>
    $(document).ready(function(){
        let editStatus=false;
        
        $('#edit-profile-button').click(function(){
           if(editStatus==false){
                $("#profile-details").hide();
                $("#profile-edit").show();
                editStatus=true;
                $(this).text("Back");
           }
           else{
               $("#profile-details").show();
                $("#profile-edit").hide();
                editStatus=false;
                 $(this).text("Edit");

           }
            
        });
            
    });
</script>
    <script src="js/myjs.js" type="text/javascript"></script>
    <script>
         $(document).ready(function (e) {
                //
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..");
                    let form = new FormData(this);

                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            if(data=='done'){
                                Swal.fire({
                                  title: "Good job!",
                                  text: "You clicked the button!",
                                  icon: "success"
                                });
                            }
                            else{
                                swal("sucess !");
                            }
                                    
                            
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            swal("error---");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });

    </script>
    
    <!--loading post-->
    
    <script>
        function getPosts(catId,temp){
            $("#loader").show();
            $("#post-container").hide();
            
            $(".c-link").removeClass('active');
            
            $.ajax({
                url:"load_posts.jsp",
                data:{cid:catId},
                success:function(data,textStatus,jqXHR){
                    console.log(data);
                    $("#loader").hide();
                    $("#post-container").show();
                    $("#post-container").html(data);
                    $(temp).addClass('active');
                }
            });
        }
        $(document).ready(function (e){
            let allPosts=$('.c-link')[0];
            getPosts(0,allPosts);
            
        });
    </script>

    
    
    </body>
</html>
