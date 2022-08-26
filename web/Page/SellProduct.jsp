<%-- 
    Document   : SellProduct
    Created on : Aug 15, 2022, 7:50:11 AM
    Author     : Admin
--%>

<%@page import="Data.CookieInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../Css/index.css"/>
        <link rel="stylesheet" href="../Css/register.css"/>
        <style>
            
            
            form{
                margin: 20px auto;
                height: fit-content;
            }
            .sec{
                display: block;
            }
            .inputWrap{
                width: 100%;
                max-width: 100%;
                margin: 0;
                margin-top: 10px;
                
            }
            
            .inputWrap>input{
                width: 100%;
            }
            
            #pdesc{
                height: 200px !important;
                align-items: start;
                padding: 10px 0;
            }
            .lds-roller {
                display: block;
                position: absolute;
                top: 50%;
                left:50%;
                transform: translate(-50%,-50%);
                width: 80px;
                height: 80px;
              }
              .lds-roller div {
                animation: lds-roller 1.2s cubic-bezier(0.5, 0, 0.5, 1) infinite;
                transform-origin: 40px 40px;
              }
              .lds-roller div:after {
                content: " ";
                display: block;
                position: absolute;
                width: 7px;
                height: 7px;
                border-radius: 50%;
                background: #0cabba;
                margin: -4px 0 0 -4px;
              }
              .lds-roller div:nth-child(1) {
                animation-delay: -0.036s;
              }
              .lds-roller div:nth-child(1):after {
                top: 63px;
                left: 63px;
              }
              .lds-roller div:nth-child(2) {
                animation-delay: -0.072s;
              }
              .lds-roller div:nth-child(2):after {
                top: 68px;
                left: 56px;
              }
              .lds-roller div:nth-child(3) {
                animation-delay: -0.108s;
              }
              .lds-roller div:nth-child(3):after {
                top: 71px;
                left: 48px;
              }
              .lds-roller div:nth-child(4) {
                animation-delay: -0.144s;
              }
              .lds-roller div:nth-child(4):after {
                top: 72px;
                left: 40px;
              }
              .lds-roller div:nth-child(5) {
                animation-delay: -0.18s;
              }
              .lds-roller div:nth-child(5):after {
                top: 71px;
                left: 32px;
              }
              .lds-roller div:nth-child(6) {
                animation-delay: -0.216s;
              }
              .lds-roller div:nth-child(6):after {
                top: 68px;
                left: 24px;
              }
              .lds-roller div:nth-child(7) {
                animation-delay: -0.252s;
              }
              .lds-roller div:nth-child(7):after {
                top: 63px;
                left: 17px;
              }
              .lds-roller div:nth-child(8) {
                animation-delay: -0.288s;
              }
              .lds-roller div:nth-child(8):after {
                top: 56px;
                left: 12px;
              }
              @keyframes lds-roller {
                0% {
                  transform: rotate(0deg);
                }
                100% {
                  transform: rotate(360deg);
                }
              }

        </style>
    </head>
    <body>
        <%
            Cookie []c=request.getCookies();
                        
            CookieInfo mycookie=new CookieInfo(c, "UserId");
            String UserId=mycookie.getCookieValue();
            
            
            
            if(UserId!=""){%>
        <%@include file="../Components/loginHeader.jsp" %>
        <div class="lds-roller" id="loader"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>
        <div class="form-wrap">
            <form method="post" action="../RequestProductAdd" id="productForm" enctype = "multipart/form-data">
                <h2 class="">Sell Product Registration Form</h2><br>
                
                <%
                    if(request.getParameter("action")!=null){
                    %><script>
                        alert("Prdouct Request Wait for approval")
                    </script>
                    <%}
                    %>
                
                
                <div class="sec">
                    <div class="inputWrap">
                        <input class="aniamteInput" type="text" name="pname" required/>
                        <label for="pname">Product Name</label>
                        <span class="required">*</span>
                    </div>
                    <div class="inputWrap" id="pdesc" >
                        <textarea class="aniamteInput" name="pdesc" form="productForm"></textarea>
                        <label for="pdesc">Product Description(use , )</label>
                        <span class="required">*</span>
                    </div>
                    <div class="inputWrap">
                        <input class="aniamteInput" type="number" name="minpamount" required/>
                        <label for="minpamount">Enter Min Amount</label>
                        <span class="required">*</span>
                    </div>
                    <div class="inputWrap">
                        <select name="category" class="aniamteInput" id="categories">
                          
                        </select>
                        <span class="required">*</span>
                    </div>

                     <div class="inputWrap entered">
                         <input class="aniamteInput" type="datetime-local" id="startTime" name="startTime" required/>
                        <label for="satrtTime">Enter Start Time</label>
                        <span class="required">*</span>
                    </div>
                    <div class="inputWrap entered">
                        <input class="aniamteInput" type="datetime-local" id="endTime" name="endTime" required/>
                        <label for="endTime">Enter End Time</label>
                        <span class="required">*</span>
                    </div>
                    <br>
                    <div class="">
                        <input class="aniamteInput" type="file" name="pimg" required/>
                        <span class="required">*</span>
                    </div>

                </div>
                <button id="requestAddProduct" class="btn">RequestToAdd</button>

                <!--<input type="submit" class="btn" value="Login"/>-->
                
                <!--<p class="text-center">Already registered? <a href="./Login.jsp" class="registerlink">Login</a></p>-->
            </form>
        </div>
       
        
        
        
        
        <center><p>2021-2022 Copyright G@nesh Om Luv</p></center>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script type="text/javascript" src="../Scripts/input.js"></script>
        <script>
              
              
           $.ajax({
			url : '../getCategories',
			success : function(categoriesList) {
                                $("#loader").fadeOut();
				$("#categories").html(categoriesList);
			}
		});
          $("#startTime").focusout(
            function (){
                     var currentDate=new Date($.now());
                     var d=new Date($(this).val());
                     if(currentDate>d){
                         alert("Select the correct time")
                     }
                     else if(currentDate<d){
                         
                     }
                     else{
                         $(this).val('');
                     }
                }      
            );
    
            $("#endTime").focusin(function (){
                if($("#startTime").val()===""){
                    alert("Enter Start Time");
                    $(this).blur();
                }
            })  
            
             $("#endTime").focusout(
            function (){
                     var startTime=new Date($("#startTime").val());
                     var endTime=new Date($("#endTime").val());
                     if(startTime>endTime){
                         alert("Select the correct end time");
                         $(this).val('');
                     }
                     else if(startTime < endTime){
                         alert("You entered" + $(this).val())
                     }
                     else{
                         $(this).value="";
                     }
                }      
            );
            
            <% } 
        else{
                response.sendRedirect("../Login.jsp");
            }
            %>
            
        </script>
    </body>
</html>
