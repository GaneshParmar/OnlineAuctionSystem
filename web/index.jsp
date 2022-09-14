<%-- 
    Document   : index
    Created on : Jul 19, 2022, 5:23:45 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            String user;
            %>
        <% 
            Cookie[] cookies = request.getCookies();
            
            if (cookies != null) {
             for (Cookie cookie : cookies) {
               if (cookie.getName().equals("User")) {
                 //do something
                 //value can be retrieved using #cookie.getValue()
                 user=cookie.getValue();
                }
              }
            }
            if(user!=null){
        %>  
            Hello <%
             response.sendRedirect("DbConnect");
            %>
        <% }
            else{
               response.sendRedirect("login.jsp");
            }
        %>
          
    </body>
</html>
