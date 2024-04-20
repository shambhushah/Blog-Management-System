<%-- 
    Document   : register_page
    Created on : Mar 27, 2024, 12:14:57 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>register Page</title>
        
        
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
         <%@include file="normal_navbar.jsp" %>
       
        <main class="primary-background" >
            <div class="container">
                <div class="col-md-6 offset-md-4" >
                    
                    <div class="card" >
                        <div class="card-header text-center primary-background text-white" >
                            <span class="fa fa-3x fa-user-circle" ></span>
                            <p>Register Here</p>
                            
                    </div>
                        <div class="card-body" >
                            
                            
                            <form id="reg-form" action="RegisterServlet" method="post">
                                
                                
                                <div class="form-group">
    <label for="user_name">User name</label>
    <input type="text" name="user_name" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
         
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
                                
                                
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
                                
                                <div class="form-group">
    <label for="gender">Select gender</label>
    <br><!-- comment -->
    <input type="radio"  id="gender" name="gender" value="male">Male
    <input type="radio"  id="gender" name="gender" value="female">Female
  </div>
                                <div class="form-group" >  
                                    <textarea name="about" class="form-control" id="" cols="30" rows="5" placeholder="Enter something about your self " ></textarea>
                                
                                </div>
                                
                                
                                
  <div class="form-check">
      <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">agree Terms & conditions</label>
  </div>
                                <div class="conatainer text-center" id="loader" style="display: none">
                                                                    <span class="fa fa-refresh fa-spin fa-4x" > </span><!-- comment -->
                                                                    <h4>Please wait...</h4>

                                </div>                                 
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
</form>
                            
                            
                            
                    </div>
                        
                </div>
            </div>
                 
        </main>
        
        
        
        
        
        
        
        
        
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>


        <script>
            $(document).ready(function () {
                console.log("loaded........")

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();



                    let form = new FormData(this);

                    $("#submit-btn").hide();
                    $("#loader").show();
                    //send register servlet:
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)

                            $("#submit-btn").show();
                            $("#loader").hide();

                            if (data.trim() === 'done')
                            {

                                swal("Registered successfully..We are going to redirect to login page")
                                        .then((value) => {
                                            window.location = "login_page.jsp"
                                        });
                            } else
                            {

                                swal(data);
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#submit-btn").show();
                            $("#loader").hide();
                            swal("something went wrong..try again");

                        },
                        processData: false,
                        contentType: false

                    });



                });


            });
        </script>
    
    </body>
</html>

