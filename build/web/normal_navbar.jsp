<%-- 
    Document   : normal_navbar
    Created on : Mar 26, 2024, 2:20:45 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light primary-background">
            <a href="index.jsp" class="navbar-brand" href="#"><span class="fa fa-asterisk	
"></span> Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="#"><span class="fa fa-bell"></span> Learn and Expoler <span class="sr-only">(current)</span></a>
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
          <a class="nav-link" href="login_page.jsp"><span class="fa fa-user-circle-o "></span> Login</a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="register_page.jsp"><span class="fa fa-user-plus "></span> signUp</a>
      </li>
     
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
         
        
        
        
        <!--//java script-->
       

    
    
    </body>
</html>
