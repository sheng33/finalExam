<%--
  Created by IntelliJ IDEA.
  User: 13055
  Date: 2019/6/20
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>实时公交查询</title>
    <link rel="stylesheet" href="../static/css/nav.css" type="text/css">
</head>
<body>
        <iframe id="frameContentLeft"  src="/leftNav" scrolling="no"  frameborder="no" ></iframe>
        <%
            if(request.getSession().getAttribute("QZ")==null||request.getSession().getAttribute("QZ").equals("0")){

        %>
            <iframe id="frameContentRight" src="/Page/main.jsp"  name="main" scrolling="no" frameborder="no"></iframe>
        <%
            }else{
        %>
            <iframe id="frameContentRight" src="/admin/index.jsp"  name="main" scrolling="no" frameborder="no"></iframe>
        <%
            }
        %>

</body>
</html>
