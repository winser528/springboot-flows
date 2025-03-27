<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>jeecms-left</title>
    <#include "./include/common.ftl"/>
</head>
<body>
<div class="swap">
    <table class="list-box">
        <thead>
        <tr>
            <th colspan="2" scope="col">服务器信息</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td width="30%">服务器计算机名</td>
            <td><span id="lbServerName">${os.computerName}</span></td>
        </tr>
        <tr>
            <td>服务器MAC</td>
            <td>${os.mac}</td>
        </tr>
        <tr>
            <td>服务器IP地址</td>
            <td>${os.ip}</td>
        </tr>
        <tr>
            <td>服务器端口</td>
            <td>${port}</td>
        </tr>
        <tr>
            <td>项目所在文件夹</td>
            <td>${os.itemPath}</td>
        </tr>
        <tr>
            <td>服务器操作系统</td>
            <td>${os.osName}</td>
        </tr>
        <tr>
            <td>用户工作目录</td>
            <td>${os.userDir}</td>
        </tr>
        <tr>
            <td>当前系统用户名</td>
            <td>${os.sysUserName}</td>
        </tr>
        <tr>
            <td>服务器当前时间</td>
            <td id="clock">${os.sysTime}</td>
        </tr>
        <tr>
            <td>JAVA版本</td>
            <td>${os.java}</td>
        </tr>
        <tr>
            <td>虚拟机内存总量</td>
            <td>${os.vmRamTotal}</td>
        </tr>
        <tr>
            <td>当前程序占用内存</td>
            <td>${os.useRamTotal}</td>
        </tr>
        </tbody>
    </table>
</div>
</body>
<script>
    Date.prototype.Format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "H+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    };

    setInterval(function () {
        document.getElementById("clock").innerHTML = new Date().Format("yyyy-MM-dd HH:mm:ss");
    }, 1000);
</script>
</html>