<%-- 
    Document   : admin
    Created on : Aug 4, 2022, 3:47:09 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <style>
            body{
                background: url("data:image/jpeg;base64,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");
                
                background-size: 100%;
                background-repeat: none;
                height: 90vh;
                position: relative;
            }
            
            form{
                max-width: 400px;
                height: 50%;
                width: 100%;
                margin: 10px auto;
                background: rgba(0,0,0,0.5);
            }
            
            .inputWrap{
                width: 100%;
                height: 70px;
                padding: 1em;
            }
            
            .inputWrap>input{
                width: 100%;
                height: 40px;
                padding: 0.5em 0.4em;
                border: none;
                outline: none;
                border-bottom: 2px solid #0cabba;
            }
            
            .btn_>input{
                border: 3px solid #0cabba;
                background: #0cabba;
                color: white;
            }
            
            center{
                color: white;
            }
            
        </style>
    </head>
    <body>
        
        <jsp:include page="./Components/loginHeader.jsp"/>
        
        <%
            if(request.getParameter("Error")!=null){
                String error=request.getParameter("Error");
                if(error.equals("Password Incorrect!!")){
                    out.println("<h3>Admin or Password Wrong bro</h3>");
                }
            }
            
            

            %>
        
        <form method="post" action="AdminLogin">
            <div class="inputWrap"> 
                <input type="text" name="admin" placeholder="Admin"required=""/>
            </div>
            <div class="inputWrap">
                <input type="text" name="password" placeholder="Password" required=""/>
            </div>
            <div class="inputWrap btn_">
                <input type="submit" value="Login"/>
            </div>
            
        </form>
        
        
        <center>2021 -2022 Copyright Registered</center>
        
    </body>
</html>
