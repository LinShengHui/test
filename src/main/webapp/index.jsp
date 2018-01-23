<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/9
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<style>


    .loginDiv_2{

        margin:0 auto;
        margin-top: 10%;
        width: 300px;
    }

</style>
<body>
<div class="loginDiv_2">
    <p id="message" style="color: red">　${sessionScope.message} &nbsp;</p>
    <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/userAction/userLogin" method="post">
        <div class="form-group" style="width: 450px">
            <label for="firstname" class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-7">
                <form:errors path="user.uid" cssStyle="color: red"/><br/>
                <input name="uid" type="text" class="form-control" id="firstname"
                       placeholder="请输入用户">
            </div>
        </div>
        <div class="form-group" style="width: 450px">
            <label for="lastname" class="col-sm-2 control-label">密码</label>
            <div class="col-sm-7">
                <input name="upwd" type="password" type="text" class="form-control" id="lastname"
                       placeholder="请输入密码">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                    <label>
                        <input type="checkbox"> 请记住我
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">登录</button>
                <a href="#">注册</a>
            </div>
        </div>
    </form>
</div>

</body>
</html>
<script type="text/javascript">
    function removerMessage(){
        $("#message").html("");
        return;
    }
    setTimeout(removerMessage,5000)
</script>
