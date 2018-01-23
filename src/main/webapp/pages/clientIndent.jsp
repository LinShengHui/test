<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/19
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Chart.js"></script>
<body>
<h2>统计</h2>
<div style="float:left">
    <table id="tab" border="1" class="layui-table">
        <tr>
            <td>客户</td>
            <td>成交总额</td>
            <td>合作次数</td>
            <td>查看合作订单</td>
        </tr>
    </table>
</div>
<div style="width: 400px;height: 400px; float:right">
    <canvas id="myChart" width="400" height="400"></canvas>
</div>
</body>
</html>

<script>

    $(function () {
        statistics();
        data();
    })


    function data(){
        $.ajax({
            async:false,
            type:"post",
            url:"${pageContext.request.contextPath}/chientAction/clientiAndIndent",
            dataType:"json",
            success:function(data){
                var num=new Array()
                var name=new Array()
                console.log(data)
                $.each(data,function(i,v){
                    name[i]=v[0];
                    num[i]=v[1];
                    var tr = "<tr>" +
                        "<td>"+v[0]+"</td>" +
                        "<td>"+v[1]+"</td>" +
                        "<td>"+v[2]+"</td>" +
                        "<td><a href='#'>查看</a></td>" +
                        " </tr>";
                    $("#tab").append(tr);
                })
                console.log(num+':'+name)
                statistics(num,name)
            }
        })
    }

    function statistics(arrayNum,arrayData){
        var num = arrayNum
        var data = {
            labels:arrayData,
            datasets:[{
                label:'交易资金',
                data:num,
                backgroundColor:[
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(12, 76, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(12, 76, 64, 0.2)'
                ],
                borderWidth:1
            }]
        }

        var ctx = document.getElementById("myChart");
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: data
        });

    }



</script>