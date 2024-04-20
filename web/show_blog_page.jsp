<%-- 
    Document   : show_blog_page
    Created on : Apr 13, 2024, 9:13:19 AM
    Author     : hp
--%>
 <%@page import="com.demo.blog.dataBaseAccess.LikeDa"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.demo.blog.dataBaseAccess.UserDa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.blog.entities.Category"%>
<%@page import="com.demo.blog.entities.Post"%>
<%@page import="com.demo.blog.dataBaseAccess.PostDa"%>
<%@page import="com.demo.blog.helper.ConnectionProvider"%>
<%@page import="com.demo.blog.entities.User"%>
 <%@page errorPage="error_page.jsp" %>
<%
           User user=(User)session.getAttribute("currenUser");
    
            if(user==null){
                    response.sendRedirect("login_page.jsp");
                }
    %>

<%
    int postId=Integer.parseInt(request.getParameter("post_id"));
    
    PostDa d=new PostDa(ConnectionProvider.getConnection());
    
    Post p=d.getPOstByPostId(postId);
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=p.getpTitle() %>|| Blog System</title>
        
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

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
            .post_title{
                font-weight: 200;
                font-size: 25px;
            }
            .post_content{
                font-weight: 100;
                font-size: 20px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .row-user{
                border:1px solid #e57373;
            }
            a:link {
            color: whitesmoke;
            background-color: transparent;
            text-decoration: none;}

        </style>
        
       <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v19.0" nonce="wa17DM30"></script>
    
</head>

    <body>
          <nav class="navbar navbar-expand-lg navbar-light primary-background">
            <a href="index.jsp" class="navbar-brand" href="#"><span class="fa fa-asterisk	
"></span> Tech-Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="profile.jsp"><span class="fa fa-bell"></span> Learn with sam <span class="sr-only">(current)</span></a>
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
          <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus "></span> LogOut</a>
      </li>
          
          
      </ul>
  </div>
</nav>
      <!--main content of body-->
      
      <div class="conatainer">
          <div class="row my-4">
              
              <div class="col-md-8 offset-md-2">
                  <div class="card">
                      <div class="card-header primary-background text-white">
                          <h4 class="post_title"><%=p.getpTitle() %></h4>
                      </div>
                      <div class="card-body">
                                    <img class="card-img-top my-3" src="pic/<%= p.getpPic() %>" alt="Loading.." style="height:300px;width: 300px">
                                    
                                    <div class="row my-1 row-user primary-background text-white">
                                        <div class="col-md-8">
                                            <%
                                                UserDa u=new UserDa(ConnectionProvider.getConnection());
                                                
                                                %>
                                                <p><a href="#!"><%=u.getUserByUserId(p.getUserId()).getName() %></a> has posted.</p>
                                        </div>
                                        <div class="col-md-2">
                                            <p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getpDate()) %></p>
                                        </div>
                                    </div>

                          <p class="post_content"><%=p.getpContent() %></p>
                          <br>
                          <div class="post_code">
                              <pre><%=p.getpCode() %></pre>
                          </div>
                          
                      </div>
                      <div class="card-footer primary-background text-white">
                          <% 

                            LikeDa lda=new LikeDa(ConnectionProvider.getConnection());
                          %>
                          <a href="#!" onclick="doLike(<%=p.getPid() %>,<%=user.getId() %>)" class="btn btn-outline-primary btn-sm"  ><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=lda.countLikeOnPost(p.getPid()) %></span> </a>

                          <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"><span>10</span> </i></a>
                      </div>
                          <div class="card-footer">
                              <div class="fb-comments" data-href="http://localhost:9494/DemoBlog/show_blog_page.jsp?post_id=<%=p.getPid() %>" data-width="" data-numposts="5"></div>
                          </div>
                          
                  </div>
              </div>
          </div>
      </div>
      
      
      <!--End of content body-->
      
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
                    <label>select your image</label><br>
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
                
      <script src="js/myjs.js" type="text/javascript"></script>

        
    </body>
</html>
