<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/25
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>添加订单</h2>
<div style="width:400px;">
    <form class="layui-form" id="fom" >
        <div class="layui-form-item">
            <label class="layui-form-label">产品名</label>
            <div class="layui-input-block">
                <input type="text" name="oproduct" required  lay-verify="required" placeholder="请输入产品" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">数量</label>
            <div class="layui-input-block">
                <input type="text" name="oproductNum" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">收款</label>
            <div class="layui-input-block">
                <input type="text" name="ogathering" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">制作天数</label>
            <div class="layui-input-block">
                <input type="text" name="odealSky" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">快递类型</label>
            <div class="layui-input-block">
                <input type="text" name="oexpressage" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">材料费用</label>
            <div class="layui-input-block">
                <input type="text" name="omaterials" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <input type="text" name="remark" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" >收货人</label>
            <div class="layui-input-block" style="width: 100px;">
                <select id="sele" name="client.cno" required  lay-verify="">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button  onclick="submitIndnt()" class="layui-btn layui-btn-primary">提交</button>
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

    function clienti(){
        $.post("${pageContext.request.contextPath}/orderDetailsAction/findClienti",null,function(data){
            $.each(data,function (i,v) {
                var option = " <option value='"+v.cno+"'>"+v.cname+"</option>"
                $("#sele").append(option);
            })
        },"json")
    }

    function submitIndnt(){
        var param=$("#fom").serialize()
        $.post("${pageContext.request.contextPath}/orderDetailsAction/addOrder",param,function(data){
            if(data==1){
                alert("添加成功");
                $("#fom")[0].reset();
            }else{
                alert("添加失败")
            }
        })

    }
    window.onload = clienti();
</script>
</div>
</body>
</html>
