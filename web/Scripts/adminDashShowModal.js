/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


 const myModal=document.querySelector("#myModal");
                const delLink=document.querySelector("#deleteLink");
                function showModal(e) {
                        
                        delLink.href=e;
                        myModal.style.display="block";
                }
                function closeModal(){
                     myModal.style.display="none";
                }