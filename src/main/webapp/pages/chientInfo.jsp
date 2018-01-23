<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/3
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script>

   layui.use('table', function(){
       var table = layui.table;
       //数据表格
       table.render({
           elem: '#demo'
           ,height: 500
           ,url: '${pageContext.request.contextPath}/chientAction/findClient' //数据接口
           ,page: true //开启分页
           ,method : 'post'
           ,limit:10
           ,limits:[10,15]
           ,cols: [[ //表头
               {field: 'cno', title: 'ID', width:80, sort: true, fixed: 'left'}
               ,{field: 'cname', title: '姓名', width:80}
               ,{field: 'csex', title: '性别', width:80, sort: true}
               ,{field: 'ccompany', title: '公司', width:80}
               ,{field: 'cphone', title: '联系电话', width: 200}
               ,{field:'lock', title:'是否锁定', width:110, templet: '#checkboxTpl', unresize: true}
               ,{field: 'ccredit', title: '信誉评分', width: 80, sort: true}
               ,{field:'right', title: '操作', width:177,toolbar:"#barDemo"}
           ]]
       });


       //管理事件
       table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
           console.log(obj);
           var data = obj.data; //获得当前行数据
           var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
           var time = new Date(data.ctime);
           var ctime=time.getFullYear()+"年"+(time.getMonth()+1)+"月"+time.getDate()+"日";
            var start=(data.cstart==1?"合作中":"搁置");
           var tr = obj.tr; //获得当前行 tr 的DOM对象
           var info = '<div style="float: left">姓名：'+data.cname+'<br/>' +
               '性别：'+data.csex+'<br/>' +
               '联系号码: '+data.cphone+'<br/>' +
               '合作时间: '+ctime+'<br/>' +
               '合作状态: '+start+'<br/>' +
               '地址: '+data.ccompany +'<br/>' +
               '信誉评分: '+data.ccredit+'</div>' +
               ''
            console.log(data)
           if(layEvent === 'detail'){ //查看
               layer.open({

                   type: 1,
                   title: ['导入信息'],
                   area: ['500px', '400px'],
                   content: info ,
                   end: function(){
                       // 如果是通过单击关闭按钮关闭弹出层，父画面没有此表单
                       if($("#popupForm").length === 1){
                           $("#popupForm").submit();
                       }
                   }
               });

           } else if(layEvent === 'del'){ //删除
               layer.confirm('真的删除行么', function(index){
                   obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                   layer.close(index);
                   //向服务端发送删除指令
                   deleteClient(data.cno);

               });
           } else if(layEvent === 'edit'){
               //修改
               //do something
               console.log(data)
               var url="${pageContext.request.contextPath}/chientAction/updataClient";
                var form='<form action="'+url+'" method="post">' +
                    '<input type="hidden" name="cno" value="'+data.cno+'">' +
                    ' 姓名：<input type="text" name="cname" value="'+data.cname+'"/><br/>' +
                    '性别：<input type="radio" name="csex" value="男" checked />男' +
                    '<input type="radio" name="csex" value="女"  />女<br/>' +
                    '公司：<input type="text" name="ccompany" value="'+data.ccompany+'"><br/>' +
                    '联系电话：<input type="text" name="cphone" value="'+data.cphone+'"><br/>' +
                    '合作状态:<select name="cstart">' +
                    '<option value="'+(data.cstart==1?1:0)+'">'+(data.cstart==1?"合作中":"搁置")+'</option>' +
                    '<option value="'+(data.cstart==1?0:1)+'">'+(data.cstart==1?"搁置":"合作中")+'</option>' +
                    '</select>' +
                    '<br/>信誉评分：<input type="text" name="ccredit" value="'+data.ccredit+'"><br/>' +

                    '<input type="submit" value="修改">' +
                    '</form>'
               layer.open({
                   type: 1,
                   title: ['导入信息'],
                   area: ['500px', '400px'],
                   content: form ,
                   end: function(){
                       // 如果是通过单击关闭按钮关闭弹出层，父画面没有此表单
                       if($("#popupForm").length === 1){
                           $("#popupForm").submit();
                       }
                   }
               });
               //同步更新缓存对应的值
               obj.update({
                   username: '123'
                   ,title: 'xxx'
               });
           }
       });

   });



</script>
<script>
    function deleteClient(cno){
        $.post("${pageContext.request.contextPath}/chientAction/deleteClient?cno="+cno,null,function(data){
        });
    }
</script>

<body>

<script type="text/html" id="checkboxTpl">
    <!-- 这里的 checked 的状态只是演示 -->

    <input type="checkbox" name="lock" value="{{d.cstart}}" lay-skin="primary" title="合作" {{ d.cstart == 1 ? 'checked' : '' }} disabled="">
</script>
        <table  id="demo" lay-data="{url:'${pageContext.request.contextPath}/chientAction/findClient'}" lay-filter="test"></table>
        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </script>
        <div id="popupFormDiv" style="display:none;"></div>

        <div id="clientiInfo">
         </div>
</body>
</html>