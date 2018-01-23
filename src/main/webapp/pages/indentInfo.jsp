<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/29
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page  isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>订单信息</h2>
<div class="admin-main">

    <fieldset class="layui-elem-field">
        <legend>订单列表</legend>

        <table  id="tab" class="layui-table">
            <tr>
                <td>产品</td>
                <td>产品数量</td>
                <td>创建时间</td>
                <td>交易金额</td>
                <td>天数</td>
                <td>快递类型</td>
                <td>材料费用</td>
                <td>客户</td>
                <td>状态</td>
                <td>管理</td>
            </tr>
        </table>
        <div id="demo1"></div>
    </fieldset>
</div>
</body>
</html>
<script>


    $(document).ready(function(){
        //ajax请求后台数据
        loadData();
        toPage();
    });

    //分页参数设置 这些全局变量关系到分页的功能
    var startAllAppoint = 0;
    var limitAllAppoint = 5;
    var currentPageAllAppoint = 1;
    var totalPageAllAppoint = 0;
    var dataLength = 0;

    //初始化数据
    function loadData(){
        $.ajax({
            async:false,
            type:"post",
            url:"${pageContext.request.contextPath}/orderDetailsAction/findOrderDetailsList",
            data:{page:currentPageAllAppoint},
            dataType:"json",
            success:function(data){
                getShopCustomesInfo(data.data);
                startAllAppoint = data.page;//当前页数(后台返回)
                totalPageAllAppoint = data.count;//总页数(后台返回)

            }
        })
    }
    //渲染数据
    function  getShopCustomesInfo(data) {
        console.log(data)
        $("#tab tr:not(:lt(1))").remove();
        $.each(data,function(i,v){
            var tr="<tr>";
            tr+="<td>"+v.oproduct+"</td>"
            tr+="<td>"+v.oproductNum+"</td>"
            var time = new Date(v.otime);
            var ctime=time.getFullYear()+"年"+(time.getMonth()+1)+"月"+time.getDate()+"日";
            tr+="<td>"+ctime+"</td>"
            tr+="<td>"+v.ogathering+"</td>"
            tr+="<td>"+v.odealSky+"</td>"
            tr+="<td>"+v.oexpressage+"</td>"
            tr+="<td>"+v.omaterials+"</td>"
            tr+="<td>"+v.client.cname+"</td>"
            tr+="<td style='color:"+(v.ostate==1?'green':'red')+"';>"+(v.ostate==1?'完成':'未完成')+"</td>"

            tr+="<td>" +
                "<a href='javascript:accomplish("+v.oid+")' class='layui-btn layui-btn-xs'>点击完成</a>" +
                "</td>"
            tr+="</tr>"
            $("#tab").append(tr);
        })

    }

    //开启layui分页
   function toPage(){
       layui.use(['laypage', 'layer'], function() {
           var laypage = layui.laypage
               , layer = layui.layer;
           //总页数大于页码总数
           laypage.render({
               elem: 'demo1'
               ,limit:5
               ,skip: true
               , count: totalPageAllAppoint //数据总数
               , jump: function (obj,first) {
                   currentPageAllAppoint = obj.curr;
                   startAllAppoint = (obj.curr-1)*limitAllAppoint;
                   //document.getElementById('biuuu_city_list').innerHTML = render(obj, obj.curr);
                   //一定要加此判断，否则初始时会无限刷新
                   if(!first){
                       loadData();
                   }
                       //一定要把翻页的ajax请求放到这里，不然会请求两次。
                       //location.href = '?page='+obj.curr;
               }
           });
       })
    }

    //完成订单
    function accomplish(i){
       $.post("${pageContext.request.contextPath}/orderDetailsAction/updateOrderDetails?oid="+i,null,function(data){
           loadData();
       })
    }







        /* $.post("/orderDetailsAction/findOrderDetailsList?page="+num,null,function (data) {
             console.log(data)
             $.each(data.data,function(i,v){
                 var tr="<tr>";
                 tr+="<td>"+v.oexpressage+"</td>"
                 tr+="<td>"+v.oproductNum+"</td>"

                 var time = new Date(v.otime);
                 var ctime=time.getFullYear()+"年"+(time.getMonth()+1)+"月"+time.getDate()+"日";
                 tr+="<td>"+ctime+"</td>"

                 tr+="<td>"+v.ogathering+"</td>"
                 tr+="<td>"+v.odealSky+"</td>"
                 tr+="<td>"+v.oexpressage+"</td>"
                 tr+="<td>"+v.omaterials+"</td>"
                 tr+="<td>"+v.client.cname+"</td>"
                 tr+="</tr>"
                $("#tab").append(tr);
             })
             allnum= data.count;
         })
 */



</script>