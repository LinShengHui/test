<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/2
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>

</head>
<body>

<div class="layui-layout layui-bg-blue  layui-layout-admin  ">
<div class="layui-header  " >
    <div class="layui-logo layui-bg-blue">资料修改</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
        <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/pages/homepage.jsp">控制台</a></li>
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

                ${user.uname}
            </a>
            <dl class="layui-nav-child">
                <dd><a href="">基本资料</a></dd>
                <dd><a href="">安全设置</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/userAction/exitUser">退了</a></li>
    </ul>
</div>
</div>

<div style="width: 75%;height: 75%; border: 0px solid red; margin: 0 auto; margin-top: 20px;">
    <div class="layui-tab layui-tab-card">
        <ul class="layui-tab-title">
            <li class="layui-this" onclick="userInfo()">个人信息</li>
            <li>修改密码</li>
            <li>商品管理</li>
            <li>订单管理</li>
        </ul>
        <div class="layui-tab-content" style="height: 350px;">
            <div class="layui-tab-item layui-show" style="width:400px;">
                <form class="layui-form" action="${pageContext.request.contextPath}/userAction/updateUser" method="post"  enctype="multipart/form-data">
                    <input type="hidden"  name="uno" value="${user.uno}"/>
                    <div class="layui-form-item">
                        <label class="layui-form-label">当前头像</label>
                        <div class="layui-input-block">
                            <img src="${user.imgUrl}" width="50px" height="60px">
                            <input type="file" name="ufiles"  onchange="imgPreview(this)"/>
                         </div>
                        <div>
                            <label class="layui-form-label">选择头像</label>
                            <img id="preview" width="80px" height="50px" />
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-block">
                            <input type="text"  name="uname" value="${user.uname}" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">单选框</label>
                        <div class="layui-input-block">
                            <input type="radio" name="usex" value="男" title="男" ${user.usex==1?'checked':''}>
                            <input type="radio" name="usex" value="女" title="女" ${user.usex==0?'checked':''}>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">入职时间</label>
                        <div class="layui-input-block">
                          <input type="text" name="utime" disabled  value="${user.utime}" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <input type="submit" class="layui-btn" lay-submit lay-filter="formDemo"/>
                            <button type="reset"  class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
                <script>
                    //Demo
                    layui.use('form', function(){
                        var form = layui.form;

                    });
                </script>

            </div>
            <div class="layui-tab-item">
                <form class="layui-form" action="${pageContext.request.contextPath}/userAction/amendUserPws" method="post" onsubmit="return check()">
                    <input type="hidden"  name="uno" value="${user.uno}"/>

                    <div class="layui-form-item">
                        <label class="layui-form-label">旧密码</label>
                        <div class="layui-input-block">
                            <input type="text" id="pws"  required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">新密码</label>
                        <div class="layui-input-block">
                            <input type="text" id="onepws"  required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">确认密码</label>
                        <div class="layui-input-block">
                            <input type="text" id="towpws"  name="upwd"  required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <input type="submit" class="layui-btn" lay-submit lay-filter="formDemo"/>
                            <button type="reset"  class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
                <script>
                    //Demo
                    layui.use('form', function(){
                        var form = layui.form;

                    });
                </script>
            </div>
            <div class="layui-tab-item">3</div>
            <div class="layui-tab-item">4</div>
            <div class="layui-tab-item">5</div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    layui.use('element', function(){
        var element = layui.element;

        //获取hash来切换选项卡，假设当前地址的hash为lay-id对应的值
        var layid = location.hash.replace(/^#test1=/, '');
        element.tabChange('test1', layid); //假设当前地址为：http://a.com#test1=222，那么选项卡会自动切换到“发送消息”这一项

        //监听Tab切换，以改变地址hash值
        element.on('tab(test1)', function(){
            location.hash = 'test1='+ this.getAttribute('lay-id');
        });
    });



    //密码验证
    function check(){
        var pws="${user.upwd}"
        if($("#pws").val()!=pws||$("#onepws").val()!=$("#towpws").val()){
            alert("密码和不一致")
            return false
        }
        alert("修改成功");
        return true;
    }

    //图片预览
    function imgPreview(fileDom){
        //判断是否支持FileReader
        if (window.FileReader) {
            var reader = new FileReader();
        } else {
            alert("您的设备不支持图片预览功能，如需该功能请升级您的设备！");
        }

        //获取文件
        var file = fileDom.files[0];
        var imageType = /^image\//;
        //是否是图片
        if (!imageType.test(file.type)) {
            alert("请选择图片！");
            return;
        }
        //读取完成
        reader.onload = function(e) {
            //获取图片dom
            var img = document.getElementById("preview");
            //图片路径设置为读取的图片
            img.src = e.target.result;
        };
        reader.readAsDataURL(file);
    }
</script>