<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.ClassNav" %><%--
  Created by IntelliJ IDEA.
  User: 13055
  Date: 2019/6/20
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>main Page</title>
    <link rel="stylesheet" href="../static/css/nav.css" type="text/css">
</head>

<body bgcolor="aqua">
    <div class="wrap">
        <div class="header">实时公交查询系统</div>
        <%
            ArrayList sz = (ArrayList)session.getAttribute("sz");
        %>
        <div class="nav">
            <ul>
                <%
                    for(int i=0;i<sz.size()-1;i++){
                        ClassNav classNav = (ClassNav)sz.get(i);
                %>
                <li class="list">
                    <a href="<%=classNav.getClassUrl()%>" target="main"><h2><%=classNav.getClassName()%></h2></a>
                </li>
                <%
                    }
                %>
                <li class="list">
                    <%
                        ClassNav classNav = (ClassNav)sz.get(sz.size()-1);
                        if(classNav.getClassUrl().equals("exit")){
                    %>
                        <script>
                            function tijiao(){
                                top.location.href="/Page/index.jsp"
                            }
                        </script>
                        <a href="../admin/<%=classNav.getClassUrl()%>.jsp" target="_top" onclick="tijiao()"><h2><%=classNav.getClassName()%></h2></a>
                    <%
                        }else{
                    %>
                        <a href="../admin/<%=classNav.getClassUrl()%>.jsp" target="main"><h2><%=classNav.getClassName()%></h2></a>
                    <%
                        }
                    %>
                </li>
            </ul>
        </div>
    </div>
</body>
</html>
