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
    <script src="../static/js/jquery.js"></script>
    <script src="../static/bootstrap/js/bootstrap.min.js"></script>

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
                <h1 >欢迎登陆实时公交查询系统！</h1>
            </div>
            <div style="position: absolute; margin-left:235px;background-color: #8df8ff; opacity: 0.4;width: 600px; height: 300px;" ></div>
            <div class="col-md-6 col-centered no-gutters">
                <form style="text-align: center; height: 400px" method="post" action="/Search/searchCarPath">
                    <div style="float: right; margin-top: 55px;margin-right: 80px">
                        <input class="btn btn-primary btn-lg" type="submit" value="提交">
                    </div>
                    <ul  style="list-style: none; width: 500px">
                        <li class="input-group input-group-lg col-12 col-sm-6 col-md-8" >
                            <div class="input-group-prepend">
                                <span class="input-group-text" >起</span>
                            </div>
                            <input type="text" id="searchWords" name="searchWords"
                                   data-provide="typeahead" value="" autocomplete="off"
                                     placeholder="请输入起始地">
                            <input type="text" style="display: none" id="searchId" value="0" name="searchId">
                        </li>
                        <li  class="input-group input-group-lg col-12 col-sm-6 col-md-8" style="padding-top: 60px">
                            <div class="input-group-prepend">
                                <span class="input-group-text">终</span>
                            </div>
                            <input type="text" id="searchWords1" name="searchWords1"
                                      data-provide="typeahead" autocomplete="off"
                                     placeholder="请输入目的地">
                            <input type="text" style="display: none" id="searchId1" value="0" name="searchId1">
                        </li>
                    </ul>
                    <div class="s_exchange">
                        <a href="javascript:;" onclick="searchReturn();">换</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
<script>
    var searchReturn = function () {
        var temp = document.getElementById("searchWords").value.trim();
        document.getElementById("searchWords").value = document.getElementById("searchWords1").value.trim();
        document.getElementById("searchWords1").value = temp;
        // var color = $("#notice01").css("color");
        // $("#notice01").css("color", $("#notice02").css("color"));
        // $("#notice02").css("color", color);
        //
        // var temp2 = document.getElementById("from").value.trim();
        // document.getElementById("from").value = document.getElementById("to").value.trim();
        // document.getElementById("to").value = temp2;

    }
</script>
<script>
    $("#searchWords").typeahead({
        source: function (query, process) {
            return $.ajax({
                url: '/Search/searchSite',
                type: 'get',
                data: {siteName: query},
                success: function (result) {
                    var resultList = result.map(function (item) {
                        var aItem = {id: item.siteId, name: item.siteName};
                        return JSON.stringify(aItem);
                    });
                // .map(function (item) {
                //         var aItem = {id: siteId, name: siteName};
                //         return JSON.stringify(aItem);
                //     });
                    return process(resultList);
                },
            });
        },
        /**
         * 使用指定的方式，高亮(指出)匹配的部分
         *
         * @param obj 数据源中返回的单个实例
         * @returns {XML|void|string|*} 数据列表中数据的显示方式（如匹配内容高亮等）
         */
        highlighter: function (obj) {
            var item = JSON.parse(obj);
            var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&');
            return item.name.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
                return '<strong>' + match + '</strong>'
            });
        },
        /**
         * 在选中数据后的操作，这里的返回值代表了输入框的值
         *
         * @param obj
         * @return 选中后，最终输入框里的值
         */
        updater: function (obj) {
            var item = JSON.parse(obj);
            document.getElementById("searchId").value = item.id;
            return item.name;
        }
    });
    $("#searchWords1").typeahead({
        source: function (query, process) {
            return $.ajax({
                url: '/Search/searchSite',
                type: 'get',
                data: {siteName: query},
                success: function (result) {
                    var resultList = result.map(function (item) {
                        var aItem = {id: item.siteId, name: item.siteName};
                        return JSON.stringify(aItem);
                    });
                    // .map(function (item) {
                    //         var aItem = {id: siteId, name: siteName};
                    //         return JSON.stringify(aItem);
                    //     });
                    return process(resultList);
                },
            });
        },
        /**
         * 使用指定的方式，高亮(指出)匹配的部分
         *
         * @param obj 数据源中返回的单个实例
         * @returns {XML|void|string|*} 数据列表中数据的显示方式（如匹配内容高亮等）
         */
        highlighter: function (obj) {
            var item = JSON.parse(obj);
            var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&');
            return item.name.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
                return '<strong>' + match + '</strong>'
            });
        },
        /**
         * 在选中数据后的操作，这里的返回值代表了输入框的值
         *
         * @param obj
         * @return 选中后，最终输入框里的值
         */
        updater: function (obj) {
            var item = JSON.parse(obj);
            document.getElementById("searchId1").value = item.id;
            return item.name;
        }
    });
</script>
</body>
</html>
