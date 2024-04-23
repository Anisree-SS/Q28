<cfset result=createObject("component","CFC.pages").login()>
<cfinclude template = "header.cfm">
<body class="container-fluid p-0">
    <cfoutput>
    <cfinclude template = "navbar.cfm">
        <div class="loginDiv">
            <form action="login.cfm" method="post" >
                <h2 class="labelStyle">Log in</h2>
                <div class="labelStyle">
                    <input type="text" name="userName" class="inputLogin" placeholder="User Name" id='name'>
                    <input type="password" name="password" class="inputLogin" placeholder="Password" id='password'>
                </div>
                <div class="labelStyle">
                    <input type="submit" name="submit" value="login" class="inputLogin loginColor" id='login'>
                </div>
                <p class="labelStyle text-success" id="success"></p>
                <p class="labelStyle text-danger" id="invalid"></p>
            </form>
        </div>
    </cfoutput>
</body>
</html>