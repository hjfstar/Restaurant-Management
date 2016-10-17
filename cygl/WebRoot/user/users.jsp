<%@ page language="java" import="java.sql.*,com.fit.dao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");//加载JDBC驱动
	//Connection conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=mydb","sa","11fit");
	//Statement st=conn.createStatement();
	Dao dao=new Dao();
	dao.beginTransaction();//开始事务
	ResultSet rs=dao.query("select * from custom");
		//st.executeQuery("select * from custom");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="ffffcc">
<table>
	<tr>
		<td width="200" align="center"><strong><font size="4">顾客编号</font></strong></td><td width="200" align="center"><strong>顾客姓名</strong></td><td width="200" align="center"><font size="4"><strong>顾客类型</strong></font></td><td align="center" width="100"><font size="4"><strong>操作</strong></font></td>
	</tr>
<%
	while(rs.next()){
		String custId=rs.getString("cust_id");
		String custName=rs.getString("cust_name");
		String custType=rs.getString("cust_style");
%>		
	<tr>
		<td align="center"><%=custId %></td><td align="center"><%=custName%></td><td align="center"><%=(custType) %></td>
		<td align="center"><a href ="delUser.jsp?custId=<%=custId %>">修改</a></td>		
	</tr>
<%
	}
%>

</table>
<%
	dao.commitTransaction();//提交事务
	dao.close();
%>	
</body>
</html>