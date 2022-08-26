<%-- 
    Document   : Bid
    Created on : Aug 18, 2022, 4:08:56 PM
    Author     : Admin
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Date"%>
<%@page import="Controller.Db"%>
<%@page import="Data.getUserData"%>
<%@page import="blueprint.UserData"%>
<%@page import="java.util.ArrayList"%>
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
        <link rel="stylesheet" href="../Css/register.css"/>  
        <title>JSP Page</title>
        
         <style>
             body{
                 overflow-x: hidden;
             }
             .mainSection{
                 display: flex;
                 flex-direction: column;
                 justify-content: center;
                 width: 100%;
                 /*padding: 1em;*/
                 max-width: 900px;
                margin: 2em auto;
                min-height: 50vh;
                
             }
            .Main{
                max-width: 100%;
                display: flex;
                gap: 1em;
                width: 700px;
                /*flex: 1;*/
                background: white;
                margin: 0 auto;
                border: 1px solid #0caaba;
                padding: 0.5em;
                border-radius: 10px;
            }
            
            .Main2{
                padding: 1em;
                height: fit-content;
                width: fit-content;
                margin: 0 auto;
            }
            
            .InfoSec{
                /*flex: 1;*/
                width: 60%;
                display: table;
            }
            
            .infoWrap{
                width: 100%;
                gap: 1em;
                margin: 10px 0;
                display: table;
               padding: 5px 10px;
            }
            
            
            
            .infoWrap:nth-child(even)>h4{
                color: black !important;
                
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
            
            form{
                /*display: flex;*/
                /*flex-direction: column;*/
                display: block;
            }
            
            form>*{
                width: 100%;
            }
            
            form>input{
                margin: 0 auto;
                width: 90%;
                max-width: 500px;
                
            }
            
            form>button{
                margin: 0 !important;
            }
            
            .inputWrap{
                margin: 0;
                border-radius: 4px;
            }
            
            .tableWrap{
                height: 40vh;
                overflow-y: scroll;
                background: #87d5dc;
            }
            
            
            
            table,td{
                background: none;
                border-collapse: collapse;
                padding: 1em;
                
            }
            th{
                background: #0cabba;
                color: white;
                padding: 1em;
            }
            
            tr:nth-child(odd){
                background: #87d5dc;
            }
            
            tr:last-of-type{
                background: green;
                color: white;
            }
            
            .success{
                /*text-align: ;*/
                padding-left: 3em;
                color: green;
                /*bottom: 100px;*/
            }
            
            .countdown{
                display: flex;
                width: 90%;
                max-width: 400px;
                margin: 0 auto;
                padding: 1em;
                align-items: center;
                justify-content: space-around;
            }
            
            .countdown>div{
                padding: 1em;
                font-size: 1em;
                background: #d3d4d6;
            }
            
            .timerwrap{
                width: fit-content;
                text-align: center;
                display: table;
                /*margin: 0 auto;*/
            }
            
            .timerwrap>.label_{
                margin: 0 auto;
                display: flex;
                width: 50%;
                justify-content: space-evenly;
            }
            
            .text-center{
                text-align: center;
            }
            
            .text-secondary{
                color: gray;
            }
                
            .text-brand{
                color: #0cabba;
            }
            @media(max-width:600px){
                .mainSection{
                    
                    justify-content: center;
                    align-items: center;
                    gap: 1em;

                }
                
                .Main{
                    flex-direction: column;
                    justify-content: center;
                    align-items: center;
                    
                }
                
                .InfoSec{
                    width: 90%;
                }
                
                .timerwrap>.label_{
                    width: 90%;
                }
            }
        </style>
        <link href="../clock/css/flipTimer.css" rel="stylesheet">
        
        <style>
/*             .table{
                display: table;
                
            }
            
            .row{
                width: 100%;
            }
            
*/          
            .timeleft{
                color: red;
            }
            .cell{
                width: 47px !important;
            }
        </style>
       
    </head>
    <body id="body">
        <%@include  file="../session/getCookieId.jsp" %>
        <jsp:include page="../Components/header.jsp" />
        
        <%
            
            //Getting the product Info
            String ProductId=request.getParameter("pid");
            getProductData pd=new getProductData();
            Product product= pd.getProductData(ProductId);
            String pimg="../uploads/products/"+product.getProductImg();
            String pdesc=product.getProductDesc();
            String []p=pdesc.split(",");
            
            
            // If bid is ended Then redirect to result page
            if(("Ended").equals(product.getProductState())){
            
                response.sendRedirect("BidResult.jsp?pid="+ProductId);
            }
            
            
            final SimpleDateFormat formatter6=new SimpleDateFormat("yyyy-mm-dd HH:mm:ss"); 
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-mm-dd  HH:mm:ss");
            
                Date endTime=(Date) formatter6.parse(product.getEndTime());
                LocalDateTime ct = LocalDateTime.now();  
                String ctString= dtf.format(ct);
                Date currentTime=(Date) formatter6.parse(ctString);
                
            long TimeLeft=(endTime.getTime()-currentTime.getTime());  
            
            //Getting the bid Info            
            getBidData gbd=new getBidData(ProductId);
            ArrayList<Bid> bid=gbd.getBids();
            //Getting the user Info
            getUserData gud=new getUserData(product.getSellerId());
            UserData userData=gud.getData();
            
            String productName=product.getProductName();
            
            Boolean iamwinning=false;
            
            Db myDb=new Db("root", "", "auctionsystem");
        %>
        
        <% 
            if(("POST").equals(request.getMethod())){
                
                
                String bidAmt=request.getParameter("bidamt");
                int BidAmount=Integer.parseInt(bidAmt);
                Bid lastbid;
                boolean placebid=true;
                
                
                if(!bid.isEmpty()){
                    lastbid= bid.get(bid.size()-1);
                    if((UserId).equals(lastbid.getBidderId())){
                        iamwinning=true;
                    }
                    if(Integer.parseInt(lastbid.getBidAmount())>= BidAmount || (UserId).equals(lastbid.getBidderId()) ){
                        
                        placebid=false;
                    }
                    else{
                        placebid=true;
                    }
                }
                
                if(placebid){
                    String stmt="Insert into bid(`ProductId`,`UserId`,`BidAmount`) Values(?,?,?)";
                    String[] data={product.getProductId(),UserId,bidAmt};
                    
                    myDb.executeThis(stmt, data);
                    
                    myDb.closeConn();
                    bid=gbd.getBids();
                    iamwinning=true;
//                    response.sendRedirect("Bid.jsp");
                    
                   }
                else{
                    %>
                    <script>
                        alert("There was the error placing the bid check the amount or may be you are the last bidder");
                    </script>
                <%}
                
            }
            
        %>
        
        
        <% 
            if("NotStarted".equals(product.getProductState())){
            %>
            <h1 class="text-center">Bidding not started Yet</h1><br>
            <p class="text-center text-secondary">Bidding Start on <span class="text-brand"><%= product.getEndTime() %></span></p>
        <%}
        else{
        %>
        
        <div class="timerwrap table">
            <h3 class="timeleft">Time Left</h3>
            <div class="flipTimer">

                <div class="days cell"></div>
            
                <div class="hours cell"></div>
                
                <div class="minutes cell"></div>
              
                <div class="seconds cell"></div>
              
              </div>
            
            <div class="label_">
                
                <p class="cell">Days</p>
                <p class="cell">Hours</p>
                <p class="cell">Minutes</p>
                <p class="cell">Seconds</p>
            </div>
        </div>
        
        <% } %>
        
        <div class="mainSection">
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
                    <p>Product Description</p>
                    <h4> 
                        
                        <%
                            for(String desc:p){%>
                            <span>
                                <!-- comment --><%= desc%>
                            </span><br>
                        <% } %>
                    </h4>
                </div>
                <div class="infoWrap">
                    <p>Product Min Bid Amount</p>
                    <h4>₹ <%= product.getProductMinAmount() %></h4>
                </div>
                <div class="infoWrap">
                    <p>Sold By</p>
                    <h4> <%= userData.getUserFullName() %></h4>
                </div>
            </div>
        </div>
                <%
                if(!"NotStarted".equals(product.getProductState())){
                %>
                <div class="Main2">
                    <h3>Bid History </h3>
                    <div class="tableWrap" id="tableWrap">
                        <table>
                            <tr>
                                <th>Bid Id</th>
                                <th>Bid Amount</th>
                                <th>Bid Time</th>
                                <th>
                                    BidderName
                                </th>
                            </tr>
                            <% 
                                for(Bid b: bid){
                            %>
                            <tr>
                                <td><%= b.getBidId() %></td>
                                <td> <%= b.getBidAmount() %> </td>
                                <td><%= b.getBidDate() %></td>

                                <td>
                                    <% 
                                    if(UserId.equals(b.getBidderId())){
                                        out.println("You");
                                    }
                                    else{
                                        out.println(new getUserData(b.getBidderId()).getData().getUserFullName());
                                        }
                                        %>
                                </td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                        <%
                            
                            String bidAmount=(bid.isEmpty())?product.getProductMinAmount():bid.get(bid.size()-1).getBidAmount();

                            %>
                    
                            
                        <% 
                        
                        
                        if(!(UserId.equals(product.getSellerId()))){
                        
                            if(!iamwinning){
                           %> 
                    <!--Bid form-->
                    <form action="" method="Post">
                        <p>Are you Intrested?</p>
                        <br>
                        <div class="inputWrap">
                            <input class="aniamteInput" type="number" name="bidamt" min="<%= (Integer.parseInt(bidAmount) + 100) %>"  maxlength="10" required/>
                            <label for="phoneno">Enter The Bid Amount</label>
                            <span class="required">*</span>
                            <input type="hidden" name="userid" value="<%= UserId %>"/>
                        </div><br>
                        <button class="btn">Place Your Bid Now</button>
                    </form>
                        
                    <% } 
                    else{

                    %>
            
            <h4 class="success">Congrates You are winning!</h4>
            
        <% }}} %> 
                    
                    
                    
                </div>    
            
          
        </div>
        <script type="text/javascript" src="../Scripts/input.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
  
        <script type="text/javascript" src="../clock/js/jquery.flipTimer.js"></script>

        
       
        <script type="text/javascript">
            
            
            
            $(document).ready(function() {
                var scroll=$('#tableWrap');
                scroll.animate({scrollTop: scroll.prop("scrollHeight")}, 1500);
                $("html, body").animate({ scrollTop: $(document).height() }, 2000);
                $('.flipTimer').flipTimer({ 

                // count up or countdown
                direction: 'down', 

                // the target date
                date:    new Date((new Date()).getTime() + <%= TimeLeft %>).toLocaleString().slice(0, 24),

                // callback works only with direction = "down"
                callback: function() {
                                location.reload();
                },

                // custom date
                seconds: true,
                minutes: true,
                hours: true,
                days: true,

                });
                });
        </script>
        
    <center><p>Copyright G@nesh Parmar Auction</p></center>
    </body>
</html>
