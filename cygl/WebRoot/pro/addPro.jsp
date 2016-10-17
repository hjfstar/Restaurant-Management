<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

<script type="text/javascript">
	function checkType(){

		if(document.forms[0].vegId.value==""){
			alert("类型编号不能为空！");
			return false;

		}

		if(document.forms[0].vegName.value==""){
			alert("类型名不能为空！");
			return false;

		}
		if(document.forms[0].styId.value==""){
			alert("类型名不能为空！");
			return false;

		}
	
	}

</script>
</head>
<body   bgcolor="ffffcc">
<div align="center"><form action="doAddType.jsp" method="post" onsubmit="return checkType();">
<p><font size="4"><strong><br></strong></font></p><p><font size="4"><strong><br></strong></font></p><p><font size="4"><strong><br></strong></font></p><p><font size="4"><strong><br></strong></font></p><p><font size="4"><strong><br></strong></font></p><p><font size="4"><strong><br></strong></font></p><p><font size="4"><strong><br></strong></font></p><p><font size="4"><strong><br></strong></font></p><p><font size="4"><strong>
<form action="doAddType.jsp" method="post">
	<p><font size="4"><strong>编号：<input type="text" name="vegId"/></strong></font></p>
	<p><font size="4"><strong>名称：<input type="text" name="vegName"/></strong></font></p>
	<p><font size="4"><strong>菜类型：<input type="text" name="styId"/></strong></font></p>
	<p><font size="4"><strong><input type="submit" value="提交"/></strong></font></p>
</form>
<body></body>
</html>