<%-- 
    Document   : header
    Created on : Jul 20, 2022, 3:34:18 PM
    Author     : Admin
--%>

<%@page import="blueprint.UserData"%>
<%@page import="Data.getUserData"%>
<%@page import="Data.CookieInfo"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Css/index.css"/>
        
        <style>
            button:focus{
                box-shadow: 0px 0px 1px 3px #0cabba;
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
        </style>
    </head>
    
    
    <body>
       <nav>
            <div class="nav-wrap">
                <h1>
                    Boli Laga
                </h1>
                 
                <ul id="bigScreen">
                    <li><a class="active" href="#">Home</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact</a></li>
                    
                    <%@page import="Controller.Db" %>
                   
                    <%!
                        UserData user;
                        %>
                    <%
                        String username="";
                        
                        boolean loginShow=false;
                        Cookie []ck=request.getCookies();
                        
                        CookieInfo mycookie=new CookieInfo(ck, "UserId");
                        String UserId=mycookie.getCookieValue();
                        
                        getUserData userinfo=new getUserData(UserId);
                        user=userinfo.getData();
                        
                        if(UserId!="" && user!=null){
                                        
                                   out.println("<li class=''>Hello "+user.getUsername()+"</li>");
                                   }
                                
//                                out.println("<li class='btn'><a href='Login.jsp'>Login</a></li>");
                            
                            else{
                                    loginShow=true;
                                    out.println("<li class='btn'><a href='Login.jsp'>Login</a></li>");
                                }
//                        }
                    
                        
                        %>
                    <!--<li class="btn"><a href="Login.jsp">Login</a></li>-->
                </ul>
                    
                    <div class="smShow">
                        <%
                            if(!loginShow){
                               out.println("<h5 class=''>Hello "+user.getUsername()+"</h5>");
                                
                            }
                            %>
                            <button class="btn" onclick="showNav(this)">
                            <svg fill="#000000" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 24 24" width="24px" height="24px"><path d="M 2 5 L 2 7 L 22 7 L 22 5 L 2 5 z M 2 11 L 2 13 L 22 13 L 22 11 L 2 11 z M 2 17 L 2 19 L 22 19 L 22 17 L 2 17 z"/></svg>
                        </button>
                    </div>   
                    
                    <ul id="smallScreen" class="nav">
                        <li><a class="active" href="#">Home</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Contact</a></li>
                         
                        <% if(loginShow){
                                out.println("<li class='btn'><a href='Login.jsp'>Login</a></li>");
                            }
                    
                        
                        %>
                </ul>    
            </div>            
        </nav>
                
                <script>
                    function showNav(e){
                        console.log("I am in");
                        const smNav=document.getElementById("smallScreen");
                        
                        if(smNav.classList.contains("navshow")){
                            e.blur();                            
                        }
                        smNav.classList.toggle("navshow");
                    }
                </script>
    </body>
</html>
