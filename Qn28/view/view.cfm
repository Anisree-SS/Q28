
<cfinclude template = "header.cfm">
<body class="container-fluid p-0">
    <cfoutput>
            <cfinclude template = "navbar.cfm">
            <cfset local.idPage=URL.idPage>
            <cfset local.demo=createObject("component","CFC.pages")>
            <cfset local.display=#local.demo.viewPage(local.idPage)#>
            <cfloop query="#local.display#">
            <div class="d-flex justify-content-center">
                <h3>#pageName#</h3>
            </div>
            <div class="d-flex-column align-items-center p-3 border border border-light mx-5 ">
                <p class="heights">#pageDes#</p>
            </div>    
            </cfloop>      
            <div class="back">
                <a href="list.cfm"><img src="../assets/images/arrow.png" alt="back" class="backStyle"></a>
            </div>
            
    </cfoutput>
</body>
</html>