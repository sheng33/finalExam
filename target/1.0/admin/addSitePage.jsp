<%--
  Created by IntelliJ IDEA.
  User: 13055
  Date: 2019/6/23
  Time: 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增站点</title>
    <script src="../static/js/jquery.js"></script>
    <script src="../static/bootstrap/js/bootstrap.min.js"></script>
    <script src="../static/js/bootstrap-typeahead.js"></script>
    <link rel="stylesheet"
          href="../static/bootstrap/css/bootstrap.min.css" />
</head>
<body >
<div class="container " >
    <div class="d-flex  align-items-center w-100" style="margin:200px 0 0 250px">
        <div class="input-group" style="width: 300px" id="centerIpGroup">
            <label class="input-group-addon text-center h1" >新增站点：</label>
            <div class="input-group centerIp">
                <label class="input-group-addon">站点：</label>
                <input class="form-control addSiteName" type="text" name="addSiteName1" id="addSiteName1" >
                <span class="input-group-btn">
                    <button class="btn btn-info" type="button" data-toggle="tooltip" title="删除" id="delCenterIpGrp">删除<span class="glyphicon glyphicon-minus"></span></button>
                </span>
            </div>
            <button class="btn btn-info" type="button" data-toggle="tooltip" title="新增" id="addCenterIpGrpBtn" onclick="addCenterIpGrp(this)" >新增<span class="glyphicon glyphicon-plus"></span></button>
            <button class="btn btn-info" type="submit" title="提交" onclick="tijiao()" data-toggle="modal" data-target="#tishi" onsubmit="return false;">提交</button>
        </div>
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
                    站点新增成功！
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="window.location.href='/admin/index.jsp'">关闭</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var rowCount = 1;//(站点)行数默认1行

    //添加站点输入框项
    function addCenterIpGrp(obj){
        rowCount++
        html = '<div class="input-group centerIp">'+
            '<label class="input-group-addon">站点：</label>'+
            '<input class="form-control addSiteName" type="text" name="addSiteName'+rowCount+'" id="addSiteName'+rowCount+'" >'+
            ' <span class="input-group-btn">'+
            '<button class="btn btn-info" type="button" data-toggle="tooltip" title="删除" id="delCenterIpGrp"><span class="glyphicon glyphicon-minus">删除</span></button>'+
            ' </span>'+
            '</div>'
        obj.insertAdjacentHTML('beforebegin',html);

    };
    $(document).on('click','#delCenterIpGrp',function(){
        var el = this.parentNode.parentNode ;
        var centerIp = $(this).parent().parent().find('#ipInput').val() ;
        el.parentNode.removeChild(el)
    });
    function tijiao() {
        var rewardArray = new Array()
        for (var i=1; i <= rowCount; i++){
            var addSiteName = $('div .input-group #addSiteName'+i).val();
            if(( addSiteName != "" || undefined != addSiteName) ){
                var obj = new Object();
                obj['siteName'] = addSiteName;
                rewardArray.push(obj);
            }
        }

        var siteJsonData = JSON.stringify(rewardArray);
        qdtj(siteJsonData)
    }
    function qdtj(sz) {
        $.ajax({
            type:"post",
            url:"/admin/addSiteName",
            data : sz,
            async:false,
            contentType:"application/json; charset=UTF-8",
            success:function(data){
                if(data.code == 200){
                    layer.msg('新增成功！', {
                    }, function(){
                        //跳转的URL重定向到新的页面
                    });
                }
                else{
                    layer.alert("res"+result);
                    layer.msg(data.message);
                }
            }
        });
    }

</script>
</body>
</html>
