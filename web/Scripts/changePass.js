/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


//Selecting all the inputs

const inputs=document.getElementsByClassName("form-control");

const oldpassInput=inputs[0];

const newpassInput=inputs[1];

const newpassInput2=inputs[2];

newpassInput.addEventListener("blur", (e)=>{
    if(e.target.value!=""){
        newpassInput2.focus=true;
        $("#fakePass").hide();
    }
    else{
        newpassInput2.value="";
        $("#fakePass").show();
    }
});

newpassInput2.addEventListener("blur", (e)=>{
    checkPass();
});

function checkPass(){
    console.log("In check pass")
    if(newpassInput2.value!=""){
            if(newpassInput2.value!=newpassInput.value){
                newpassInput2.value="";
                $('#Alert').fadeIn('slow').delay(1000).fadeOut('slow');
            }
            else{
                $("#passChngeform").submit();
            }
        }
}
    
document.querySelector('#passChngeform').addEventListener('keypress', function (e) {
    if (e.key === 'Enter') {
      checkPass()
    }
});


//newpassInput.addEventListener('blur',(e)=>{
//    if(e)
//})