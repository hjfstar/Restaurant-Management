<%@ page language="java" import="java.sql.*,com.fit.dao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	
	
	Dao dao=new Dao();
	dao.beginTransaction();
	ResultSet rs=dao.query("select * from veg_style");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body  bgcolor="ffffcc">
	<table>
		<tr>
			<td width="200" align="center"><font size="4"><strong>编号</strong></font></td><td align="center" width="200"><strong><font size="4"> 名称</font></strong></td><td align="center" width="200"><font size="4"><strong> 操作</strong></font></td> 
		</tr></table><div align="center">	
<%
	while(rs.next()){
 %>	</div><table>	
		<tr align="center">
			<td width="200"><%=rs.getString("sty_id") %></td>
			<td width="200"><a href="<%=rs.getString("sty_url") %>"><%=rs.getString("sty_name") %></a></td>
			<td width="200"> 
				<a href="updType.jsp?styId=<%=rs.getString("sty_id") %>">修改</a>
				<a href="doDelType.jsp?styId=<%=rs.getString("sty_id") %>">删除</a>			
			</td>
		</tr></table><div align="center">
<%
	}
 %>	</div><table>
	
	</table>
	
<% 
	dao.commitTransaction();
	dao.close();

 %>	
	
<div align="center"><br><br><a href="addType.jsp">增加新类型</a></div>


	
</body>
</html>

























