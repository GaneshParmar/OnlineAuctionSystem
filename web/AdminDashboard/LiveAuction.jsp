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
        <link rel="stylesheet" href="../Css/index.css"/>
        <link rel="stylesheet" href="../Css/admin.css"/>
    </head>
    <body>
        <%
            Cookie []ck=request.getCookies();
            CookieInfo mycookie=new CookieInfo(ck, "AdminId");
            String AdminId=mycookie.getCookieValue();
            
            if(AdminId!=""){
                %>
                <%@include file="../Components/adminHeader.jsp" %>
                
                
                
                
                <div class="main">
                    <div class="nav-panel">
                        <ul>
                            <li><input type="radio" name="dashlink" id="users" value="user"/><label for="users" ><a href="Users.jsp" >Users<span><i class='fa-solid fa-arrow-right'></i></span></a></label> </li>          
                            <li><input type="radio" name="dashlink" id="products" value="product"/><label for="products"><a href="Products.jsp" >Products<span><i class='fa-solid fa-arrow-right'></i></span></a></label> </li>          
                            <li><input type="radio" name="dashlink" id="categories" value="categories"/><label for="categories"><a href="Categories.jsp" >Categories<span><i class='fa-solid fa-arrow-right'></i></span></a></label> </li>          
                            <li><input type="radio" name="dashlink" id="result" value="categories"/><label for="result"><a href="Result.jsp" >Results<span><i class='fa-solid fa-arrow-right'></i></span></a></label> </li>          
                            <li><input type="radio" name="dashlink" id="liveauction" value="liveauction" checked=""/><label for="liveauction"><a href="LiveAuction.jsp" >Live Auction<span><i class='fa-solid fa-arrow-right'></i></span></a></label> </li>          
                        </ul>
                    </div>
                    <div class="mainContent">
                        <h1>Live Auction</h1>
                    </div>
                </div>
                
                
                <footer class="text-center">2021 2022 Boli laga</footer>
                
                
        <%}
            else{
                response.sendError(401);
            }

            %>
            
            
            
    </body>
</html>
