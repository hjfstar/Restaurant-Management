<%@ page language="java" import="java.sql.*,com.fit.dao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	Dao dao=new Dao();
	dao.beginTransaction();
	ResultSet rs=dao.query("select x.*, y.cust_name,y.cust_style,y.cust_tel from book x,custom y where x.cust_id=y.cust_id  ");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body  bgcolor="ffffcc">
	<table>
		<tr align="center">
			<td  width="200"  ><font size="4"><strong>订餐编号</strong></font></td><td width="200"  ><font size="4"><strong>顾客编号</strong></font></td><td width="200"  ><font size="4"><strong>顾客姓名</strong></font></td><td width="200"  ><font size="4"><strong>顾客类型</strong></font></td><td width="200"  ><font size="4"><strong>顾客电话</strong></font></td><td width="200"  ><font size="4"><strong>操作</strong></font></td>
		</tr>
<%
	while(rs.next()){
 %>		
		<tr align="center">
			<td><font size="4"><%=rs.getString("book_id") %></font><br></td>
			<td><font size="4"><%=rs.getString("cust_id") %></font><br></td>
			<td><font size="4"><%=rs.getString("cust_name") %></font><br></td>
			<td><font size="4"><%=rs.getString("cust_style") %></font><br></td>
			<td><font size="4"><%=rs.getString("cust_tel") %></font><br></td>
			<td>
				
			    <font size="4"><a href='delete.jsp?bookId=<%=rs.getString("book_id") %>'>删除订单</a></font>			
			</td>
		</tr>
<%
	}
 %>	
	
	</table>
	
<% 
	dao.commitTransaction();
	dao.close();

 %>	
	
<div align="center"><font size="4"><br><a href="addBook.jsp">增加新订单</a></font> 
 
 
	 
</div></body>
</html>

























