$(document).ready(function() {

    $('#login').click(function() {
        $("#invalid").text("");
        var name = $('#name').val().trim(); 
        var password = $('#password').val().trim();
        if (name == ''|| password =='' ){
            $("#invalid").html('Required user name and password');
            return false;
        }
        
        $.ajax({
            url: './../models/pages.cfc?method=doLogin',
            type: 'post',
            data:  {userName: name , password:password},
            dataType:"json",
            success: function(response) {
                if (response.success){
                    $("#success").text('Login successfull !!!!');
                    setTimeout(function() {
                        window.location.href="../view/homePage.cfm";
                    },1000);

                } else {
                    $("#invalid").text('Invalid user name or password !!!!'); 
                }
            },
            error: function(xhr, status, error) {
                console.log("An error occurred: " + error);
            }
        });
        return false;
    });


    $('#editForm').on("submit",function() {
        var pageId = $('#pageId').val().trim(); 
        var pageName = $('#pageName').val().trim();
        $("#editSuccess").text(""); 

        if(validation()){
            $.ajax({
                url: '../models/pages.cfc?method=checkPage',
                type: 'post',
                data: {pageId : pageId, pageName : pageName},
                dataType:"json",
                success: function(response) {
                    console.log(response.success);
                    if(response.success){
                        doSave();
                    }
                    else{
                        $("#error").html(response.msg);    
                        return false;
                    }
                }
            });
        }
        return false;
    });


    $('.deleteBtn').click(function() {
        var pageId =$(this).attr("data-id"); 
        var row=$(this);
        if(!confirm("Are you sure you want delete the page ?")){
            return false;
        }
        $.ajax({
            url: '../models/pages.cfc?method=deletePage',
            type: 'post',
            data:  {pageId: pageId},
            dataType:"json",
            success: function(response) {
                if(response.success){
                    row.parents('tr').remove();
                    //$("#"+pageId).remove();
                } 
            },
        });
        return true;
    });


    function validation(){
        var allParas="";
        var pageName = $('#pageName').val().trim();
        var pageDes = $('#pageDes').val().trim();
        if(pageName==''){  
            allParas+="<br>Page name is required"; 
        }
        else if (/\d/.test(pageName)) {
            allParas+="<br>Page name should be string values";              
        }
        if(pageDes==''){
            allParas+="<br>Page description is required";
        }
        else if(!isNaN(pageDes)){
            allParas+="<br>Page description required strings also";
        }
        if(allParas!==""){
            $("#error").html(allParas);
            return false; 
        }
        return true;
    } 


    function delayRedirect(){
        setTimeout(function() {
            window.location.href="../view/list.cfm";
        },1000);
    }

    function doSave(){
        var pageId = $('#pageId').val().trim(); 
        var pageName = $('#pageName').val().trim();
        var pageDes = $('#pageDes').val().trim();
        $("#editSuccess").text(""); 
        $.ajax({
            url:'../controller/pages.cfc?method=savePage',
            type: 'post',
            data:{ pageId : pageId, pageName : pageName, pageDes : pageDes},
            dataType:"json",
            success: function(response) {
                $("#error").html("");
                if(response.success){
                    $("#editSuccess").html(response.msg);
                    delayRedirect();
                }
                else{
                    $("#error").html(response.msg);    
                }
            },
            error: function(xhr, status, error) {
                console.log("An error occurred: " + error);
            } 
        });
        return false;
    }

});
