<%-- 
    Document   : bidProduct
    Created on : Aug 18, 2022, 8:02:54 AM
    Author     : Admin
--%>


<%@page import="blueprint.Product"%>
<%@page import="blueprint.UserData"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Data.getUserData"%>
<%@page import="java.util.List"%>
<%@page import="Data.getProductData"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="../Css/index.css"/>
        <link rel="stylesheet" href="../Css/item.css"/>
        <style>
            .wrapper_{
                display: flex;
                height: fit-content;
                min-height: 55vh;
                margin: 1em 0;
                flex-wrap: wrap;
                gap: 10px;
                justify-content: center;
            }
            .item_{
                /*display: block;*/
                width: fit-content !important;
                min-width: 300px;
                border: 1px solid #0cabba;
                /*box-shadow: 0px 0px 10px 5px #87d5dc;*/
                float: none;
            }
             .btnWrap{
                display: flex;
                flex-wrap: wrap;
                margin: 1em 0;
                width: 90%;
                margin: 10px auto;
            }
            .btnWrap>button{
                flex: 1;
                padding: 1em 0;
                cursor: pointer;
                background: none;
                background: #87d5dc;
                color: white;
                border: 1px solid gray;
                
            }
            
            .btnWrap>button.active{
                background: #0cabba;
            }
            
            .inputWrap{
                width: 90%;
                max-width: 400px;
                margin: 5px auto;
                border: 1px solid #87d5dc;
                display: flex;
                border-radius: 3px;
            }
            
            input[type="search"]{
                background: none;
                border:none;
                flex: 1;
                padding: 1em;
            }
            input[type="search"]:focus{
                border: none;
                outline: none;
            }
            button{
                padding: 1em 1.4em;
                background: none;
                /*background: #0cabba;*/
                border: none;
                color: #0cabba;
                outline: none;
                margin: 0;
            }
            
            button:active,button:hover{
                color: white;
                background: #0cabba;
            }
            
            .NotStarted{
                display: none;
            }
            
            .Ended{
                display: none;
            }
            
            .text-brand{
                color: #0cabba;
                font-size: 1.4em;
            }
            
            @media (max-width:499px){
                .wrapper_{
                    gap: 10px;
                    flex-direction: column;
                    justify-content: center;
                }
                
            }
            
        </style>
        <title>JSP Page</title>
    </head>
    <body>
          <jsp:include page="../Components/header.jsp"/>
        
          <%@include file="../session/getCookieId.jsp" %>
          
          <form action="" method="post">
              <div class="inputWrap">
                  <input type="search" name="search" placeholder="Search"/>  
                <button><i class="fa fa-search" aria-hidden="true"></i></button>
                  
              </div>
          </form>
          
          
           <div class="btnWrap"> 
                <button class="active" id="btn1">Started</button>
                <button class="" id="btn2">Upcoming</button>
                <button class="" id="btn3">Ended</button>
           </div>
          
          <div class="wrapper_">
          
          
         <% 
            if(UserId!=""){
            getProductData pd=new getProductData();
            List<Product> products= pd.getProducts();
            String pname,pdesc,pminprice,pseller,pimg;
            
            if(("POST").equals(request.getMethod()) && request.getParameter("search")!=""){
                products.clear();
                products=pd.getProductSearch(request.getParameter("search"));
             }
             if(products.isEmpty()){
         %>   
         No Products Found With name <%= request.getParameter("search") %>
        <%    }
        for(Product p:products){
            pname=p.getProductName();
            pdesc=p.getProductDesc();
            pminprice="₹ "+p.getProductMinAmount();
            pimg="../uploads/products/"+p.getProductImg();
            
            String class_=p.getProductState();
            
            getUserData userData=new getUserData(p.getSellerId());
            UserData user=userData.getData();
            pseller=user.getUsername();
            String href_="";
            
            if("NotApproved".equals(p.getProductGranted())){
                continue;
            }

            
            
            String[] features=pdesc.split(",");
            
            if("Started".equals(class_)){
                href_="Bid.jsp?pid="+p.getProductId();
             }
             else if("Ended".equals(class_)){
                
                href_="BidResult.jsp?pid="+p.getProductId();
             }
             else
             {
               href_="";
             }
             
             if((UserId).equals(p.getSellerId())){
                continue;
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
                    Click to know
                </p>
           <% 
                  if("NotStarted".equals(class_)){%>
                  <span class="text-secondary">Starts at <p class="text-brand"> <%= p.getStartTime() %></p></span>
           <% } %>
            </div>

              
          </div>
          <div class="itemImg">
              <img src=<%= pimg %> width="100" alt=""/>
          </div>
      </div>
      </a>
            
        
        
           <% }}
            else{
                response.sendRedirect("../Login.jsp");
            }

            

        %>  
          </div>
          
        <jsp:include page="../Components/footer.jsp"/>

        <script>
            
            function deactivate() {
                $("#btn1").removeClass("active");
                $("#btn2").removeClass("active");
                $("#btn3").removeClass("active");
                $(".Started").css("display","none");
                $(".NotStarted").css("display","none");
                $(".Ended").css("display","none");
            }
            
            $("#btn1").click(()=>{
                deactivate();
                $("#btn1").addClass("active");
                $(".Started").css("display","block");
            })
            
            $("#btn2").click(()=>{
                deactivate();
                $("#btn2").addClass("active");
                $(".NotStarted").css("display","block");
            })
            
            $("#btn3").click(()=>{
                deactivate();
                $("#btn3").addClass("active");
                $(".Ended").css("display","block");
            })
            
            
        </script>
        
        
    </body>
</html>
