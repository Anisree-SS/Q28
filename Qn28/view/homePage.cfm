
<cfinclude template = "header.cfm">
<cfoutput>
    <body class="container-fluid p-0">
    <cfif session.isLogin>
        <cfif session.role EQ "user">
            <cfinclude template = "navbar.cfm">
            <div class="d-flex-column m-5">
                <div class="d-flex align-items-center p-3 mx-5">
                    <p class="h2"><i>Welcome to Page Dive! </i></p>
                </div>
                <div class="d-flex-column align-items-center p-3 border border border-light bg-light mx-5">
                    <div class="d-flex align-items-center justify-content-center mb-2">
                        <img src="../assets/images/view.png" class="userView" alt='User View'>
                    </div>
                    <p><b>A</b>s a user, you have access to the latest content added by our administrators. You'll see the main titles of articles, images, or multimedia on our homepage. Simply click on a title to view the full details and dive deeper into the content that interests you. Enjoy exploring and discovering new information on our platform! </p>
                </div>
            </div>
            <cfinclude template = "footer.cfm">

            <cfelse>
                <cfinclude template = "navbar.cfm">
                <div class="d-flex align-items-center p-3 mx-5">
                    <p class="h2"><i>Welcome to Page Dive! </i></p>
                </div>
                <div class="d-flex-column align-items-center p-3 border border border-light bg-light mx-5 my-1">
                    <b class="h5">Add Page</b>
                    <div class="d-flex align-items-center justify-content-center mb-2">
                        <img src="../assets/images/add.jpg" class="adminView" alt='Add Page'>
                    </div>
                    <p> Easily upload new articles, images, or multimedia to your website. Our user-friendly interface makes it simple to keep your content fresh and engaging for your audience. </p>
                </div>
                <div class="d-flex-column align-items-center p-3 border border border-light bg-light mx-5 my-1">
                    <b  class="h5">Edit Page</b>
                    <div class="d-flex align-items-center justify-content-center mb-2">
                        <img src="../assets/images/edit.jpg" class="adminView" alt='Edit Page'>
                    </div>
                    <p>  Quickly make adjustments to existing content. Whether it's updating text, swapping out images, or refining layouts, you can ensure your website stays up-to-date with minimal effort.</p>
                </div>
                <div class="d-flex-column align-items-center p-3 border border border-light bg-light mx-5 my-1">
                    <b class="h5">Delete Page</b>
                    <div class="d-flex align-items-center justify-content-center mb-2">
                        <img src="../assets/images/delete.jpg" class="adminView" alt='Delete Page'>
                    </div>
                    <p>  Remove outdated or irrelevant content with ease. As an administrator, you have the power to maintain the relevance and integrity of your website by efficiently removing any unnecessary Page. </p>
                </div>
                <cfinclude template = "footer.cfm"> 
        </cfif>

        <cfelse>
            <cfinclude template = "navbar.cfm">
            <div class="d-flex-column m-5">
                <div class="d-flex align-items-center p-3 mx-5">
                    <p class="h2">Welcome to Page Dive!</p>
                </div>
                <div class="d-flex align-items-center p-3 mx-5">
                    <p class="h5"><i>As User</i></p>
                </div>
                <div class="d-flex-column align-items-center p-3 border border border-light bg-light mx-5">
                    <div class="d-flex align-items-center justify-content-center mb-2">
                        <img src="../assets/images/view.png" class="userView" alt='User View'>
                    </div>
                    <p><b>A</b>s a user, you have access to the latest content added by our administrators. You'll see the main titles of articles, images, or multimedia on our homepage. Simply click on a title to view the full details and dive deeper into the content that interests you. Enjoy exploring and discovering new information on our platform! </p>
                </div>

                <div class="d-flex align-items-center p-3 mx-5">
                    <p class="h5"><i> As Admin </i></p>
                </div>
                <div class="d-flex-column align-items-center p-3 border border border-light bg-light mx-5">
                    <div><p class="h5">Add Page</p></div>
                    <div class="d-flex align-items-center justify-content-center mb-2">
                        <img src="../assets/images/add.jpg" class="userView" alt='Add Page'>
                    </div>
                    <p><b>E</b>asily upload new articles, images, or multimedia to your website. Our user-friendly interface makes it simple to keep your content fresh and engaging for your audience. </p>
                </div>

                <div class="d-flex align-items-center p-3 mx-5">
                </div>
                <div class="d-flex-column align-items-center p-3 border border border-light bg-light mx-5">
                    <div><p class="h5">Edit Page</p></div>
                    <div class="d-flex align-items-center justify-content-center mb-2">
                        <img src="../assets/images/edit.jpg" class="userView" alt='Edit Page'>
                    </div>
                    <p><b>Q</b>uickly make adjustments to existing content. Whether it's updating text, swapping out images, or refining layouts, you can ensure your website stays up-to-date with minimal effort.</p>
                </div>
                <div class="d-flex align-items-center p-3 mx-5">
                </div>
                <div class="d-flex-column align-items-center p-3 border border border-light bg-light mx-5">
                    <div><p class="h5">Delete Page</p></div>
                    <div class="d-flex align-items-center justify-content-center mb-2">
                        <img src="../assets/images/delete.jpg" class="userView" alt='Edit Page'>
                    </div>
                    <p><b>R</b>emove outdated or irrelevant content with ease. As an administrator, you have the power to maintain the relevance and integrity of your website by efficiently removing any unnecessary Page.</p>
                </div>
            </div>
            <cfinclude template = "footer.cfm">       
    </cfif>
    </body>
</cfoutput>
</html>