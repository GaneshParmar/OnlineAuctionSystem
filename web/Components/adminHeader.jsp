<%-- 
    Document   : header
    Created on : Jul 20, 2022, 3:34:18 PM
    Author     : Admin
--%>

<%@page import="Data.getProductData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Css/index.css"/>
        <style>
            .text-center{
                width: 100%;
            }
            
            .text-brand-light{
                color: #87d5dc;
            }
        </style>
    </head>
    <body>
        
        <% 
            getProductData getp=new getProductData();
            
            String NotApprovedProducts=Integer.toString(getp.getNotApprovedProducts());
            %>
        
       <nav>
            <div class="nav-wrap align-items-center">
                <h3 class="d-flex">
                    Boli Laga
                    <p class="text-brand-light p-0 mb-0 ml-2">/Hello Admin</p>
                </h3>
                <div id="notification" class="d-flex justify-content-cenrter align-items-center">
                    <i class="fa-solid fa-bell"></i>
                    <p class="text-light"><%= NotApprovedProducts %></p>
                </div>
            </div>            
        </nav>
    </body>
</html>
