<%-- 
|7
    Document   : index
    Created on : Jul 20, 2022, 8:49:34 AM
    Author     : Admin
--%>

<%@page import="blueprint.Product"%>
<%@page import="java.util.List"%>
<%@page import="Data.getProductData"%>
<%@page import="Controller.Db"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <%-- Bootstrap--%>
        <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/css/bootstrap.min.css" integrity="sha512-XWTTruHZEYJsxV3W/lSXG1n3Q39YIWOstqvmFsdNEEQfHoZ6vm6E9GK2OrF6DSJSpIbRbi+Nn0WDPID9O7xB2Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />-->
        <%-- Owl Carosel--%>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="Css/index.css"/>
    </head>
    <body>
        
        
        <%@include file="Components/header.jsp" %>
        <form action="Page/bidProduct.jsp" method="post">
                            <div class="inputWrap">
                                <input type="search" name="search" placeholder="Search"/>  
                                <button><i class="fa fa-search" aria-hidden="true"></i></button>

                            </div>
        </form>
        <div class="sec sec1">
            <h3 class="title">Todays Hot Deals</h3><br>
            <!--<div class="">-->
               <div class="owl-carousel owl-theme">

                   <%
                       getProductData pd=new getProductData();
                       List<Product> products=pd.getProducts();
                       
                       String pname,pdesc,pminprice,pseller,pimg;
                       
                       int limit=0;
                       for(Product p:products){
                       
                       if(limit>4){
                        break;
                       }
                       
                        pname=p.getProductName();
                        pdesc=p.getProductDesc();
                        pminprice=p.getProductMinAmount();
                        
                        pimg="uploads/products/"+p.getProductImg();
                        
                        getUserData userData=new getUserData(p.getSellerId());
                        user=userData.getData();
                        pseller=user.getUsername();
                        if(("Approved").equals(p.getProductGranted()) && !("Ended").equals(p.getProductState())){
                        String href_="";
                        href_="Page/Bid.jsp?pid="+p.getProductId();
             
                   %>
                       
                       <div class="item">
                        <jsp:include page="/Components/Items/ItemCard.jsp">
                            <jsp:param name="href" value="<%= href_ %>"/>
                            <jsp:param name="ItemName" value="<%= pname %>"/>
                            <jsp:param name="ItemPrice" value="<%= pminprice %>"/>
                            <jsp:param name="ItemSeller" value="<%= pseller %>"/>
                            <jsp:param name="ItemFeature" value="<%= pdesc %>"/>
                            <jsp:param name="imgadd" value="<%= pimg %>"/>
                        </jsp:include>
                       </div>
                   
                    <% 
                        limit++;
                        }} %>  
            </div>
            <div class="homeNavWrap">
                <div class="homeNavigations">
                    <a href="Page/bidProduct.jsp">
                    <div class="navButton">
                        <h4><span>Place Bid</span></h4>
                        <svg xmlns="http://www.w3.org/2000/svg" width="85" height="70" viewBox="0 0 147.784 127.279">
                            <path id="law" d="M145.182,125.041a9.726,9.726,0,0,1-12.414,0L67.975,69.233,52.819,82.282v.124a6.926,6.926,0,0,1,0,10.815,9.92,9.92,0,0,1-12.553,0L2.6,60.779a6.922,6.922,0,0,1,0-10.812A9.315,9.315,0,0,1,8.875,47.73a9.269,9.269,0,0,1,6.277,2.238l.144.124,42.86-36.914-.144-.124a6.923,6.923,0,0,1,0-10.815,9.92,9.92,0,0,1,12.553,0L108.237,34.68a6.922,6.922,0,0,1,0,10.812,9.92,9.92,0,0,1-12.553,0l-.144-.124L80.388,58.418l64.8,55.932a6.8,6.8,0,0,1,0,10.691ZM48.636,31.074,36.227,41.889l26.12,22.5L74.756,53.7Z" fill="#0cabba"/>
                        </svg>


                    </div>
                </a>
                <a href="Page/SellProduct.jsp">
                    <div class="navButton">
                        <h4><span>Sale Products</span></h4>
                        <svg 
                            xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink"
                            width="75px" height="90px">
                           <image  x="0px" y="0px" width="75px" height="90px"  xlink:href="data:img/png;base64,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" />
                        </svg>

                    </div>
                </a>
                <%--
                <a href="#">
                    <div class="navButton">
                        <h4><span>My Bids</span></h4>
                        
                        <svg 
                            xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink"
                            width="70px" height="70px">
                           <image  x="0px" y="0px" width="70px" height="70px"  xlink:href="data:img/png;base64,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" />
                        </svg>

                    </div>
                </a>
                --%>
                    <a href="Page/myproducts.jsp">
                    <div class="navButton">
                        <h4><span>My Products</span></h4>
                        <svg id="cart" xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 111.247 111.326">
                            <path id="Path_1" data-name="Path 1" d="M34.5,19.676v7.416h70.456V41.774L96.728,67.883H32.165L22.9,1.125H1.125V8.541H16.436L25.708,75.3h76.459l10.205-32.385V19.676Z" transform="translate(-1.125 -1.125)" fill="#0cabba"/>
                            <path id="Path_2" data-name="Path 2" d="M22.777,25.9A14.833,14.833,0,1,0,37.61,40.732,14.849,14.849,0,0,0,22.777,25.9Zm0,22.249a7.416,7.416,0,1,1,7.416-7.416A7.416,7.416,0,0,1,22.777,48.148Z" transform="translate(14.533 55.761)" fill="#0cabba"/>
                            <path id="Path_3" data-name="Path 3" d="M38.527,25.9A14.833,14.833,0,1,0,53.36,40.732,14.849,14.849,0,0,0,38.527,25.9Zm0,22.249a7.416,7.416,0,1,1,7.416-7.416A7.416,7.416,0,0,1,38.527,48.148Z" transform="translate(50.698 55.761)" fill="#0cabba"/>
                          </svg>

                    </div>
                </a>
                
                    <a href="Page/myaccount.jsp">
                    <div class="navButton">
                        <h4><span>My Account</span></h4>
                        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 126.772 111.326">
                            <path id="account" d="M63.384,57.632a32.965,32.965,0,0,1-22.492-8.139Q31.6,41.354,31.6,29.8t9.3-19.691A33,33,0,0,1,63.388,1.969a32.937,32.937,0,0,1,22.488,8.139q9.3,8.142,9.3,19.694T85.876,49.5a32.943,32.943,0,0,1-22.492,8.139Zm0,14a128.089,128.089,0,0,1,25.839,2.931,87.836,87.836,0,0,1,25.839,9.6q11.71,6.674,11.71,15.135v14H0v-14q0-8.465,11.71-15.135a87.966,87.966,0,0,1,25.839-9.6,127.757,127.757,0,0,1,25.839-2.931Z" transform="translate(0 -1.969)" fill="#0cabba"/>
                        </svg>


                    </div>
                </a>
                
            </div>
            
        </div>
        
            </div>
            
        
        <%@include file="Components/footer.jsp" %>
        
        <%-- Bootstrap -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/js/bootstrap.min.js" integrity="sha512-8Y8eGK92dzouwpROIppwr+0kPauu0qqtnzZZNEF8Pat5tuRNJxJXCkbQfJ0HlUG3y1HB3z18CSKmUo7i2zcPpg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
        <%-- --%>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
        <script>
            $('.owl-carousel').owlCarousel({
                loop: true,
                margin:10,
                responsiveClass:true,
                stagePadding:70,
                autoplay:true,
                autoplayTimeout:3000,
                autoplayHoverPause:true,
                nav:true,
                navText : ["<i class='fa fa-chevron-left'></i>","<i class='fa fa-chevron-right'></i>"],
                responsive:{
                    0:{
                        items:1,
                        stagePadding:0,
                        nav:false,
                        margin:10
                    },
                    350:{
                        items:1,
                        stagePadding:15,
                        nav:false,
                        margin:0                        
                        
                    },
                    760:{
                        items:2,
                        stagePadding:50
                        
                    },
                    1000:{
                        items:2
                    }
                }
            })
        </script>
    </body>
</html>
