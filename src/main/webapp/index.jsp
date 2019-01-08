<%-- 
    Document   : index.html
    Created on : Jan 4, 2019, 3:00:16 PM
    Author     : lap11105-local
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >

    <head>
        <meta charset="UTF-8">
        <title>App Login Concept</title>
        <link rel="stylesheet" href="css/login.css">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    </head>
    <body>
        <div class="login-page">
            <div class="form">
                <p style="color: red;">${errorString}</p>
                <form class="register-form" method="post" action="RegisterServlet">
                    <input type="text" placeholder="name" name="username"/>
                    <input type="password" placeholder="password" name="password"/>
                    <input type="password" placeholder="confirm password" name="repassword"/>
                    <input type="text" placeholder="email address" name="email"/>
                    <button>create</button>
                    <p class="message">Already registered? <a href="#">Sign In</a></p>
                </form>
                <form class="login-form" method="post" action="LoginServlet" >
                    <input type="text" placeholder="username" name="username" value="namvh3"/>
                    <input type="password" placeholder="password" name="password" value="namvh3"/>
                    <input type="submit" style="background-color:#43A047;" value="login"/>  
                    <p class="message">Not registered? <a href="#">Create an account</a></p>
                </form>
            </div>
        </div>
        <script src="js/login.js"></script>
        <script>
            $.ajaxSetup({
                headers: {
                    'Authorization': "Basic XXXXX"
                }
            });
        </script>
    </body>
</html>