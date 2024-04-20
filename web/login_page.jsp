<%-- 
    Document   : login_page
    Created on : Mar 27, 2024, 11:50:00 AM
    Author     : hp
--%>

<%@page import="com.demo.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login page</title>
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>
        <main class="primary-background banner-background"  style="height: 60vh" >
        <div class="conatiner" >
            <div class="row" >
                <div class="col-md-4 offset-md-4" >
                    <div class="card" >
                        <div class="card-header primary-background test-white text-center" >
                            <span class="fa fa-user-plus fa-3x" ></span>
                            <p>Login here</p>
                            
                            
                            </div>
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
                        
                         <div class="card-body" >
                                  
                             <form action="LoginServlet" method="post">
                         <div class="form-group">
                           <label for="exampleInputEmail1">Email address</label>
                           <input type="email" name="email" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                 </div>
                          <div class="form-group">
                   <label for="exampleInputPassword1">Password</label>
                   <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                          </div>
                                 <div class="container">
                          <button type="submit" class="btn btn-primary">Submit</button>
                          
                                 </diV>
                             </form>
                             
                             
                             
                             
                             
                             
                             
                            
                            </div>
                    </div>
                </div>
            </div>
        </div>
            </main>
            
        
        
        
         <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
   
        
    </body>
</html>
