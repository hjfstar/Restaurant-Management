<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkType(){

		if(document.forms[0].custId.value==""){
			alert("类型编号不能为空！");
			return false;

		}

		if(document.forms[0].bookId.value==""){
			alert("类型名不能为空！");
			return false;

		}
	
	}

</script>
</head>
<body  bgcolor="ffffcc">
<div align="center"><form action="doAddbook.jsp" method="post" onsubmit="return checkType();"> 
	<p><font face="宋体"><strong><font size="4"><br></font></strong></font></p><p><font face="宋体"><strong><font size="4"><br></font></strong></font></p><p><font face="宋体"><strong><font size="4"><br></font></strong></font></p><p><font face="宋体"><strong><font size="4">订餐编号：<input type="text" name="bookId"></font></strong></font></p> 
	<p><font face="宋体"><strong><font size="4">顾客编号：<input type="text" name="custId"></font></strong></font></p> 
	<p><font face="宋体"><strong><font size="4"><input type="submit" value="提交"></font></strong></font></p> 
</form></div>
</body>
</html>