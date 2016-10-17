<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkType(){

		if(document.forms[0].styName.value==""){
			alert("类型编号不能为空！");
			return false;

		}

		if(document.forms[0].styId.value==""){
			alert("类型名不能为空！");
			return false;

		}
	
	}

</script>
</head>
<body bgcolor="ffffcc">
<div align="center"><form action="doAddType.jsp" method="post" style="" onsubmit="return checkType();"> 
	<p><strong><font size="4"><br></font></strong></p><p><strong><font size="4"><br></font></strong></p><p><strong><font size="4"><br></font></strong></p><p><strong><font size="4"><br></font></strong></p><p><strong><font size="4"><br></font></strong></p><p><strong><font size="4"><br></font></strong></p><p><strong><font size="4"><br></font></strong></p><p><strong><font size="4">编号：<input type="text" name="styId"></font></strong></p> 
	<p><strong><font size="4">名称：<input type="text" name="styName"></font></strong></p> 
	<p><strong><font size="4">地址：<input type="text" name="styUrl"></font></strong></p> 
	<p><strong><font size="4"><input type="submit" value="提交"></font></strong></p> 
</form></div>
</body>
</html>