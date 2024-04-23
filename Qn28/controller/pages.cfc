component {
    remote function savePage(pageId,pageName,pageDes) returnFormat="JSON" {
        local.error='';
        if(len(trim(pageName)) EQ 0 ){
             local.error&="Page name is required!!"&"<br>";
        }
        else if ((REFind("\d", pageName)) OR (len(pageName) GT 40)){
            local.error&="Page name should be string with less than 40 letters!! "&"<br>";
        }
       
        if(len(trim(pageDes)) EQ 0){
            local.error&="Page description is required!!"&"<br>";
        }
        else if(isNumeric(pageDes)){
            local.error&="Page description is required!!"&"<br>";
        }
       
        if(len(local.error) EQ 0){
            local.update=createObject("component","CFC.pages");
            local.editMsg=local.update.savePage(pageName,pageDes,pageId);
            return local.editMsg;  
        }
        else{
            return {"success":false,"msg":"#local.error#"};
        }
    }   
}

