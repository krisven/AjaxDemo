<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<html>
<body>
    <SCRIPT LANGUAGE="JavaScript">
        // ajax 对象
        function ajaxObject() {
            var xmlHttp;
            try {
                xmlHttp = new XMLHttpRequest();
            }
            catch (e) {
                // IE
                try {
                    xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                } catch (e) {
                    try {
                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e) {
                        alert("您的浏览器不支持AJAX！");
                        return false;
                    }
                }
            }
            return xmlHttp;
        }

        // ajax post请求：
        function login(){
            var account = document.loginForm.a.value;
            var password = document.loginForm.p.value;
            var ajax = ajaxObject();
            var url = "/krisven/LoginServlet?a=" + account + "&p=" + password;
            //ajax.setRequestHeader( "Content-Type" , "application/x-www-form-urlencoded" );
            ajax.onreadystatechange = function () {
                if( ajax.readyState == 4 ) {
                    if( ajax.status == 200 ) {
                        document.getElementById('resultDiv').innerHTML = ajax.responseText;
                    }
                    else {
                        document.getElementById('resultDiv').innerHTML += "HTTP请求错误！错误码："+ajax.status ;
                    }
                }
                else {
                    document.getElementById('resultDiv').innerHTML += "正在登录，请稍候......";
                }
            }
            ajax.open( "post" , url , true );
            ajax.send();

        }
    </SCRIPT>
欢迎登录学生管理系统.<hr>
<div id="resultDiv">
    <form name = "loginForm" action="login">
        请您输入账号：<input type="text" name="a"><BR>
        请您输入密码：<input type="password" name="p"><BR>
        <input type="button" value="登录" onclick="login()">
    </form>
</div>
</body>
</html>
