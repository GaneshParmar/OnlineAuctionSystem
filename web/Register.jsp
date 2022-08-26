<%-- 
    Document   : Login
    Created on : Jul 20, 2022, 3:35:08 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Css/register.css"/>      
        
    </head>
    <body>
        <%@include file="Components/loginHeader.jsp" %>
        <div class="form-wrap">
            <form method="post" action="RegisterUser" enctype = "multipart/form-data">
                <h2 class="">Registration Form</h2><br>
                
                <%
                    if(request.getAttribute("Error")!=null){
                        out.println("<h4 style='color:red;'>"+request.getParameter("Error")+"</h4>");
                    }
                    %>
                
                <p class="text-center">Login Details</p>
                <div class="sec">
                    <div class="inputWrap">
                        <input class="aniamteInput" type="text" name="username" required/>
                        <label for="username">Set Username</label>
                        <span class="required">*</span>
                    </div>
                    <div class="inputWrap">
                        <input id="setPass" class="aniamteInput" type="password" name="password" required/>
                        <label for="password">Set Password</label>
                        <span class="required">*</span>
                    </div>
                </div>
                <p class="text-center">User Info</p>
                <div class="sec">
                    <div class="inputWrap">
                        <input class="aniamteInput" type="text" name="fullname" required/>
                        <label for="fullname">Enter Name</label>
                        <span class="required">*</span>
                    </div>
                    <div class="inputWrap">
                        <input class="aniamteInput" type="email" name="email" required/>
                        <label for="email">Email</label>
                        <span class="required">*</span>
                    </div>
                    <div class="inputWrap">
                        <input class="aniamteInput" type="number" name="phoneno" maxlength="10" required/>
                        <label for="phoneno">Phone No</label>
                        <span class="required">*</span>
                    </div>

                     <div class="inputWrap">
                        <input class="aniamteInput" type="text" name="address" required/>
                        <label for="phoneno">Address</label>
                        <span class="required">*</span>
                    </div>
                    <div class="inputWrap entered">
                        <input class="aniamteInput" type="date" name="dob" required/>
                        <label for="dob">Date Of Birth</label>
                        <span class="required">*</span>
                    </div>
                    <br>
                    <div class="inputWrap entered">
                        <label>Choose Profile Pic</label>
                        <input class="" type="file" name="userimg" required/>
                        <span class="required">*</span>
                    </div>
                </div>
               <input type="submit" class="btn" value="Register"/>

                <!--<input type="submit" class="btn" value="Login"/>-->
                
                <!--<p class="text-center">Already registered? <a href="./Login.jsp" class="registerlink">Login</a></p>-->
            </form>
        </div>
        
        <%@include file="Components/footer.jsp" %>

        <script type="text/javascript" src="Scripts/input.js"></script>
    </body>
</html>
