<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="./skins/default/jx.css" type="text/css"></link>
<script language="javascript" src="./js/ajax_func.js"></script>
  
<style type="text/css">
<!--
body {
	background-color: #EEF2FB;
	line-height: 1.5;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
}
#top {
	background-color: #29455E;
	height: 36px;
	padding-left: 8px;
}
#title {
	font-family: "宋体";
	font-size: 24px;
	font-weight: bold;
	color: #FFFFFF;
	float: left;
}
#user {
	float: right;
	font-family: "宋体";
	font-size: 18px;
	color: #FFFFFF;
	padding-top: 8px;
}
#subtop {
	background-color: #6699CC;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	height: 20px;
	font-size: 14px;
	font-weight: bold;
	color: #CCCCCC;
	text-align: left;
	padding-left: 10px;
}
.btn_index {
	font-family: "宋体";
	font-size: 18px;
	color: #CCFFFF;
	background-color: #6699FF;
	float: right;
	margin-right: 5px;
	margin-top: 8px;
	margin-left: 200px;
}
.btn_logout {
	font-family: "宋体";
	font-size: 18px;
	color: #CCFFFF;
	background-color: #6699FF;
	float: right;
	margin-right: 5px;
	margin-top: 8px;
}
.no{display:none;}
-->
</style>
<script type="text/javascript">
   function ShowMenu(hid,noid)
   {
	  var block =	document.getElementById(noid);
	  //获取用户所点的父菜单
	  var obj=document.getElementById(hid);
	  var n = noid.substr(noid.length-1);
		var ul = document.getElementById("menu").getElementsByTagName("ul");
		var h1 = document.getElementById("menu").getElementsByTagName("h1");
		for(var i=0; i<h1.length;i++)
		{
			h1[i].innerHTML = h1[i].innerHTML.replace("-","+");
			h1[i].style.color = "";
			//h1[i].style.backgroundImage="url(images/454-1.gif)";
		}
		obj.style.color = "#0000FF";
		//用户未点选的父菜单下的子菜单class设为"no";
		for(var i=0; i<ul.length; i++)
		{
		  if(i!=n)
		  {
		    ul[i].className = "no";
		  }
		 }
		 //用户点选的父菜单下的子菜单class设为空，class为no的将不显示
	if(block.className == "no")
	{
		block.className = "";
		obj.innerHTML = obj.innerHTML.replace("+","-");
		//obj.style.backgroundImage="url(./images/454.gif)";
		//obj.style.backgroundColor="RGB(171,180,255)";
	}
	else
	{
		block.className = "no";
		obj.style.color = "";
		//obj.style.backgroundColor="Lavender";
	}
}
//根据用户所选的父菜单返回对应的子菜单
   function listFunctionsMenu(value,ulvalue)
     {
        var name1='<%=session.getAttribute("user")%>';
        var queryString="menu_listFunctionsMenu.do?sysmdautoid="+value;
        queryString=queryString+"&ulid=NO"+ulvalue+"&loginname="+name1;
        send_request("get",queryString,null,"text",handleStateChangef);
     }
   
     function handleStateChangef() {
        if(xmlHttp.readyState == 4) 
        {
         if(xmlHttp.status == 200) 
          {
             parseResultfs();
          }
        }
       }
       
    //显示子菜单
     function parseResultfs() {
        var responseResults = xmlHttp.responseText;
        var d="";
        var arr=responseResults.split(",");
        var ulid=arr[0];
        for(var i=1;i<arr.length;i++)
        {
           arr1=arr[i].split("|");
           var h="<li><a href='"+arr1[1]+"?modulename="+arr1[2]+"&functionname="+arr1[3]+"' target='mainFrame' >"+ arr1[0]+"</a></li>";
           d=d+h;   
        }
        //d=d+"</ul>";
        hvid="hv"+ulid.substr(ulid.length-1);
        //div中显示子菜单；
        document.getElementById(ulid).innerHTML=d;
        ShowMenu(hvid,ulid);
     }
  </script>
</head>

<body> <!-- onload="listSysmdMenu();"> -->
<!--  
<div id="top">
	<div id="title">成都市机动车驾驶人某考训场管理系统</div>
	<input class="btn_logout" type="submit" name="button" id="button" value="登出" />
	<input class="btn_index" type="submit" name="button" id="button" value="首页" />
	<div id="user">xx 欢迎登陆</div>
</div>

<div id="subtop">Examination Management And Administration System</div>
-->
<div id="menu" style="border:1px inset red"> 
	<h1 id="hv1" onclick="javascript:ShowMenu(this,'NO0')">用户管理</h1> 
         <ul id="NO0" class="no">
          <li><a href="user_listUser.do" target="mainFrame" ><img src="images/button2.jpg"></img><br />账号管理</a></li>
          <li><a href="role_listRole.do" target="mainFrame"><img src="images/btn-t.jpg"></img><br />角色管理</a></li>
          <li></li>
         </ul>
      <h1 id="hv2" onclick="javascript:ShowMenu(this,'NO1')">加气机管理</h1>
        <ul id="NO1" class="no">
         <li><a href=""><img src="images/btn-2.jpg"></img><br />各枪班查询</a></li>
         <li><a href=""><img src="images/btn-3.jpg"></img><br />加气流水查询</a></li>
         <li><a href=""><img src="images/btn-4.jpg"></img><br />综合班报查询</a></li>
        </ul>
      <h1 id="hv3" onclick="javascript:ShowMenu(this,'NO2')">IC卡管理</h1>
        <ul id="NO2" class="no">
         <li><a href=""><img src="images/card-btn.gif"></img><br />办理卡业务</a></li>
         <li><a href=""><img src="images/card-btn1.gif"></img><br />充值业务</a></li>
         <li><a href="">※查询</a></li>
        </ul> 
  </div>
<p><span>some text.</span>some other text.</p>
<script type="text/javascript">
     function listSysmdMenu()
     {
        //var name='<%=session.getAttribute("user")%>';
        var name="admin";
        alert(name);
        //返回数据库中存在的系统模块
        send_request("get","menu_listSysmdMenu.do?loginname="+name,null,"text",handleStateChange);
     }
   
     function handleStateChange() {
        if(xmlHttp.readyState == 4) 
        {
        alert("1");
         if(xmlHttp.status == 200) 
          {alert("2");
             parseResults();
          }
        }
       }
       
    //显示<h1>标签的结果
     function parseResults() {
        var responseResults = xmlHttp.responseText;
        var d="";
        alert(responseResults);
        if(responseResults!="")
        {  
        var arr=responseResults.split(",");
        for(var i=0;i<arr.length;i++)
        {
           arr1=arr[i].split("|");
           var h="<h1 id='hv"+i+"' onclick='listFunctionsMenu("+arr1[0]+","+i+")' >"+ arr1[1]+"</h1><ul id='NO"+i+"' class='no'></ul>";
           d=d+h;   
        }
        }
        alert(d);
         //把<h1>显示在div中
        document.getElementById("menu").innerHTML=d;
     }
  </script>
</body>
</html>
