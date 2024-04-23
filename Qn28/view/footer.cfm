<cfset variables.forLogin=''>
<cfset variables.forHome=''>
<cfset variables.pageList=''>
<cfset variables.addPage=''>

<cfset variables.forLogin= session.isLogin?"Log out":"Log In">
<cfset variables.forHome= session.isLogin?"homePage.cfm":"home.cfm">
<cfset variables.pageList=session.isLogin &&(session.role EQ "admin"||session.role EQ "editor" ||session.role EQ "user")?"Page List":"">
<cfset variables.addPage=session.isLogin &&(session.role EQ "admin"||session.role EQ "editor")?"Add Page":"">

<cfoutput>
    <footer class="footerHeight bg-light d-flex justify-content-center align-items-center ">
        <div class="d-flex">
            <div class="m-4 d-flex justify-content-between text-sm">
                <div>Page Dive</div>
            </div>
        </div>
        <div class="d-flex">
            <nav class="navbar navbar-expand-lg navbar-light px-3">
                <a  href="#variables.forHome#" class="text-secondary">Home</a>
            </nav>
            <nav class="navbar navbar-expand-lg navbar-light  px-3">
                <a  href="List.cfm" class="text-secondary">#variables.pageList#</a>
            </nav>
            <nav class="navbar navbar-expand-lg navbar-light  px-3">
                <a  href="editPage.cfm" class="text-secondary">#variables.addPage#</a>
            </nav>
            <nav class="navbar navbar-expand-lg navbar-light  px-3">
                <a class="nav-link text-secondary" href="../models/pages.cfc?method=pageLogin">#variables.forLogin#</a>
            </nav>
        </div>
    </footer>
</cfoutput>