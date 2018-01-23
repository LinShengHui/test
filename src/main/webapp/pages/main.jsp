<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/10
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<style>
    #topHead{
        width: 100%;
        height: 100px;
        border:1px solid red;

    }
    #leftTitle{
        width: 20%;
        height: 80%;
        float: left;
        box-shadow: 2px 10px 5px #888888;
    }



    #rightContent{
        width:75%;
        height: 80%;
        margin-left: 10px;
        float: left;
    }
</style>
<body>
<div style="width:100%; height: 100%">
    <div id="topHead" style="">
        <h2>${loginName}欢迎使用本系统</h2></div>
    <div id="leftTitle" style="">
        <div class="panel-group" id="accordion">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#collapseOne">
                            首页
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in">
                    <div class="panel-body" style="margin: 0px;padding: 0px;">
                        <ul class="list-group" style="margin-bottom:0px;cursor:pointer;">
                            <li class="list-group-item" ><a href="javaScript:chientInfo();">客户信息</a></li>
                            <li class="list-group-item"><a href="javaScript:addChient();">添加客户</a></li>
                            <li class="list-group-item"><a href="#">客户追终</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="panel panel-success">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#collapseTwo">
                           客户信息管理
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse">
                    <div class="panel-body" style="margin: 0px;padding: 0px;">
                        <ul class="list-group" style="margin-bottom:0px;cursor:pointer;">
                            <li class="list-group-item" ><a href="#">客户信息</a></li>
                            <li class="list-group-item"><a href="#">客户信息</a></li>
                            <li class="list-group-item"><a href="#">客户信息</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel panel-warning">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#collapseThree">
                            订单信息管理
                        </a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse">
                    <div class="panel-body" style="margin: 0px;padding: 0px;">
                        <ul class="list-group" style="margin-bottom:0px;cursor:pointer;">
                            <li class="list-group-item" ><a href="#">客户信息</a></li>
                            <li class="list-group-item"><a href="#">客户信息</a></li>
                            <li class="list-group-item"><a href="#">客户信息</a></li>
                            <li class="list-group-item"><a href="#">客户信息</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel panel-warning">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#collapseFour">
                            业务统计
                        </a>
                    </h4>
                </div>
                <div id="collapseFour" class="panel-collapse collapse">
                    <div class="panel-body" style="margin: 0px;padding: 0px;">
                        <ul class="list-group" style="margin-bottom:0px;cursor:pointer;">
                            <li class="list-group-item" ><a href="#">客户信息</a></li>
                            <li class="list-group-item"><a href="#">客户信息</a></li>
                            <li class="list-group-item"><a href="#">客户信息</a></li>
                            <li class="list-group-item"><a href="#">客户信息</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="rightContent" style="">

    </div>

</div>
</body>
</html>
<script>
    $(function () { $('#collapseTwo').collapse('hide')});
    window.onload=chientInfo();
    function chientInfo(){
        $("#rightContent").html("").load("${pageContext.request.contextPath}/pages/chientInfo.jsp")
    }
    function addChient(){
        $("#rightContent").html("").load("${pageContext.request.contextPath}/pages/addClient.jsp")
    }
</script>
