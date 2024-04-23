<cfcomponent>
        <cffunction name="init" returntype="void">
            <cfset i = 1>
        </cffunction>
        
        <!--- Log in--->
        <cffunction name="login" access="public" returntype="void">
            <cfif session.isLogin>
                <cflocation url="../view/homePage.cfm" addToken="no">                    
            </cfif>
        </cffunction>

        <!--- Log Out --->
        <cffunction name="pageLogin" access="remote" returntype="void">
            <CFSET StructClear(Session)>
            <cfset session.isLogin=false>
            <cflocation url="../view/login.cfm" addToken="no">
        </cffunction>

        <!--- Do Login --->
        <cffunction name="doLogin" access="remote" returnformat="json">
            <cfargument name="userName" required="true">
            <cfargument name="password" required="true">
            
            <cfquery name="checkLogin" result="loginCheck">
                select userId,userName,password,role 
                from loginTable
                where userName=<cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">
                AND password=<cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar"> 
            </cfquery>

            <cfif checkLogin.recordCount>
                <cfset session.role=checkLogin.role>
                <cfif session.role EQ "admin" || session.role EQ "editor" || session.role EQ "user">
                    <cfset session.isLogin=true>
                    <cfreturn {"success":true}>
                </cfif>
                <cfelse>
                    <cfreturn {"success":false}>
            </cfif>
        </cffunction>

        <!--- For Display Table --->
        <cffunction name="displayPage" access="remote" returntype="query">
            <cfquery name="forDisplay">
                select pageId,pageName,pageDes 
                from page;
            </cfquery>
            <cfreturn forDisplay>
        </cffunction>

        <!--- view for user--->
        <cffunction name="viewpage" access="remote" returntype="query">
            <cfargument name="idPage">
            <cfquery name="forDisplay">
                select pageId,pageName,pageDes 
                from page
                where pageId =<cfqueryparam value="#arguments.idPage#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfreturn forDisplay>
        </cffunction>

        <!--- Edit Row --->
        <cffunction name="editPage" access="remote" returntype="query">
            <cfargument name="pageId" required="true">
            <cfquery name="check">
                select pageId,pageName,pageDes 
                from page 
                where pageId=<cfqueryparam value="#arguments.pageId#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfreturn check>
        </cffunction>

        <!--- Save Page --->
        <cffunction name="savePage" access="remote" returnformat="json">
            <cfargument name="pageName" required="true">
            <cfargument name="pageDes" required="true">
            <cfargument name="pageId" required="true">
            <cfif arguments.pageId GT 0>
                <cfquery name="updatePage">
                    update page 
                    set pageName=<cfqueryparam value="#arguments.pageName#" cfsqltype="cf_sql_varchar">,
                        pageDes=<cfqueryparam value="#arguments.pageDes#" cfsqltype="cf_sql_varchar">
                    where pageId=<cfqueryparam value="#arguments.pageId#" cfsqltype="cf_sql_integer">
                </cfquery>
                <cfreturn {"success":true, "msg":"Page updated successfully"}>
                <cfelse>
                    <cfquery name="insertRow">
                        insert into page (pageName,pageDes)
                        values(
                            <cfqueryparam value="#arguments.pageName#" cfsqltype="cf_sql_varchar">,
                            <cfqueryparam value="#arguments.pageDes#" cfsqltype="cf_sql_varchar">
                        )
                    </cfquery>
                    <cfreturn {"success":true,"msg":"Page inserted successfully"}>
            </cfif>
        </cffunction>

        <!--- check Page present --->
        <cffunction name='checkPage' access="remote" returnformat="json">
            <cfargument name="pageId" required="true">
            <cfargument name="pageName" required="true">
            <cfquery name="pageCheck">
                select pageName 
                from page
                where pageName=<cfqueryparam value="#arguments.pageName#" cfsqltype="cf_sql_varchar">
                AND pageID !=<cfqueryparam value="#arguments.pageId#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfif pageCheck.recordCount>
                <cfreturn {"success":false, "msg":"The page is already present"}>
                <cfelse>
                <cfreturn {"success":true, "msg":""}>
            </cfif>
        </cffunction>

        <!--- Delete Row --->
        <cffunction name="deletePage" access="remote" returnformat="json">
            <cfargument name="pageId" required="true">
            <cfquery name="delete">
                delete from page
                where pageId=<cfqueryparam value="#arguments.pageId#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfreturn {"success":true}>
        </cffunction>
        
</cfcomponent>