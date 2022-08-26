<%-- 
    Document   : myaccount
    Created on : Jul 28, 2022, 1:32:45 PM
    Author     : Admin
--%>

<%@page import="blueprint.UserData"%>
<%@page import="Data.getUserData"%>
<%@page import="Data.CookieInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">        
        <title>JSP Page</title>
        <link rel="stylesheet" href="../Css/index.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/css/bootstrap.min.css" integrity="sha512-XWTTruHZEYJsxV3W/lSXG1n3Q39YIWOstqvmFsdNEEQfHoZ6vm6E9GK2OrF6DSJSpIbRbi+Nn0WDPID9O7xB2Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            
            .bg-brand{
                background: #0cabba;
                color: white;
            }
            
            .wrapper{
                width: 100%;
                max-width: 950px;
                margin: 0 auto;
            }
            
            .info{
                width: 100%
            }
            
            .profileInfo{
                width: 500px;
                max-width: 100%;
            }
            
            .info{
                width: 100%;
            }
            
            .info>.label{
                width: 150px;
            }
            
            input{
                flex: 1;
                border: 1px solid #0cabba !important;
            }
            
            .repass{
                position: relative;
            }
            
            .repass>div{
                position: absolute;
                width: 100%;
                height: 100%;
                /*background: red;*/
                z-index: 10;
            }
            
/*            .btn{
                outline:none;
                border:none;
                width: fit-content;
                background: none;
            }
            
            .btn>a{
                display: block;
                color: white;
                padding: 5px 15px;
                border-radius: 10px;
                background: red;
                text-decoration: none;
                font-weight: 900;
            }*/
            
            .alert{
                width: 950px;
                max-width: 90%;
                left: 50%;
                transform: translateX(-50%);
            }

            @media (max-width:899px){
                .wrapper{
                    flex-direction: column;
                    align-items: center;
                }
                .control-btns{
                    display: flex;
                    flex-direction: column;
                    gap: 5px;
                }
            }
        </style>
    </head>
    <body>
        
        <%!
