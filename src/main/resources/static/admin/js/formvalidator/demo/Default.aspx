﻿<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>jQuery formValidator表单验证插件 -- by:猫冬，email:wzmaodong@126.com</title>
<meta name="Author" content="猫冬" />
<meta name="description" content="jQuery formValidator表单验证插件" />
<meta name="keywords" content="jQuery,formValidator,插件,表单,验证,插件,javascript,表单验证,提示层" />
<script type="text/javascript" src="jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="formValidator-4.1.3.js" charset="UTF-8"></script>
<script type="text/javascript" src="formValidatorRegex.js" charset="UTF-8"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({formID:"form1",theme:"ArrowSolidBox",submitOnce:true,
		onError:function(msg,obj,errorlist){
			$("#errorlist").empty();
			$.map(errorlist,function(msg){
				$("#errorlist").append("<li>" + msg + "</li>")
			});
			alert(msg);
		},
		ajaxPrompt : '有数据正在异步验证，请稍等...'
	});

	$("#us").formValidator({onShowText:"请输入用户名",onShow:"请输入用户名,只有输入\"maodong\"才是对的",onFocus:"用户名至少5个字符,最多10个字符",onCorrect:"该用户名可以注册"}).inputValidator({min:5,max:10,onError:"你输入的用户名非法,请确认"})//.regexValidator({regExp:"username",dataType:"enum",onError:"用户名格式不正确"})
	    .ajaxValidator({
		dataType : "html",
		async : true,
		url : "http://www.yhuan.com/Handler.ashx",
		success : function(data){
            if( data == "0" ) return true;
			return "该用户名不可用，请更换用户名";
		},
		buttons: $("#button"),
		error: function(jqXHR, textStatus, errorThrown){alert("服务器没有返回数据，可能服务器忙，请重试"+errorThrown);},
		onError : "该用户名不可用，请更换用户名",
		onWait : "正在对用户名进行合法性校验，请稍候..."
	}).defaultPassed();
	$("#password1").formValidator({onShow:"请输入密码",onFocus:"至少1个长度",onCorrect:"密码合法"}).inputValidator({min:1,empty:{leftEmpty:false,rightEmpty:false,emptyError:"密码两边不能有空符号"},onError:"密码不能为空,请确认"});
	$("#password2").formValidator({onShow:"输再次输入密码",onFocus:"至少1个长度",onCorrect:"密码一致"}).inputValidator({min:1,empty:{leftEmpty:false,rightEmpty:false,emptyError:"重复密码两边不能有空符号"},onError:"重复密码不能为空,请确认"}).compareValidator({desID:"password1",operateor:"=",onError:"2次密码不一致,请确认"});
	$(":radio[name='xb_one']").formValidator({tipID:"sexTip",onShow:"请选择你的性别",onFocus:"没有第三种性别了，你选一个吧",onCorrect:"输入正确",defaultValue:["1"]}).inputValidator({min:1,max:1,onError:"性别忘记选了,请确认"});//.defaultPassed();
	$("#pic").formValidator({triggerEvent:"change",onShow:"请修改您的头像 ", onFocus:"图片格式可以为jpg|bmp|gif|ico|pcx|jpeg|tif|png|raw|tga ", onCorrect:"恭喜您，图片可用" }).inputValidator({min:1, empty:{leftEmpty:false,emptyError:"不允许有空格 "}, onError:"必须上传头像" }).regexValidator({regExp:"picture",dataType:"enum",onError:"图片格式不正确 " })

	$("#nl").formValidator({autoModify:true,onShow:"请输入的年龄（1-99岁之间）",onFocus:"只能输入1-99之间的数字哦",onCorrect:"恭喜你,你输对了"}).inputValidator({min:1,max:99,type:"value",onErrorMin:"你输入的值必须大于等于1",onError:"年龄必须在1-99之间，请确认"}).defaultPassed();
	$("#csny").formValidator({onShow:"请输入的出生日期",onFocus:"请输入的出生日期，不能全部是0哦",onCorrect:"你输入的日期合法"}).inputValidator({min:"1900-01-01",max:"2000-01-01",type:"string",onError:"日期必须在\"1900-01-01\"和\"2000-01-01\"之间"}).defaultPassed();
	$("#sfzh").formValidator({ajax:true,onShow:"请输入15或18位的身份证",onFocus:"输入15或18位的身份证",onCorrect:"输入正确"}).functionValidator({fun:isCardID});
	$("#email").formValidator({onShow:"请输入邮箱",onFocus:"邮箱6-100个字符,输入正确了才能离开焦点",onCorrect:"恭喜你,你输对了",defaultValue:"@"}).inputValidator({min:6,max:100,onError:"你输入的邮箱长度非法,请确认"}).regexValidator({regExp:"^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$",onError:"你输入的邮箱格式不正确"});
	$("#xueli").formValidator({onShow:"请选择你的学历",onFocus:"学历必须选择",onCorrect:"谢谢你的配合",defaultValue:"a"}).inputValidator({min:1,onError: "你是不是忘记选择学历了!"}).defaultPassed();
	$("#ewjy").formValidator({onShow:"无论你输入什么都会提示你额外校验出错",onFocus:"如果你输入\"猫冬\"，额外校验就会成功",onCorrect:"额外校验成功"}).inputValidator({min:1,onError:"这里至少要一个字符,请确认"}).functionValidator({
	    fun:function(val,elem){
	        if(val=="猫冬"){
			    return true;
		    }else{
			    return "额外校验失败,想额外校验通过，请输入\"猫冬\""
		    }
		}
	});
	$("#Tel_country").formValidator({tipID:"teltip",onShow:"请输入国家区号",onFocus:"国家区号2位数字",onCorrect:"恭喜你,你输对了",defaultValue:"86"}).regexValidator({regExp:"^\\d{2}$",onError:"国家区号不正确"});
	$("#Tel_area").formValidator({tipID:"teltip",onShow:"请输入地区区号",onFocus:"地区区号3位或4位数字",onCorrect:"恭喜你,你输对了"}).regexValidator({regExp:"^\\d{3,4}$",onError:"地区区号不正确"});
	$("#Tel_number").formValidator({tipID:"teltip",onShow:"请输入电话号码",onFocus:"电话号码7到8位数字",onCorrect:"恭喜你,你输对了"}).regexValidator({regExp:"^\\d{7,8}$",onError:"电话号码不正确"});
	$("#Tel_ext").formValidator({tipID:"teltip",onShow:"请输入分机号码",onFocus:"分机号码1到5位数字",onCorrect:"恭喜你,你输对了"}).regexValidator({regExp:"^\\d{1,5}$",onError:"分机号码不正确"});
	$(":checkbox[name='xqah_one']").formValidator({tipID:"test3Tip",onShow:"请选择你的兴趣爱好（至少选一个）",onFocus:"你至少选择1个",onCorrect:"恭喜你,你选对了"}).inputValidator({min:1,onError:"你选的个数不对"});
	$(":checkbox[name='xqah_more']").formValidator({tipID:"test2Tip",onShow:"请选择你的兴趣爱好(至少选择2个,最多选择3个)",onFocus:"你至少选择2个,最多选择3个",onCorrect:"恭喜你,你选对了",defaultValue:["7","8"]}).inputValidator({min:2,max:3,onError:"你选的个数不对(至少选择2个,最多选择3个)"});
	$(":radio[name='aiguo']").formValidator({tipID:"aiguoTip",onShow:"爱国的人一定要选哦",onFocus:"你得认真思考哦",onCorrect:"不知道你爱不爱，反正你是选了",defaultValue:["4"]}).inputValidator({min:1,max:1,onError:"难道你不爱国？你给我选！！！！"}).defaultPassed();
	$("#shouji").formValidator({empty:true,onShow:"请输入你的手机号码，可以为空哦",onFocus:"你要是输入了，必须输入正确",onCorrect:"谢谢你的合作",onEmpty:"你真的不想留手机号码啊？"}).inputValidator({min:11,max:11,onError:"手机号码必须是11位的,请确认"}).regexValidator({regExp:"mobile",dataType:"enum",onError:"你输入的手机号码格式不正确"});;
	$("#lxdh").formValidator({empty:true,onShow:"请输入你的联系电话，可以为空哦",onFocus:"格式例如：0577-88888888",onCorrect:"谢谢你的合作",onEmpty:"你真的不想留联系电话了吗？"}).regexValidator({regExp:"^(([0\\+]\\d{2,3}-)?(0\\d{2,3})-)?(\\d{7,8})(-(\\d{3,}))?$",onError:"你输入的联系电话格式不正确"});
	$("#sjdh").formValidator({empty:true,onShow:"请输入你的手机或电话，可以为空哦",onFocus:"格式例如：0577-88888888或11位手机号码",onCorrect:"谢谢你的合作",onEmpty:"你真的不想留手机或电话了吗？"}).regexValidator({regExp:["tel","mobile"],dataType:"enum",onError:"你输入的手机或电话格式不正确"});
	$("#selectmore").formValidator({onShow:"按住CTRL可以多选",onFocus:"按住CTRL可以多选,至少选择2个",onCorrect:"谢谢你的合作",defaultValue:["0","1","2"]}).inputValidator({min:2,onError:"至少选择2个"});
	$("#ms").formValidator({onShowText:"这家伙很懒，什么都没有留下。",onShow:"请输入你的描述",onFocus:"描述至少要输入10个汉字或20个字符",onCorrect:"恭喜你,你输对了",defaultValue:"这家伙很懒，什么都没有留下。"}).inputValidator({min:20,onError:"你输入的描述长度不正确,请确认"});
});
function test(obj)
{
	if(obj.value=="不校验身份证")
	{
		$("#sfzh").attr("disabled",true).unFormValidator(true);
		obj.value = "校验身份证";
	}
	else
	{
		$("#sfzh").attr("disabled",false).unFormValidator(false);
		obj.value = "不校验身份证";
	}
}
function test1(obj)
{
	var initConfig = $.formValidator.getInitConfig("1");
	if(obj.value=="全角字符当做1个长度")
	{
		initConfig.wideword = false;
		obj.value = "全角字符当做2个长度";
	}
	else
	{
		initConfig.wideword = true;
		obj.value = "全角字符当做1个长度";
	}
	$('body').data(obj.validatorgroup,initConfig);
}
</script>
<style type="text/css">
body,div{font-size:12px;}
tr{height:32px;}
</style>
</head>
<body>

