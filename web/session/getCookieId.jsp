<%-- 
    Document   : getCookieId
    Created on : Aug 17, 2022, 6:27:11 PM
    Author     : Admin
--%>

<%@page import="Data.CookieInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String UserId;
            %>
        <%
        Cookie []c=request.getCookies();
                        
            CookieInfo mycookie=new CookieInfo(c, "UserId");
            UserId=mycookie.getCookieValue();
            %>
    </body>
</html>
