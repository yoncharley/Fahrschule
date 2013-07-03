<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>

<style type="text/css">
	body { margin:0; padding:0;}
	#header { height: 80px; width: 70%; background: #9F9; magin: 5px; margin-left: 125px; }
	#main { height: 50px; width: 70%; background: #9FF; margin: 5px; margin-left: 125px; }
	#footer { height: 80px; width: 70%; background: #9F9; margin: 5px; margin-left: 120px; }
	#side { background: #99FF99; height:240px; width: 120px; float: left; }
</style>

</head>

<body>
	<div id="side"> side </div>
	<div id="header"> header
		<center>
			<a href="frame.jsp"> 到other.jsp页面 </a>
		</center>
	</div>
	<div id="main">
	<center>
		<!-- hello是action -->
		<a href="hello">到hello.jsp页面</a>
	</center>
	</div>
	<div id="footer"> footer </div>
</body>
</html>