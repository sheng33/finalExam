<%@ page contentType="text/html; charset=utf-8"%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="../static/css/styles.css">

</head>

<script src="../static/js/jquery.js" type="text/javascript"></script>
<script>
    $('#login-button').click(function (event) {
        event.preventDefault();
        $('form').fadeOut(500);
        $('.wrapper').addClass('form-success');
    });
    function tijiao(){
        document.getElementById("loginuser").submit();//js原生方式表单提交
    }

</script>
<body>

<%--<div class="htmleaf-container">--%>
<div class="wrapper">
    <div class="container">
        <h1>实时公交管理系统</h1>

        <form class="form"  action="/login" method="post" id="loginuser">
            <input type="text" placeholder="userId" name="userId">
            <input type="password" placeholder="userpassword" name="userpassword">
        </form>
        <button type="submit" id="login-button" onclick="tijiao()">登陆</button>
    </div>

    <ul class="bg-bubbles">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>
<%--</div>--%>


</body>
</html>