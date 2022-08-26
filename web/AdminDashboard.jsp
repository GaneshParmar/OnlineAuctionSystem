<%-- 
    Document   : AdminDashboard
    Created on : Aug 4, 2022, 4:46:09 PM
    Author     : Admin
--%>

<%@page import="Data.CookieInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>JSP Page</title>
        <link rel="stylesheet" href="./Css/admin.css"/>
    </head>
    <body>
        <%
            Cookie []ck=request.getCookies();
            CookieInfo mycookie=new CookieInfo(ck, "AdminId");
            String AdminId=mycookie.getCookieValue();
            
            if(AdminId!=""){
                %>
                <%@include file="/Components/loginHeader.jsp" %>
                
                
                
                
                <div class="main">
                    <div class="nav-panel">
                        <ul>
                            <li><input type="radio" name="dashlink" id="users" value="user"/><label for="users" ><a href="./AdminDashboard/Users.jsp" >Users<span><i class='fa-solid fa-arrow-right'></i></span></a></label> </li>          
                            <li><input type="radio" name="dashlink" id="products" value="product"/><label for="products"><a href="./AdminDashboard/Products.jsp" >Products<span><i class='fa-solid fa-arrow-right'></i></span></a></label> </li>          
                            <li><input type="radio" name="dashlink" id="categories" value="categories"/><label for="categories"><a href="./AdminDashboard/Categories.jsp" >Categories<span><i class='fa-solid fa-arrow-right'></i></span></a></label> </li>          
                            <li><input type="radio" name="dashlink" id="result" value="categories"/><label for="result"><a href="./AdminDashboard/Result.jsp" >Results<span><i class='fa-solid fa-arrow-right'></i></span></a></label> </li>          
                            
                            <li><input type="radio" name="dashlink" id="liveauction" value="liveauction"/><label for="liveauction"><a href="./AdminDashboard/LiveAuction.jsp" >Live Auction<span><i class='fa-solid fa-arrow-right'></i></span></a></label> </li>          
                        </ul>
                    </div>
                    <div class="mainContent">
                        Hello Admin
                    </div>
                </div>
                
                
                <footer class="text-center">2021 2022 Boli laga</footer>
                
                
        <%}
            else{
                response.sendError(401);
            }

            %>
            
            
             <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
             <script src="./Scripts/admin.js"/>
            
            
    </body>
</html>
