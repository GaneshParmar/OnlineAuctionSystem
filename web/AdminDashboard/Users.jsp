<%-- 
    Document   :     Created on : Aug 4, 2022, 4:46:09 PM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Controller.Db"%>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/css/bootstrap.min.css" integrity="sha512-XWTTruHZEYJsxV3W/lSXG1n3Q39YIWOstqvmFsdNEEQfHoZ6vm6E9GK2OrF6DSJSpIbRbi+Nn0WDPID9O7xB2Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        
        <style>
            ul{
                padding: 0 !important;
            }
            
        </style>
        
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
                        <!--<h5 class="text-center p-1">DashBoard</h5>-->
                        <ul>
                            <li><input type="radio" name="dashlink" id="users" value="user" checked=""/><label for="users" ><a href="Users.jsp" >Users<span><i class='fa-solid fa-arrow-right'></i></span></a></label> </li>          
                            <li><input type="radio" name="dashlink" id="products" value="product"/><label for="products"><a href="Products.jsp" >Products<span><i class='fa-solid fa-arrow-right'></i></span></a></label> </li>          
                            <li><input type="radio" name="dashlink" id="categories" value="categories"/><label for="categories"><a href="Categories.jsp" >Categories<span><i class='fa-solid fa-arrow-right'></i></span></a></label> </li>          
                            <li><input type="radio" name="dashlink" id="result" value="categories"/><label for="result"><a href="Result.jsp" >Results<span><i class='fa-solid fa-arrow-right'></i></span></a></label> </li>          
                            <li><input type="radio" name="dashlink" id="liveauction" value="liveauction"/><label for="liveauction"><a href="LiveAuction.jsp" >Live Auction<span><i class='fa-solid fa-arrow-right'></i></span></a></label> </li>          
                        </ul>
                    </div>
                    <div class="mainContent p-5">
                        
                        <%!
                            ResultSet rs;
                            %>
                        
                            <table class="table">
                                <thead>
                                  <tr>
                                     <th scopr="col">Sr no</th>
                                    <th scope="col">Username</th>
                                    <th scope="col">Full Name</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Action</th>
                                  </tr>
                                </thead>
                        
                        <%
//                            Connecting the db and executing the query
                              Db myDb=new Db("root","","auctionsystem");
                              rs= myDb.getResultSet("Select * from usertable",null);
                              int n=1;
                              while(rs.next()){
                            %>
                            <tr>
                                <th scope="row"> <%=n %> </th>
                                <td> <%= rs.getString("Username") %> </td>
                                <td> <%= rs.getString("FullName") %></td>
                                <td> <%= rs.getString("Email") %></td>
                                <td>
                                    
                                    <a class="btn btn-primary" href="../Useredit?userid=<%= rs.getString("UserId")%>" >Edit</a> |<!-- comment -->
                                    <button class="btn btn-danger" value="../Delete?type=user&&id=<%= rs.getString("UserId")%>" onClick="showModal(this.value)" >Delete</button>
                                    
                                </td>
                              </tr>
                            <%
                                n++;
                                }%>
                        
                            </table>
                    </div>
                </div>
               
                <%@include file="../Components/Modal.jsp" %>
                
                <footer class="text-center">2021 2022 Boli laga</footer>
                
                
        <%}
            else{
                response.sendError(401);
            }

            %>
            
            <script src="../Scripts/adminDashShowModal.js">
                
            </script>
    </body>
</html>
