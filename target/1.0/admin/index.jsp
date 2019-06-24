<%--
  Created by IntelliJ IDEA.
  User: 13055
  Date: 2019/6/20
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Main Page</title>
    <script src="../static/bootstrap/js/bootstrap.min.js"></script>
    <script src="../static/js/jquery.js"></script>
    <script src="../static/js/bootstrap-typeahead.js"></script>
    <link rel="stylesheet"
          href="../static/bootstrap/css/bootstrap.min.css" />
    <style>

        /*web background*/
        .container{
            display:table;
            height:100%;
        }

        .row{
            display: table-cell;
            padding-top: 20%;
        }
        /* centered columns styles */
        .row-centered {
            text-align:center;
        }
        .col-centered {
            display: inline-block;
            float: none;
            text-align: left;
            margin-right: -4px;
        }
        .s_exchange {
            position: absolute;
            left: 150px;
            top:105px;
            z-index: 1;
            width: 20px;
            height: 20px;
            border-left: none;
            text-indent: 0;
            font: 12px/1.5 simsun, sans-serif;
        }
        .s_exchange a {
            position: absolute;
            z-index: 1;
            width: 40px;
            height: 40px;
            left: 3px;
            top: 12px;
            padding-top: 8px;
            font-size: 16px;
            background-color: #c9cacb;
            color: #fff;
            text-align: center;
        }
        .s_exchange a:hover {
            background-color: #06c;
            text-decoration: none;
        }
        ul{
            margin-top: 60px;
        }
        li{
            /*margin-top: 60px;*/
        }
    </style>
</head>

<body >
<div class="container" >
    <div class="row row-centered" style="position: relative">
        <div >
            <h1 >欢迎登陆实时公交后台管理系统！</h1>
        </div>
    </div>
</div>
</body>
</html>
