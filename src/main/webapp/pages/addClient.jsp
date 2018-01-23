<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/3
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>

<style>
</style>
<body>
<h2>添加客户：</h2>

<div>
    <form class="layui-form" action="${pageContext.request.contextPath}/chientAction/addClient" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" name="cname" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">单选框</label>
            <div class="layui-input-block">
                <input type="radio" name="csex" value="男" title="男" checked>
                <input type="radio" name="csex" value="女" title="女" >
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-block">
                <input type="text" name="cphone" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">所在公司</label>
            <div class="layui-input-block">
                <input type="text" name="ccompany" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" >合作状态</label>
            <div class="layui-input-block" style="width: 100px;">
                <select name="cstart" required  lay-verify="">
                    <option value="">请选择</option>
                    <option value="1">合作中</option>
                    <option value="0">搁置</option>
                  </select>
            </div>
        </div>
            <div class="layui-form-item">
                <label class="layui-form-label">信誉值</label>
                <div class="layui-input-inline">
                    <input type="text" value="6.0" name="ccredit" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>


        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="submit" class="layui-btn" value="提交" >
                <button type="reset" id="butt" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
    <script>
        //Demo
        layui.use('form', function(){
            var form = layui.form;

            //监听提交
            form.on('submit(formDemo)', function(data){
                layer.msg(JSON.stringify(data.field));
                return false;
            });
        });
        $(function() {
            $("#butt").trigger("click");//触发button的click事件
        })
    </script>
</div>

</body>
</html>
<script>

</script>
