<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.CarBean" %><%--
  Created by IntelliJ IDEA.
  User: 13055
  Date: 2019/6/21
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>车次列表</title>
    <script src="../static/js/jquery.js"></script>
    <script src="../static/bootstrap/js/bootstrap.min.js"></script>

    <script src="../static/js/bootstrap-typeahead.js"></script>
    <link rel="stylesheet"
          href="../static/bootstrap/css/bootstrap.min.css" />
</head>
<body>
    <div align="center" style="margin-top: 100px" class="container">
        <%
            if (session.getAttribute("currentsite")!=null){
        %>
            <div >
                <h4 style="text-align: left">当前位置：<%=session.getAttribute("currentsite")%></h4>
                <h1 style="text-align: center">途径站点车辆如下</h1>
            </div>
        <%
            }
        %>
        <%
            ArrayList al = (ArrayList)session.getAttribute("carSz");
        %>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>车次</th>
                    <th>起始站</th>
                    <th>终点站</th>
                </tr>
            </thead>
            <tbody>

            <%

                for(int i=0;i<al.size();i++){
                    CarBean st = (CarBean)al.get(i);
            %>
                <tr>
                    <th><%=st.getCarId()%></th>
                    <td><%=st.getLicensePlate()%></td>
                    <td><%=st.getStartSite()%></td>
                    <td><%=st.getEndSite()%></td>
                </tr>
            <%
                }
            %>
            </tbody>

        </table>
    </div>

</body>
</html>
