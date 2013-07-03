//����ajax xmlHttp������
var xmlHttp= false;

function send_request(method,url,content,responseType,callback)
{
	xmlHttp=false;
	//��ʼ��XMLHttpRequest����
	if (window.XMLHttpRequest)   //Mozilla�����
	{
		xmlHttp = new XMLHttpRequest();
		if(xmlHttp.overrideMimeType)
		{
			xmlHttp.overrideMimeType("text/xml");
		}
	}
	else if(window.ActiveXObject)     //IE�����
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
			}
			catch(e) {}
		}
	}
	if(!xmlHttp)   //�쳣����������ʵ��ʧ��
	{
		window.alert("���ܴ���XMLHttpRequest����ʵ��.");
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
		window.alert("��Ӧ����������");
		return false;
	}
	
	//ȷ����������ķ�ʽ��URL�Լ��Ƿ��첽ִ���¶δ���
	if(method.toLowerCase()=="get")
	{
		xmlHttp.open(method,url,true);
	}
	else if(method.toLowerCase()=="post")
	{
		xmlHttp.open(method,url,true);
		xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	}
	else
	{
		window.alert("http��������������");
		return false;
	}
	xmlHttp.send(content);
}

//��ȡ������=����ֵ���ַ���
function createQueryString(name) {
	var temp = document.getElementById(name).value;
	var queryString = name + "=" + temp;
	return queryString ;
}
    

    