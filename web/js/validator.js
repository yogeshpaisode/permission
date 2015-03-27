function onlyAlphabets(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else {
            return true;
        }
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)||(charCode==32))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}
                                
                                
function onlyNumbers(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else {
            return true;
        }
        if ((charCode > 47 && charCode < 58))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}

function validateStep1Form() {
    
    
    var email = document.getElementById('email');
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if (!filter.test(email.value)) {
        alert('Please Provide a Valid Email Address');        
        return false;
    } 
    var num = document.getElementById('numBro').value;   
    if(num.length==10){        
    }
    else{
        alert('Mobile Number Length Should Be Exactly 10');        
        return false;
    }
    
    var pre=num.substring(0,1);
    
    if(pre=="0"){
        alert('Mobile Number Can Not Be Start With 0');        
        return false;
    }
    
    pre=num.substring(0,2);
    
    if(pre=="91"||pre=="+9"){
        alert('Mobile Number Can Not Be Start With 91');        
        return false;
    }
    
    var step1Address = document.getElementById('step1Address').value;   
    if(step1Address.length>90){
        alert('Address Length Should Be Less Than 90 Charecter');        
        return false;
    }
}


function validateStep2Form() {     
    var peopleNumber = document.getElementById('peopleNumber').value;       
    if(peopleNumber==0){
        alert('Expected Number Of People Can Not Be 0');        
        return false;
    }    
    if(peopleNumber.length>5){
        alert('Expected Number Of People Should Be Less Than 1,00000');        
        return false;
    }    
    var pincode = document.getElementById('pincode').value; 
       
    if(pincode.length==6){        
    }
    else{
        alert('Please Provide a Valid Pincode');        
        return false;
    }
    
    if(pincode=='000000'){
        alert('Pincode Can Not Be 0');        
        return false;
    }   
    
    var two=pincode.substr(0,2);
    
    var pre=parseInt(two);
    
    if((two>=11)&&(two<=92)){        
    }
    else{ 
        alert('Please Provide a Valid Pincode');        
        return false;
    }
    
    var step2Address = document.getElementById('step2Address').value;   
    if(step2Address.length>90){
        alert('Address Length Should Be Less Than 90 Charecter');        
        return false;
    }
    
    var processionStart = document.getElementById('processionStart').value;   
    if(processionStart.length>90){
        alert('Address Length Should Be Less Than 90 Charecter');        
        return false;
    }
    
    var processionEnd = document.getElementById('processionEnd').value;   
    if(processionEnd.length>90){
        alert('Address Length Should Be Less Than 90 Charecter');        
        return false;
    }
 
    var inputfile = document.getElementById('inputfile').value; 
    inputfile="data"+inputfile;
    var lengthTxt=inputfile.length;
    var fileData=inputfile.substring(lengthTxt-4);
    if(fileData==".png"||fileData==".jpg"||fileData==".PNG"||fileData==".JPG"||fileData==".jpeg"||fileData==".JPEG"||fileData=="data"){        
    }
    else{
        alert('Please Upload Only .png or .jpg Format File');        
        return false;
    }
 
}



function validateStep3Form() {  
   
    var starttime = document.getElementById('starttime').value;   
    if(starttime=="Select Start Time"){
        alert('Please Provide Start Time');        
        return false;
    } 
  
    
    var start=parseInt(starttime);
    
    var endtime = document.getElementById('endtime').value;   
    if(endtime=="Select End Time"){
        alert('Please Provide End Time');        
        return false;
    }    
    
    
    var end=parseInt(endtime);   
    if(end<start){
        alert('Start Time Can Not Be Advance Than End Time');        
        return false;
    }
    
    var temp = document.getElementById('date').value;   
   
    var userDate=new Date(temp);
    var systemDate=new Date();
    
    if(userDate<systemDate){
        alert("Date Can Not Be Less/Equal Than Current Date "+systemDate);
        return false;
    }
    
    if(userDate==systemDate){
        alert("Date Can Not Be Equal Than Current Date "+systemDate);
        return false;
    }
    
  
}