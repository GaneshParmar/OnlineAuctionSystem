<%-- 
    Document   : BidResult
    Created on : Aug 18, 2022, 4:16:55 PM
    Author     : Admin
--%>

<%@page import="Data.getUserData"%>
<%@page import="blueprint.UserData"%>
<%@page import="blueprint.Bid"%>
<%@page import="Data.getBidData"%>
<%@page import="blueprint.Product"%>
<%@page import="Data.getProductData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../Css/index.css"/>
        <title>JSP Page</title>
        
        <style>
            .Main{
                width: 100%;
                display: flex;
                gap: 1em;
                max-width: 900px;
                margin: 0 auto;
                min-height: 70vh;
                align-items: center;
            }
            
            .InfoSec{
                /*flex: 1;*/
                width: 40%;
                display: table;
            }
            
            .infoWrap{
                width: 100%;
                gap: 1em;
                margin: 10px 0;
                display: table;
            }
            
            .infoWrap>p{
                color: gray;
                font-size: 0.8em;
                display: table-cell;
            }
            
            .infoWrap>h4{
                color: #0cabba;
                text-align: right;
            }
            
            @media(max-width:600px){
                .Main{
                    flex-direction: column;
                    justify-content: center;
                    
                }
            }
        </style>
        
    </head>
    <body>
        <%@include  file="../session/getCookieId.jsp" %>
        <jsp:include page="../Components/header.jsp"/>
        
         <%
            String ProductId=request.getParameter("pid");
            getProductData pd=new getProductData();
            
            // Get Product Data
            Product product= pd.getProductData(ProductId);
            String pimg="../uploads/products/"+product.getProductImg();
            
            String productName=product.getProductName();
            
            getBidData gbd=new getBidData(ProductId);
            
            //Get Winning Bid
            Bid bid=gbd.BidWinner();
            UserData userData=null;
            if(bid!=null){
            
                String WinnerId= bid.getBidderId();

                getUserData gud=new getUserData(WinnerId);

                // Winner Data
                userData= gud.getData();
             }
        %>
        
        
        <div class="Main">
            <div class="imgSec">
                
                <img src="<%= pimg %>" width="200" alt="alt"/>
                
            </div>
            <div class="InfoSec">
                <div class="infoWrap">
                    <p>ProductTitle</p>
                    <h4><%= product.getProductName()%></h4>
                </div>
                <div class="infoWrap">
                    <p>Product Min Bid Amount</p>
                    <h4>₹ <%= product.getProductMinAmount() %></h4>
                </div>
                <div class="infoWrap">
                    <p> Product Selling Last Bid </p>
                    <%
                        if(bid==null){
                        
                    %>
                        Not Sold
                        <% }
                        else{
                        %>
                        
                    <h4>₹ <%= bid.getBidAmount()%></h4>
                    
                    <% } %>
                </div>    
                    
                <div class="infoWrap">
                    <p>Sold To</p>
                    <%
                        if(bid==null){
                        
                    %>
                       None
                        <% }
                        else{
                        %>
                        
                    <h4><%= userData.getUserFullName() %></h4>
                    
                    <% } %>
                    
                </div>
                    <%
                        if(bid!=null){ 
                    %>
                            <div class="infoWrap">
                                <p>Sold On</p>
                                <h4><%= bid.getBidDate()%></h4>
                            </div>
                
                <% } %>
            </div>
            
            
            
        </div>
        
        
        
        
        
        
        
        
        
        
       <%-- Hello <%= UserId %>
        
       
        
        The Product
        <%=
            productName
            %>
        is Won By
        
        <%= userData.getUserFullName() %>
        
        on <%= bid.getBidDate() %>
        
        At <%= bid.getBidAmount() %>
        
        --%>
        
    <center><p>Copyright G@nesh Parmar Auction</p></center>
    </body>
</html>
