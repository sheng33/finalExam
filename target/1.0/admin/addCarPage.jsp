<%--
  Created by IntelliJ IDEA.
  User: 13055
  Date: 2019/6/23
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增车辆信息</title>
    <script src="../static/js/jquery.js"></script>

    <script src="../static/bootstrap/js/bootstrap.min.js"></script>
    <script src="../static/js/bootstrap-typeahead.js"></script>
    <script src="../static/js/tagsinput.min.js"></script>
    <script src="../static/js/prism.js"></script>
    <link rel="stylesheet"
          href="../static/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet"
          href="../static/css/tagsinput.css" />
    <style>
        .box {
            width: 500px;
            margin: auto;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        }
        .tagsinput-primary {
            margin-bottom: 18px;
        }
        .tagsinput-primary .bootstrap-tagsinput {
            border-color: #1abc9c;
            margin-bottom: 0;
        }
        .btn {
            background: #1abc9c;
            border: 0;
            color: #fff;
            padding: 10px;
            border-radius: 5px;
            margin-top: 10px;
        }
        .bootstrap-tagsinput{
            width: 100%;
        }
        .bootstrap-tagsinput .label-info {
            border-radius: 4px;
            background-color: #1abc9c;
            color: #fff;
            font-size: 13px;
            cursor: pointer;
            display: inline-block;
            position: relative;
            vertical-align: middle;
            overflow: hidden;
            margin: 0 5px 5px 0;
            padding: 6px 10px 6px 14px;
            transition: .25s linear;
        }
    </style>

</head>
<body>
    <form class="container" action="/admin/addCar" style="width: 50%;margin-left: 400px">
        <div align="center" style="text-align: center">
            <h1>新增车辆信息</h1>
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text" >车次：</span>
            </div>
            <input type="text" name="carId" id="carId" class="form-control" placeholder="车次" aria-label="Username" aria-describedby="basic-addon1">
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text" >车牌号：</span>
            </div>
            <input type="text"id="licensePlate" name="licensePlate" class="form-control" placeholder="车牌号" aria-label="Username" aria-describedby="basic-addon1">
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text" id="startSite">起始站：</span>
            </div>
            <input type="text" class="form-control" placeholder="起始站" aria-label="Username"
                   id="searchWords1" name="searchWords1" data-provide="typeahead" autocomplete="off" aria-describedby="basic-addon1">
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text" id="endSite">终点站：</span>
            </div>

            <input type="text" class="form-control" placeholder="终点站" aria-label="Username"
                   id="searchWords2" name="searchWords2" data-provide="typeahead"  autocomplete="off" aria-describedby="basic-addon1">
        </div>

        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text" id="namecarPath">途径站点：</span>
            </div>
            <input type="text" name="tagsinput" id="tagsinputval" class="tagsinput form-control" style="display: none" data-role="tagsinput"   />
        </div>
        <input type="submit" value="提交" onclick="getinput()">
    </form>
    <div style="margin-left: 400px">
        <input type="text"  aria-label="Username"
               id="searchWords" name="searchWords" data-provide="typeahead"  autocomplete="off" aria-describedby="basic-addon1">
<%--        <button class="btn" onclick="getinput()">获取输入的值</button>--%>
        <button class="btn" onclick="setinput()">赋值</button>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="tishi" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered"style="margin: auto 20rem;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">提示信息</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    车次新增成功！
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="window.location.href='/admin/index.jsp'">关闭</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        var count=0;
        $(document).ready(function(){
            $("#searchWords").keydown(function(event){
                var str11 = $('#searchWords').val();
                if(event.which == 13)       //13等于回车键(Enter)键值,ctrlKey 等于 Ctrl
                {
                    count++;
                    setinput();
                }
            });
        });
        //获取值
        function getinput(){
            var str  = $('#tagsinputval').val();
            $('#carPath').val(str);
        }

        //赋值
        function setinput(){
            if(count == 2){
                var str = $('#searchWords').val()
                $("#tagsinputval").tagsinput('add',str);
                $('#searchWords').val("").focus();
                count =0;
            }

        }

        var citynames = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            prefetch: {
                url: '/Search/searchSite',
                filter: function(list) {
                    return $.map(list, function(searchWords) {
                        return { siteName: searchWords }; });
                }
            }
        });
        citynames.initialize();

        $('#tagsinputval').tagsinput({
            typeaheadjs: {
                name: 'citynames',
                displayKey: 'name',
                valueKey: 'name',
                source: citynames.ttAdapter()
            }
        });

    </script>
</body>
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
            return item.name;
        }
    });
    $("#searchWords2").typeahead({
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
            return item.name;
        }
    });


</script>
</html>
