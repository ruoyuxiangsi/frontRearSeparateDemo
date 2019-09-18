<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/9/17
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试json，实现读写分离</title>
    <script type="text/javascript" src="lib/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">

        /*//---------------测试js中的字符串和js对象相互转化------------------------

        var str = '{"name":"zhangsna", "age":"18"}';

        var jsonObj = JSON.parse(str);
        // 将字符串转化为js对象
        // json对象，是个对象的类型
        //alert(jsonObj);

        // 将js对象转化为字符串
        var str1 = JSON.stringify(jsonObj)
        //alert(str1);

        //---------------测试前后端分离------------------------
*/
        $(function () {
            $("#getAllEmployee").click(function () {

                $.ajax({
                    url:$(this).attr("href"),
                    type:"GET",
                    // 将后台传来的数据转化为json对象
                    dataType:"json",
                    success:function (data) {
                        var contentStr = "<tr>\n" +
                            "            <th>id</th>\n" +
                            "            <th>lastname</th>\n" +
                            "            <th>gender</th>\n" +
                            "            <th>email</th>\n" +
                            "\n" +
                            "        </tr>"

                        // 至于这个这个data有没有length属性，要后台传来的数据是什么数据
                        for (var i = 0; i < data.length; i++){
                            contentStr += "<tr><td>" + data[i].id + "</td>" +
                                "<td>" + data[i].lastName + "</td>" +
                                "<td>" + data[i].gender + "</td>" +
                                "<td>" + data[i].email + "</td></tr>";
                        }

                        $("#mytable").html(contentStr);
                    }

                });

                // 取消a标签的跳转功能
                return false;
            });
        })
    </script>


</head>
<body>

<a id="getAllEmployee" href="getAllEmployee">获得全部的员工</a>
<table id="mytable"></table>

</body>
</html>
