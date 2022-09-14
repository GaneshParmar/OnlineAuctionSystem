<%-- 
    Document   : login
    Created on : Jul 19, 2022, 5:26:13 PM
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
        <h1>Hello Login First!</h1>
        <%
             Cookie cookie = new Cookie("User", "Ganesh"); 
             response. addCookie(cookie);
            %>
            <sql:setDataSource var="libraryDataSource"
                    driver="com.mysql.jdbc.Driver"
                    url="jdbc:mysql://localhost:3306/LIBRARY" user="root"
                    password="root" />
    </body>
</html>
