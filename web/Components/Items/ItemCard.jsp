

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       <link rel="stylesheet" href="../../Css/item.css"/>
       <<link rel="stylesheet" href="Css/item.css"/>
    </head>
    <body>
      <% 
        String href_=request.getParameter("href");
        String itemBrand=request.getParameter("ItemName");
        String itemImg=request.getParameter("imgadd");
//         <jsp:param name="ItemName" value="Puma"/>
//                        <jsp:param name="ItemPrice" value="Rs 1500"/>
//                        <jsp:param name="ItemSeller" value="Puma Company Limited"/>
//                        <jsp:param name="ItemFeature" value="Shoes"/>
//                        <jsp:param name="ItemFeature" value="Amazing Quality"/>
        String itemSeller=request.getParameter("ItemSeller");
        String itemFeature= request.getParameter("ItemFeature");
        String itemPrice="₹ "+request.getParameter("ItemPrice"); 
        
        
        
        String[] features=itemFeature.split(",");
      %>
      <a href="<%= href_ %>" class="">
      
      <div class="item_">
          <div class="itemInfo">
              <h5 class="itemBrand"><%=itemBrand %></h5>
              <ul class="feature">
                  <%
                      for(int i=0;i<features.length;i++){
                        out.println("<li>"+features[i]+"</li>");
                      }
                  
                  %>
<!--                  <li>Shoes</li>
                  <li>Amazing Quality</li>-->
              </ul>
            <div class="itemSec2">
                <span>Bidding Start Price</span>
                <h4 class="itemPrice"><%= itemPrice%></h4>
                <span>Seller</span>
                <p class="itemSeller">
                    <%= itemSeller%>
                </p>
            </div>

              
          </div>
          <div class="itemImg">
              <img src=<%= itemImg%> width="100" alt=""/>
          </div>
      </div>
      </a>
    </body>
</html>
