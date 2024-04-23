
<cfinclude template = "header.cfm">
<body class="container-fluid p-0">
    <cfoutput>
    <cfif session.role EQ "admin" OR session.role EQ "editor">
        <cfset session.isLogin=true>
        <cfinclude template="navbar.cfm">
        <div class="labelStyle">
            <h3>Page List</h3>
        </div>
            <div>
                <cfset local.demo=createObject("component","CFC.pages")>
                <cfset local.display=#local.demo.displayPage()#>
            </div>
            <div class="labelStyle">
                <table class="table table-hover table-hover table-striped" id="listTable">
                    <thead>
                    <tr>
                        <th>Page Name</th>
                        <th>Page Description</th>
                        <th>Action</th>
                        
                    </tr>
                    </thead>
                    <cfloop query="#local.display#" >
                        <cfset session.pageId=#pageId#>
                        <cfset session.pageName=#pageName#>
                        <cfset session.pageDes=#pageDes#>
                        <tbody>
                        <tr id="#pageId#">
                            <td>#pageName#</td>
                            <td class="text-wrap">#pageDes#</td>
                            <td>
                                <a href="editPage.cfm?pageId=#pageId#"  title="Edit this page"><img src="../assets/images/editIcon.png" class="ImgStyle" alt='Edit'></a>

                                <button class="border-0 deleteBtn"  type="submit" data-id="#pageId#"><img src="../assets/images/deleteIcon.png" class="ImgStyle" alt='Delete'></button>
                            </td>
                        </tr>   
                        </tbody>  
                    </cfloop>      
                </table>
            </div>
            <div class="back">
                <a href="homePage.cfm" title="Back to home"><img src="../assets/images/arrow.png" alt="back" class="backStyle"></a>
            </div>
            <cfinclude template = "footer.cfm">

        <cfelse>
            <cfset session.isLogin=true>
            <cfinclude template="navbar.cfm">
            <div>
                <cfset local.demo=createObject("component","CFC.pages")>
                <cfset local.display=#local.demo.displayPage()#>
            </div>
            <div class="m-5">
                <table class="table table-hover table-striped">
                    <thead>
                    <tr>
                        <th>PageName</th>
                        <th></th>
                    </tr>
                    </thead>
                    <cfloop query="#local.display#">
                        <tbody>
                        <tr>
                            <td class="">#pageName#</td>
                            <td><a href="view.cfm?idPage=#pageId#"><img src="../assets/images/viewIcon.png" class="ImgStyle" title="View page" alt='view'></a></td>
                        </tr> 
                        </tbody>          
                    </cfloop>
                </table>
            </div>
            <div class="back">
                <a href="homePage.cfm" title="Back to home"><img src="../assets/images/arrow.png" alt="back" class="backStyle"></a>
            </div>
            <cfinclude template="footer.cfm">
    </cfif>
    </cfoutput>

</body>
</html>