//            String Username;
            UserData user;
            
            %>
            <%@include file="../Components/loginHeader.jsp"%>
        <%
            

            
            Cookie []c=request.getCookies();
                        
            CookieInfo mycookie=new CookieInfo(c, "UserId");
            String UserId=mycookie.getCookieValue();
            
            
            
            if(mycookie.getCookieValue()!=""){
                
                getUserData userinfo_=new getUserData(UserId);

                user=userinfo_.getData();
                if(user==null){
                    response.sendRedirect("../Login.jsp");
                }
            }
            else{
                response.sendRedirect("../Login.jsp");
            }
                String username=user.getUsername();
                String userFullname=user.getUserFullName();
                String userAddress=user.getUseraddress();
                String userEmail=user.getUserEmail();
                String userPhno=user.getUserPhno();
                String userDOB=user.getUserDob();
                String userImg=user.getUserImg();
            %>  
            <div class="alert alert-danger position-fixed" style="display:none;z-index: 10;margin: 0 auto;" id="Alert1" role="alert">
                            Old Password New Password Match Each Other!
            </div>
            <div class="alert alert-success position-fixed" style="display:none;z-index: 10;" id="Alert2" role="alert">
                            Congratulations! Password Changed
            </div>
            <div class="alert alert-warning position-fixed" style="display:none;z-index: 10;" id="Alert3" role="alert">
                            Ohh Sorry! Password Not Chnaged Old Password incorrect
            </div>
            <div class="wrapper d-flex p-1">
                <div class="profilePhoto p-4 flex-box">
                    <div class="">
                        <img class="d-block m-auto" src="../uploads/users/<%= userImg %>" width="200"/><br><br>
                    </div>
                    <div class="control-btns mt-2">
                        <a class="btn rounded border-secondary" href="EditUserData?profilepis=true">Change Profile Photo</a>
                        <a class="btn btn-danger" href="../Logout">Logout</a>
                    </div>
                </div>
                <div class="profileInfo">
                    <div class="info d-flex mt-4">
                        <p class="label p-4 pt-1 pb-1 text-secondary">Username</p>
                        <p class="infoOutput p-4 pt-1 pb-1 rounded"><%= username %></p>
                    </div>
                    
                    <div class="info d-flex mt-2">
                        <p class="label p-4 pt-1 pb-1 text-secondary">Full Name</p>
                        <p class="infoOutput p-4 pt-1 pb-1 rounded"><%= userFullname %></p>
                    </div><!-- comment -->
                    
                    <div class="info d-flex mt-2">
                        <p class="label p-4 pt-1 pb-1 text-secondary">Email</p>
                        <p class="infoOutput p-4 pt-1 pb-1 rounded"><%= userEmail %></p>
                    </div><!-- comment -->
                    
                    <div class="info d-flex mt-2">
                        <p class="label p-4 pt-1 pb-1 text-secondary">Phone No</p>
                        <p class="infoOutput p-4 pt-1 pb-1 rounded"><%= userPhno %></p>
                    </div><!-- comment -->
                    
                    <div class="info d-flex mt-2">
                        <p class="label p-4 pt-1 pb-1 text-secondary">Date Of Birth</p>
                        <p class="infoOutput p-4 pt-1 pb-1 rounded"><%= userDOB %></p>
                    </div>
                    
                    <div class="info d-flex mt-2">
                        <p class="label p-4 pt-1 pb-1 text-secondary">Address</p>
                        <p class="infoOutput p-4 pt-1 pb-1 rounded"><%= userAddress %></p>
                    </div>
                    
                        <%-- Change Password--%>
                    <div class="section position-relative">
                        <h6 class="text-secondary p-4 pb-2 border-bottom">Change Password</h6>
                        <div class="alert alert-danger position-absolute m-auto" style="display:none;z-index: 10;" id="Alert" role="alert">
                            Password Doesn't Match!
                        </div>
                        <form action="../changePassword"  method="Post" id="passChngeform">
                            <div class="input-group mb-3 p-4 pt-1 pb-1">
                                <input type="text" name="oldPass" class="form-control" placeholder="Old Password" required="">
                            </div>
                            <div class="input-group mb-3 p-4 pt-1 pb-1">
                                <input type="text" name="newPass" class="form-control" placeholder="New Password" required="">
                            </div>
                            
                            <div class="position-relative">
                                <div class="input-group mb-3 p-4 pt-1 pb-1 rounded repass">
                                    <input type="password"  class="form-control" placeholder="Re-enter Password" required="">
                                </div>
                                <div class="position-absolute top-0  input-group mb-3 p-4 pt-1 pb-1 rounded repass" id="fakePass">
                                    <input type="password"  class="form-control" placeholder="Re-enter Password" disabled="">
                                </div>                            
                                
                            </div>
                            <a class="m-4 mt-1 mb-1 btn bg-brand" onclick="checkPass()">Change Password</a>
                        </form>
                        
                    </div>
                    
                </div>
            </div>               
            
            
            
            <center>
                    2021-2022 Copyright G@nesh Om Luv
            </center>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="../Scripts/changePass.js">
        
        
    </script>
           
            <%
            if(("oldnewpasssame").equals(request.getParameter("Error"))){
               %> 
               <script>
                   $('#Alert1').fadeIn('slow').delay(1500).fadeOut('slow');
               </script>
            <%}
            if(("true").equals(request.getParameter("Success"))){%>
                <script>
                    $('#Alert2').fadeIn('slow').delay(1500).fadeOut('slow');
                </script>
            <%}
            if(("false").equals(request.getParameter("Success"))){%>
                <script>
                    $('#Alert3').fadeIn('slow').delay(1500).fadeOut('slow');
                </script>
            <%}
            
            %>
    
    </body>
</html>
