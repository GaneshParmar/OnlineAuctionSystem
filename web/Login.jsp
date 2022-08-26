<%-- 
    Document   : Login
    Created on : Jul 20, 2022, 3:35:08 PM
    Author     : Admin
--%>

<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Css/login.css"/>      
        
    </head>
    <body>
            
         
        <%@include file="Components/loginHeader.jsp" %>
        
        <div class="form-wrap">
            <form method="post" action="Login">
                <h1 class="text-center">Login Form</h1><br><br>
                <%
                    if(request.getParameter("Error")!=null){
                        out.println("<h4 style='color:red;'>"+request.getParameter("Error")+"</h4>");
                    }
                    %>
                <div class="inputWrap">
                    <input class="aniamteInput" type="text" name="username" required/>
                    <label for="username">Username</label>
                    <span class="required">*</span>
                </div><br>
                <div class="inputWrap">
                    <input class="aniamteInput" type="password" name="password" required/>
                    <label for="password">Password</label>
                    <span class="required">*</span>
                </div><br>
                <input type="submit" class="btn" value="Login"/>
                <br><br>
                <% 
                        if(request.getParameter("Registered")==null){
                            out.println("<p class='text-center'>Not registered Yet? <a href='./Register.jsp' class='registerlink'>Register</a></p>");
                    }
                    else{
                            out.println("<p class='text-center'>Congratulations Registred Now login with Login Credentials</p>");                    
                    }
                    %>
                
            </form>
        </div>
        
        <%@include file="Components/footer.jsp" %>

        <script type="text/javascript" src="Scripts/input.js"></script>
    </body>
</html>
