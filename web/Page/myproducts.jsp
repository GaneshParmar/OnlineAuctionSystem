<%-- 
    Document   : myproducts
    Created on : Aug 17, 2022, 6:23:44 PM
    Author     : Admin
--%>

<%@page import="blueprint.UserData"%>
<%@page import="blueprint.Product"%>
<%@page import="Data.getUserData"%>
<%@page import="java.util.List"%>
<%@page import="Data.getProductData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="../Css/index.css"/>
        <link rel="stylesheet" href="../Css/item.css"/>
        <style>
            .mainWrapper{
                min-height: fit-content;
                padding: 1em;
            }
            a{
                display: block;
                height: fit-content;
            }
            .item_{
                /*display: block;*/
                width: fit-content !important;
                min-width: 300px;
                border: 1px solid #0cabba;
                box-shadow: 0px 0px 10px 5px #87d5dc;
                float: none;
                padding: 0.5em !important;
            }
            .wrapper_{
                display: flex;
                flex-wrap: wrap;
                height: fit-content;
                min-height: 55vh;
                margin-top: 1em;
                gap: 1em;
                
            }
            
            .btnWrap{
                display: flex;
                flex-wrap: wrap;
                margin: 1em 0;
                width: 100%;
            }
            .btnWrap>button{
                width: 50%;
                padding: 1em 0;
                cursor: pointer;
                background: none;
                border: none;
                background: #87d5dc;
                color: white;
            }
            
            .btnWrap>button.active{
                background: #0cabba;
            }
            
            .notapproved{
                display: none;
            }
            
            @media (max-width:499px){
                .wrapper_{
                    gap: 10px;
                    flex-direction: column;
                    justify-content: center;
                }
                
            }
            
            
        </style>
    </head>
    <body>
        
        <jsp:include page="../Components/header.jsp"/>
        
        <%@include file="../session/getCookieId.jsp" %>
        
        
        <div class="mainWrapper">
            <h2 >MyProducts</h2><br>
            
            <div class="btnWrap"> 
                <button class="active" id="btn1">Approved</button>
                <button class="" id="btn2">Not Apprroved</button>
            </div>
        
        
            <div class="wrapper_">
        <% 
            if(UserId!=""){
            getProductData pd=new getProductData();
            List<Product> products= pd.getProducts(UserId);
            String pname,pdesc,pminprice,pseller,pimg;
            for(Product p:products){
            pname=p.getProductName();
            pdesc=p.getProductDesc();
            pminprice="₹ "+p.getProductMinAmount();
            pimg="../uploads/products/"+p.getProductImg();
            
            String class_=(("Approved").equals(p.getProductGranted()))?"approved":"notapproved";
            
            getUserData userData=new getUserData(p.getSellerId());
            UserData user=userData.getData();
            pseller=user.getUsername();
        
            String[] features=pdesc.split(",");
            String href_="";
            
            if("Started".equals(p.getProductState())){
                href_="Bid.jsp?pid="+p.getProductId();
             }
             else if("Ended".equals(p.getProductState())){
                
                href_="BidResult.jsp?pid="+p.getProductId();
             }
             else
             {
               href_="";
             }
             
        %>
        <a href="<%= href_ %>" class="<%= class_ %>">
      
      <div class="item_">
          <div class="itemInfo">
              <h5 class="itemBrand"><%=pname %></h5>
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
                <h4 class="itemPrice"><%= pminprice %></h4>
                <span>Seller</span>
                <p class="itemSeller">
                    My Product
                </p>
                
                <span>Bidding</span>
                <p><%= p.getProductState() %></p>
            </div>

              
          </div>
          <div class="itemImg">
              <img src=<%= pimg %> width="100" alt=""/>
              
          </div>
             
      </div>
      </a>
            
        
        
           <% }}
            else{
                response.sendRedirect("./Login.jsp");
            }

        %>  
        </div>
       </div>

        <jsp:include page="../Components/footer.jsp"/>
        
        <script>
            $("#btn1").click(()=>{
                $("#btn2").removeClass('active');
                $("#btn1").addClass('active');
                $('.approved').css("display","flex");
                $('.notapproved').css("display","none");
            })
            $("#btn2").click(()=>{
                $("#btn1").removeClass('active');
                $("#btn2").addClass('active');
                $('.approved').css("display","none");
                $('.notapproved').css("display","flex");
            })
        </script>
        
        
    </body>
    
</html>
