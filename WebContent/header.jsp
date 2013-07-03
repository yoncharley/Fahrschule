<TITLE>窗内网</TITLE>

<LINK href="pay.css" type=text/css rel=stylesheet>
<style type="text/css">
<!--
#demo {
	height: 150px;
	width: 510px;
	overflow: hidden;
	border: 1px solid #FFC937;	
}
#mydemo {
	height: 110px;
	width: 510px;
	overflow: hidden;
	background-color:#EBF8FF;
	border: 1px solid #ACDAFF;
		
}
-->
</style>
<SCRIPT type=text/javascript>
	<!--
	function secCard(n,zx)
	{
		var dd=n
			if(dd==0){
				document.getElementById('tlk0').className="menu0";
				document.getElementById('tlk1').className="menu1_1";
				document.getElementById('tlk2').className="menu2_1";
				document.getElementById('tab0').style.display="";
				document.getElementById('tab1').style.display="none";
				document.getElementById('tab2').style.display="none";
			}else{
				if(dd==1){
					document.getElementById('tlk0').className="menu0_1";
					document.getElementById('tlk1').className="menu1";
					document.getElementById('tlk2').className="menu2_1";
					document.getElementById('tab0').style.display="none";
					document.getElementById('tab1').style.display="";
					document.getElementById('tab2').style.display="none";
				}else{
					document.getElementById('tlk0').className="menu0_1";
					document.getElementById('tlk1').className="menu1_1";
					document.getElementById('tlk2').className="menu2";
					document.getElementById('tab0').style.display="none";
					document.getElementById('tab1').style.display="none";
					document.getElementById('tab2').style.display="";
				}
			}
	}
	//-->
</SCRIPT>

<DIV id=wrapper>
<P id=header>
<A class=logo title="窗内网" href="http://www.itzcn.com/"><SPAN>窗内网</SPAN></A> <SPAN class=login>您好，
请
<%if(session.getAttribute("uname")==null){%>
 <A href="reg.jsp">注册</A> 或 
<A href="login.jsp">登录</A>
<%}else{%>
<A href="logout.jsp">注销</A>
<%}%>
 | <A 
href="http://school.itzcn.com/help.html" target=_blank>帮助中心</A> | <A onClick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.itzcn.com/')" 
            href="#">设为首页</A> | <A href="javascript:window.external.addfavorite('','窗内网 - 视频教程')">加入收藏</A></SPAN> </P>
<DIV id="nav_index">
	<ul>
		<LI><A href="http://school.itzcn.com">窗内学院</A> </LI>
  		<LI><A href="http://bbs.itzcn.com">窗内论坛</A> </LI>
  		<LI><A href="http://blog.itzcn.com">窗内博客</A> </LI>
  		<LI><SPAN></SPAN></LI>
  	</ul>
</DIV>
</DIV>
