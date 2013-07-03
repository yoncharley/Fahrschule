//定义ajax xmlHttp主对象
var xmlHttp= false;

function send_synrequest(method,url,content,responseType,callback)
{
	xmlHttp=false;
	//初始化XMLHttpRequest对象
	if (window.XMLHttpRequest)   //Mozilla浏览器
	{
		xmlHttp = new XMLHttpRequest();
		if(xmlHttp.overrideMimeType)
		{
			xmlHttp.overrideMimeType("text/xml");
		}
	}
	else if(window.ActiveXObject)     //IE浏览器
	{
		try
		{
			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch(e)
		{
			try
			{
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e) {}
		}
	}
	
	if(!xmlHttp)   //异常，创建对象实例失败
	{
		window.alert("不能创建XMLHttpRequest对象实例.");
		return false;
	}
	
	if(responseType.toLowerCase()=="text")
	{
		xmlHttp.onreadystatechange= callback;
	}
	else if(responseType.toLowerCase()=="xml")
	{
		xmlHttp.onreadystatechange= callback;
	}
	else
	{
		window.alert("响应类别参数错误");
		return false;
	}
	//确定发送请求的方式或URL以及是否同步执行下段代码
	if(method.toLowerCase()=="get")
	{
		xmlHttp.open(method,url,false);
	}
	else if(method.toLowerCase()=="post")
	{
		xmlHttp.open(method,url,false);
		xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	}
	else
	{
		window.alert("http请求类别参数错误。");
		return false;
	}
	xmlHttp.send(content);
}

//获取属性名=属性值的字符串
function PropertyValue(name) {
	var temp = document.getElementById(name).value;
	return temp ;
}
    
    

    