<h3>jQuery formValidator表单验证插件示例</h3>
<p><strong>固定提示层(FixTip)。该模式是常见模式，你必须自己放置div，固定提示层的位置</strong></p>
<p>
  <input type="button" onClick="test(this)" value="不校验身份证"  />

<input type="button" name="Submit" onClick="test1(this)" value="全角字符当做1个长度"> 
请看最后的"你的描述"控件
</p>
<p>请访问官方网站获取更多的资料和帮助:<a href="http://www.yhuan.com/">http://www.yhuan.com/</a></p>
<ul id="errorlist"></ul>
<p><a href="Default.aspx">新增用户</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="Default.aspx?us=123456">编辑用户名[123456]</a></p>
<form id="form1" runat="server">
<input id="btnA" type="button" value="Ajax提交" style="margin-left: 70px;" />
        <asp:Button ID="btn1" runat="server" Text="普通提交" OnClick="btn1_Click" />
<br />

  <table border="0px" style="font-size:12px" width="730px">
    <tr> 
      <td align="right" width="135px">用户名:</td>
      <td width="265px"><asp:TextBox ID="us" runat="server" style="width:120px"  runat="server"></asp:TextBox></td>
      <td width="330px"><div id="usTip" style="width:280px"></div></td>
    </tr>
    <tr> 
      <td align="right">密码:</td>
      <td><input type="password" id="password1" name="password1" style="width:120px" /></td>
      <td><div id="password1Tip" style="width:280px"></div></td>
    </tr>
    <tr> 
      <td align="right">重复密码:</td>
      <td><input type="password" id="password2" name="password2" style="width:120px" /></td>
      <td><div id="password2Tip" style="width:280px"></div></td>
    </tr>
    <tr> 
      <td align="right">你的性别:</td>
      <td><input type="radio" id="sex" value="1" name="xb_one" />
        男&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" id="sex1" value="2" name="xb_one" />
        女</td>
      <td><div id="sexTip" style="width:280px"></div></td>
    </tr>
    <tr> 
      <td align="right">你的头像:</td>
      <td><input type="file" id="pic" name="pic" /></td>
      <td><div id="picTip" style="width:280px"></div></td>
    </tr>
    <tr> 
      <td align="right">你的年龄:</td>
      <td><input type="text" id="nl" name="nl" style="width:120px" value="26" class="fv_input_text_default" /></td>
      <td><div id="nlTip" style="width:280px"></div></td>
    </tr>
    <tr> 
      <td align="right">出生日期:</td>
      <td><input type="text" id="csny" name="csny" style="width:120px" value="1982-09-21" /></td>
      <td><div id="csnyTip" style="width:280px"></div></td>
    </tr>
    <tr>
      <td align="right">身份证号</td>
      <td><input name="sfzh" type="text" id="sfzh" style="width:150px" value="" /></td>
      <td><div id="sfzhTip" style="width:280px"></div></td>
    </tr>
    <tr> 
      <td align="right">电子邮箱:</td>
      <td><input type="text" id="email" name="email" style="width:120px" /></td>
      <td><div id="emailTip" style="width:280px"></div></td>
    </tr>
    <tr> 
      <td align="right">你的学历:</td>
      <td> <select name="xueli" id="xueli">
          <option value="">－－请选择你的学历－－</option>
          <option value="a">专科</option>
          <option value="b">本科</option>
          <option value="c">研究生</option>
          <option value="e">硕士</option>
          <option value="d">博士</option>
        </select> </td>
      <td><div id="xueliTip" style="width:280px"></div></td>
    </tr>
    <tr> 
      <td align="right">额外校验:</td>
      <td><input name="ewjy" type="text" id="ewjy" style="width:120px" /></td>
      <td><div id="ewjyTip" style="width:280px"></div></td>
    </tr>
    <tr> 
      <td colspan="3"> 国家区号 
        <input id="Tel_country" name="Tel_country" style="width: 20px;" value="" />
        -地区区号 
        <input id="Tel_area" name="Tel_area" style="width: 35px;" />
        -电话号码 
        <input id="Tel_number" name="Tel_number" style="width: 60px;" />
        -分机号码 
        <input id="Tel_ext" name="Tel_ext" style="width: 30px;" /> </td>
    </tr>
    <tr>
      <td colspan="3"><div id="teltip" style="width:280px"></div></td>
    </tr>
    <tr> 
      <td align="right">兴趣爱好1:</td>
      <td colspan="2"> <input type="checkbox" name="xqah_one" id="qq1"/>
        乒乓球 
        <input type="checkbox" name="xqah_one" id="qq2" value="1" />
        羽毛球 
        <input type="checkbox" name="xqah_one" id="qq3" value="2" />
        上网 
        <input type="checkbox" name="xqah_one" id="qq4" value="3" />
        旅游 
        <input type="checkbox" name="xqah_one" id="qq5" value="4" />
        购物 </td>
    </tr>
    <tr> 
      <td colspan="3"><div id="test3Tip" style="width:350px"></div></td>
    </tr>
    <tr> 
      <td align="right">兴趣爱好2:</td>
      <td colspan="2"> <input type="checkbox" name="xqah_more" id="pp0"/>
        乒乓球 
        <input type="checkbox" name="xqah_more" id="pp1" value="5" />
        羽毛球 
        <input type="checkbox" name="xqah_more" id="pp7" value="6" />
        上网 
        <input type="checkbox" name="xqah_more" id="pp8" value="7" />
        旅游 
        <input type="checkbox" name="xqah_more" id="pp9" value="8" />
        购物 
        <input type="checkbox" name="xqah_more" id="pp6" value="9" />
        睡觉 </td>
    </tr>
    <tr> 
      <td colspan="3"><div id="test2Tip" style="width:350px"></div></td>
    </tr>
    <tr> 
      <td align="right">你爱国吗:</td>
      <td colspan="2"> <input type="radio" name="aiguo" value="1" id="bb1"  />
        不爱 
        <input type="radio" name="aiguo" id="bb2" value="2" />
        不发表意见 
        <input type="radio" name="aiguo" id="nn3" value="3" />
        爱 
        <input type="radio" name="aiguo" id="nn4" value="4" />
        爱死它了 </td>
    </tr>
    <tr> 
      <td colspan="3"><div id="aiguoTip" style="width:280px"></div></td>
    </tr>
    <tr> 
      <td align="right">手机号码:</td>
      <td><input type="text" id="shouji" name="shouji" style="width:120px" /></td>
      <td><div id="shoujiTip" style="width:280px"></div></td>
    </tr>
    <tr> 
      <td align="right">联系电话:</td>
      <td><input type="text" id="lxdh" name="lxdh" style="width:120px" /></td>
      <td><div id="lxdhTip" style="width:280px"></div></td>
    </tr>
    <tr> 
      <td align="right">手机或电话:</td>
      <td><input type="text" id="sjdh" name="sjdh" style="width:120px" /></td>
      <td><div id="sjdhTip" style="width:280px"></div></td>
    </tr>
    <tr> 
      <td align="right" valign="top">多选select控件:</td>
      <td valign="top">
	    <select name="selectmore" size="3" id="selectmore" multiple>
		  <option value="0">多选1</option>
		  <option value="1">多选2</option>
		  <option value="2">多选3</option>
		</select>(按住ctrl键多选)
      </td>
      <td><div id="selectmoreTip" style="width:280px"></div></td>
    </tr>
    <tr> 
      <td align="right" valign="top">你的描述:</td>
      <td colspan="2" valign="top"> <textarea id="ms" name="ms" cols="50" rows="10">这里是十个中文字符哦</textarea> 
      </td>
    </tr>
    <tr> 
      <td colspan="3"><div id="msTip" style="width:280px"></div></td>
    </tr>
  </table>
  
</form>
<div id="output"></div>
<script type="text/javascript" src="http://s13.cnzz.com/stat.php?id=1123054&web_id=1123054&show=pic" language="JavaScript"></script>
</body>
</html>
