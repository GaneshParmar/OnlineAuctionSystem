<%-- 
    Document   : AdminDashboard
    Created on : Aug 4, 2022, 4:46:09 PM
    Author     : Admin
--%>

<%@page import="blueprint.Bid"%>
<%@page import="Data.getBidData"%>
<%@page import="blueprint.UserData"%>
<%@page import="Data.getUserData"%>
<%@page import="blueprint.Product" %>
<%@page import="java.util.List"%>
<%@page import="Data.getProductData"%>
<%@page import="Data.CookieInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            .mainContent{
                overflow-x: scroll;
            }
            table{
                width: 100%;
            }
            .action{
                min-width: 170px;
            }
            .th{
                font-size: 10px !important;
            }
            table.table-bordered > thead > tr > th{
                border:1px solid blue;
              }
              
              .text-danger{
                  color: red;
              }
              
              .text-success{
                  color: green;
              }
        </style>
        </head>
    <body>
        <%
            
            getUserData userData;
            UserData user;
            Cookie []ck=request.getCookies();
            CookieInfo mycookie=new CookieInfo(ck, "AdminId");
            String AdminId=mycookie.getCookieValue();
//            getProductData getp=new getProductData();
            
            
            if(AdminId!=""){
        %>
       <%@include file="../Components/Modal.jsp" %>
        <%@include file="../Components/adminHeader.jsp" %>
                <div class="main">
                    <div class="nav-panel">
                        <ul>
                            <li><input type="radio" name="dashlink" id="users" value="user"/><label for="users" ><a href="Users.jsp" >Users<span><i class='fa-solid fa-arrow-right'></i></span></a></label> </li>          
                            <li><input type="radio" name="dashlink" id="products" value="product" /><label for="products"><a href="Products.jsp" >Products<span><i class='fa-solid fa-arrow-right'></i></span></a></label> </li>          
                            <li><input type="radio" name="dashlink" id="categories" value="categories"/><label for="categories"><a href="Categories.jsp" >Categories<span><i class='fa-solid fa-arrow-right'></i></span></a></label> </li>          
                            <li><input type="radio" name="dashlink" id="result" value="categories" checked=""/><label for="result"><a href="Result.jsp" >Results<span><i class='fa-solid fa-arrow-right'></i></span></a></label> </li>          
                            <li><input type="radio" name="dashlink" id="liveauction" value="liveauction"/><label for="liveauction"><a href="LiveAuction.jsp" >Live Auction<span><i class='fa-solid fa-arrow-right'></i></span></a></label> </li>          
                        </ul>
                    </div>
                    <div class="mainContent">
                        
                        <table class="table table-bordered border-primary">
                                <thead>
                                  <tr>
                                    <th scope="col">Sr no</th>
                                    <th scope="col">Img</th>
                                    <th scope="col">ProductName</th>
                                    <th scope="col">ProductDescp</th>
                                    <th scope="col">Min Bid Amount</th>
                                    <th scope="col">Sold For</th>
                                    <th scope="col">Result</th>
                                  </tr>
                                </thead>
                                <%                                   
                                    List<Product> products=getp.getAllProducts();
                                    int n=1;
                                    for(Product p:products){
                                    getBidData gbd=new getBidData(p.getProductId());
                                    Bid b=gbd.BidWinner();
                                    
                                    userData=new getUserData(p.getSellerId());
                                    user=userData.getData();
                                    
                                    
                                %>
                                <tr>
                                <th scope="row"> <%=n %> </th>
                                <td>
                                    <img class="img-thumbnail" width="50" src="../uploads/products/<%=p.getProductImg()    %>" alt="productimg"/>
                                </td>
                                <td> <%= p.getProductName() %> </td>
                                <td> <%= p.getProductDesc() %></td>
                                <td> <%= p.getProductMinAmount() %></td>
                                <td><%= b!=null?"<p class='text-success'>"+b.getBidAmount()+"</p>":"<p class='text-danger'>NotSold</p>" %> </td>
                                <td> <a href="../Page/BidResult.jsp?pid=<%= p.getProductId() %>">View Winner</a> </td>
                                <td class="action">
                                    
                                    <button class="btn btn-danger" value="../Delete?type=product&&id=<%= p.getProductId()%>" onClick="showModal(this.value)" >Delete</button>
                                    
                                </td>
                                </td>
                              </tr>
                              <% 
                                  n++;
                                  } %>
                        </table>
                    </div>
                </div>
                
                
                <footer class="text-center">2021 2022 Boli laga</footer>
                
                
        <%}
            else{
                response.sendError(401);
            }

            %>
            
            <script src="../Scripts/adminDashShowModal.js">
                
            </script>
             <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
              
            
    </body>
</html>
