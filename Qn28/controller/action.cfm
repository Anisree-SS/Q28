<cfset variables.pageId=0>
<cfset variables.name=''>
<cfset variables.description=''>
<cfset variables.editMsg=''>
<cfset variables.Error =''> 


<cfif structKeyExists(url,"pageId")>
    <cfset variables.pageId=url.pageId>
    <cfset variables.checkRow=createObject("component","CFC.pages").editPage(url.pageId)>
    <cfset variables.name=variables.checkRow.pageName>
    <cfset variables.description=variables.checkRow.pageDes>
</cfif>

<cfset variables.heading=structKeyExists(variables,"pageId") AND variables.pageId GT 0 ?"Edit Page":"Add Page">