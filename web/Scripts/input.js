/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


 var inputs=document.querySelectorAll(".aniamteInput");;
        for (const key in inputs) {
            if (Object.hasOwnProperty.call(inputs, key)) {
                const element = inputs[key];
                
                element.addEventListener('input',(e)=>{
                    var parentInputWrap=e.target.parentElement;
                    if(e.target.value!=""){
                        
                        if(!parentInputWrap.classList.contains('entered')){
                            parentInputWrap.classList.add('entered');
                        }
                    }
                    else{
                        if(parentInputWrap.classList.contains('entered')){
                            parentInputWrap.classList.remove('entered');
                        }
                    }
                })
            }
        }