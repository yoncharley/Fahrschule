<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html;charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script language="javascript" src="./js/ajax_func.js"></script>
<link rel="stylesheet" href="skins/default/style.css" type="text/css"></link>
<link rel="stylesheet" href="skins/default/frame.css" type="text/css"></link>
<title>无标题文档</title>
</head>

<body onload="loadMenu();">
<div id="top">
	<div id="title">成都市机动车驾驶人某考训场管理系统</div>
	<input class="btn_logout" type="submit" name="button" id="button" value="登出" />
	<input class="btn_index" type="submit" name="button" id="button" value="首页" />
	<div id="user">xx 欢迎登陆</div>
</div>
<div id="subtop">Examination Management And Administration System</div>

<div id="menu"></div>
<div id="mainFrame"></div>

<script type="text/javascript">
function loadMenu()
{
//	var name='<%=session.getAttribute("user")%>';
	var name="admin";
	//返回数据库中存在的系统模块
	send_request("get","menu_listModulMenu?loginname="+name,null,"text",handleStateChange);
}

function handleStateChange() {
	if(xmlHttp.readyState == 4) 
	{
		if(xmlHttp.status == 200) 
		{
			parseResults();
		}
	}
}

//显示<h1>标签的结果
function parseResults() {
	var responseResults = xmlHttp.responseText;	
	var d="";
	if(responseResults!="")
	{  
		var arr=responseResults.split(",");
		for(var i=0;i<arr.length;i++)
		{
			arr1=arr[i].split("|");
			var h="<h1 id='hv"+ i +"' onclick='listFunctionMenu("+ arr1[0] +","+ i +")' >"+ arr1[1] +"</h1><ul id='NO" + i + "' class='no'></ul>";
//			var h="<h1 id='hv"+i+"' onclick='listFunctionsMenu("+arr1[0]+","+i+")' >"+ arr1[1]+"</h1><ul id='NO"+i+"' class='no'></ul>";
			d=d+h;
		}
	}
	//把<h1>显示在div中
	document.getElementById("menu").innerHTML=d;
}

// 根据用户所选的父菜单返回对应的子菜单
function listFunctionMenu(value, ulvalue)
{
//	var name1='<%=session.getAttribute("user")%>';
	var name1="admin";
	var queryString="menu_listFunctionMenu?modulId="+value;
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

// 显示子菜单
function parseResultfs() {
	var responseResults = xmlHttp.responseText;
	var d="";
	var arr=responseResults.split(",");
	var ulid=arr[0];
	for(var i=1;i<arr.length;i++)
	{
		arr1=arr[i].split("|");
//		var h="<li><a href='"+arr1[0]+"?modulename="+arr1[2]+"&functionname="+arr1[1]+"' target='mainFrame' >"+ arr1[1]+"</a></li>";
		var h="<li><h2 onclick='display("+arr1[3]+")'>"+arr1[1]+"</h2></li>";
		d=d+h;
	}
	//d=d+"</ul>";
	hvid="hv"+ulid.substr(ulid.length-1);
	//div中显示子菜单；
	document.getElementById(ulid).innerHTML = d;
	ShowMenu(hvid,ulid);
}

function ShowMenu(hid,noid)
{
	var block = document.getElementById(noid);
	// 获取用户所点的父菜单
	var obj=document.getElementById(hid);
	var n = noid.substr(noid.length-1);
	var ul = document.getElementById("menu").getElementsByTagName("ul");
	var h1 = document.getElementById("menu").getElementsByTagName("h1");
	for(var i=0; i<h1.length;i++)
	{
		h1[i].innerHTML = h1[i].innerHTML.replace("-","+");
		h1[i].style.color = "";
		h1[i].style.background = "url(./images/nav_false.gif)";
		//h1[i].style.backgroundImage="url(images/454-1.gif)";
	}
	
	obj.style.background="url(./images/nav_true.gif)";
	//obj.style.color = "#0000FF";
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
//		obj.style.backgroundImage="url(./images/454.gif)";
//		obj.style.backgroundColor="RGB(171,180,255)";
	}
	else
	{
		block.className = "no";
		obj.style.color = "";
		obj.style.background = "url(./images/navfalse.gif)";
//		obj.style.backgroundColor="Lavender";
	}
}

// 显示mainFrame
function display(funid){
    var url="";
    if(funid==2001){
       url="./MyJsp.jsp";
    }
    else if(funid==2002){
       url="./test1.jsp";
    }
    else if(funid==2003){
       url="./header.jsp";
    }
	send_request("get", url,null,"text",handleUrl);
//    alert(url);
     //$("#mainFrame").load(url);
   // mainFrame.load(url);
   
//   document.getElementById("mainFrame").innerHTML = url;
   //document.createElement("div"); 
}

function handleUrl() {
	var responseResults = xmlHttp.responseText;
	document.getElementById("mainFrame").innerHTML = responseResults;
}
</script>

</body>
</html>
