<%@ page import="java.util.ArrayList" %>
<%@ page isELIgnored="false" %>
<%@ page import="dao.siteBean" %>
<%@ page import="dao.PageBean" %><%--
  Created by IntelliJ IDEA.
  User: 13055
  Date: 2019/6/21
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>站点列表</title>
    <script src="../static/js/jquery.js"></script>
    <script src="../static/bootstrap/js/bootstrap.min.js"></script>
    <script src="../static/js/bootstrap-typeahead.js"></script>
    <link rel="stylesheet"
          href="../static/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.15.0/dist/bootstrap-table.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://unpkg.com/bootstrap-table@1.15.0/dist/bootstrap-table.min.js"></script>
    <!-- Latest compiled and minified Locales -->
    <script src="https://unpkg.com/bootstrap-table@1.15.0/dist/locale/bootstrap-table-zh-CN.min.js"></script>
    <style>
        ul{list-style: none;}
    </style>
    <script type="text/javascript">

        function topage(currentpage) {
            var form = document.forms[0];
            form.currentpage.value = currentpage;
            form.submit();
        }
    </script>
</head>
<%--<body>--%>
<%--<div align="center" style=" margin-left: 0px; width: 500px" class="container">--%>
<%--    <%--%>
<%--        ArrayList al = (ArrayList)session.getAttribute("sitelist");--%>
<%--    %>--%>
<%--    <table class="table table-striped table-hover">--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>ID</th>--%>
<%--            <th>站点名称</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>

<%--        <%--%>

<%--            for(int i=0;i<al.size();i++){--%>
<%--                siteBean st = (siteBean)al.get(i);--%>
<%--        %>--%>
<%--        <tr>--%>
<%--            <th><%=st.getSiteId()%></th>--%>
<%--            <td><%=st.getSiteName()%></td>--%>
<%--        </tr>--%>
<%--        <%--%>
<%--            }--%>
<%--        %>--%>
<%--        </tbody>--%>

<%--    </table>--%>
<%--</div>--%>

<%--</body>--%>
<body>
<form style="width: 70%;
    margin-left: 100px;">
    <input type="hidden" name="currentpage" />

    <table align="center" class="table table-bordered table-hover">
        <thead>
        <tr>
            <th>站点编号</th>
            <th>站点名称</th>
        </tr>
        <%
            ArrayList al = (ArrayList)request.getAttribute("list");
        %>
        </thead>
        <tbody>
        <%

            for(int i=0;i<al.size();i++){
                siteBean st = (siteBean)al.get(i);
        %>
        <tr>
            <th><%=st.getSiteId()%></th>
            <td><%=st.getSiteName()%></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <div align="right" style="width: 100%">
        <%
            PageBean pageBean = (PageBean)request.getAttribute("pageView");
            int start = pageBean.getStartindex();
            int end = pageBean.getEndindex();
            int currentpage =  pageBean.getCurrentpage();
        %>
        <% for (int i=start;i<end;i++){
                    if (i == currentpage){
        %>
            <b><%=i%></b>
         <%
                    }else if(i != currentpage){
         %>
            <a href="javascript:topage('<%=i%>')">[<%=i%>]</a>
        <%
                    }}
        %>
        总共${pageView.totalrecordnumber}项
    </div>
</form>

</body>
</html>
