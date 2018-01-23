<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/5
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Title</title>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>

</head>
<body class="layui-layout-body  ">
<div class="layui-layout layui-layout-admin   ">
    <div class="layui-header " >
        <div class="layui-logo">Welcome system</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${user.imgUrl}" width="35px" height="40px">
                    ${user.getUname()}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/userPage/update.jsp">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/userAction/exitUser">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="#"><i class="layui-icon">&#xe68e;</i>   客户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javaScript:chientInfo();">客户信息</a></dd>
                        <dd><a href="javaScript:addChient();">添加客户</a></dd>
                        <dd><a href="javaScript:clientIndent();">客户追终</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">订单管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:IndentInfo();">订单列表</a></dd>
                        <dd><a href="javascript:addIndent();">添加订单</a></dd>
                        <dd><a href="javascript:indentMoney();">订单获利</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">云市场</a></li>
                <li class="layui-nav-item"><a href="#">发布商品</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;" id="rightContent">111内容主体区域</div>
    </div>

    <div class="layui-footer" >
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });


    function chientInfo(){
        $("#rightContent").html("").load("${pageContext.request.contextPath}/pages/chientInfo.jsp")
    }
    function addChient(){
        $("#rightContent").html("").load("${pageContext.request.contextPath}/pages/addClient.jsp")
    }
    function addIndent(){
        $("#rightContent").html("").load("${pageContext.request.contextPath}/pages/addIndent.jsp")
    }

    function IndentInfo(){
        $("#rightContent").html("").load("${pageContext.request.contextPath}/pages/indentInfo.jsp")
    }

    function indentMoney(){
        $("#rightContent").html("").load("${pageContext.request.contextPath}/pages/indentMoney.jsp")
    }

    function clientIndent(){
        $("#rightContent").html("").load("${pageContext.request.contextPath}/pages/clientIndent.jsp")
    }
    window.onload=chientInfo();


</script>
</body>
</html>