<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

	body{
		margin:0px;
		padding:0px;
		border:0px;
		font-size:10pt;
		background-color:pink;
	}
	
	#container{
		margin:0px auto;
		padding:0px;
		border:0px;
		width:900px;
		background-color:#FFFFFfF;	
		position:relative;
	}
	
	#title{
		position:absolute;
		top:0px;
		left:0px;		
		font-family: 隶书;
		font-size:30pt;
		text-align: center;
		line-height:40px;/*定义行高，文字自动在行高范围内居中*/
		height:40px;
		width:900px;
		background-color:green;
		color:#FFFFFF;
		/*background-image: url("images/bg.jpg");*/
	}
	
	#menu{
		position:absolute;
		top:80px;
		left:0px;
		width:150px;
		height:500px;
		background-color:green;		
	}
	
	#menu div{
		margin-top:20px;
		margin-left:20px;
	}
	
	#main{
		position:absolute;
		top:80px;
		left:150px;
		width:750px;
		height:500px;
		background-color:#ffffcc;
		
	}
	
	#main iframe{
		width:750px;
		height:500px;
		border:0px;
		
	}
	
	#copyright{
		position:absolute;
		top:580px;
		left:0px;
		width:900px;
		height:35px;
		text-align: center;
		line-height:35px;
		background-color:green;
	}
	
	#menu ul{
		margin:0px 0px 20px 0px;
		padding:0px;
		list-style-image:url("images/icon_1.gif");		
		padding-left:30px;
	}
	
	#menu ul li{
		margin:0px;
		padding:0px;
		margin-top:10px;
	
	}
	
	#menu a:link,#menu a:visited{
		color:#1630A1;
		text-decoration: none;
	}
	
	#menu a:hover{
		color:#FF0000;
		text-decoration: none;
	}
	
</style>
</head>
<body>

<div id="container">
	
	<div id="title" style="top: 0px; height: 141px;"><strong><font face="楷体_GB2312" color="#ffff00">餐饮管理系统</font></strong>
	<div style="text-align: right;font-size:15px;color="#ffffcc"">${custId }欢迎您！</div>
	</div>
	<div id="menu" style="top: 84px; height: 496px;">
		<div><font face="黑体"><font size="4" color="yellow"> 
		顾客管理
			<ul>			
				<li><font color="#ffff00" face="宋体"><a href="user/users.jsp" target="mainFrame">顾客信息</a></li>
				<li><a href="pwd/updPwd.jsp" target="mainFrame">密码修改</a></li>
				<li><a href="logout.jsp" >安全退出</a></li>
			</ul>
			菜品信息
			<ul>
				<li><font face="宋体"><a href="protype/types.jsp" target="mainFrame">菜系</a></font></li>
				<li><font face="宋体"><a href="pro/pros.jsp" target="mainFrame">菜单</a></font></li>			
			</ul>
			订单管理
			<ul>			
				<li><font face="宋体"><a href="book/book.jsp" target="mainFrame">新增订单</a></font></li>

			</ul>
			订餐查询
			<ul>			
				<li><font face="宋体"><a href="details/details.jsp" target="mainFrame">订餐明细</a></li>

			</ul>
		</div>
	</div>
	<div id="main">
		<iframe src="main.jsp" style="width:630px; height:500px" frameborder="0" name="mainFrame"></iframe>
	</div>
	<div id="copyright"><font color="yellow" face="楷体_GB2312" size="4">&copy;<font color="#ff0000">行知汇元Beyond团队</font></font></div>

</div>


</body>
</html>
