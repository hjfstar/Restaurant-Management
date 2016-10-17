<%@ page language="java" import="java.sql.*,com.fit.dao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String custid=request.getParameter("custId");
	
	Dao dao=new Dao();
	dao.beginTransaction();
	
	ResultSet rs=dao.query("select * from custom  where cust_id=?",custid);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body  bgcolor="ffffcc">
<%
	if(!rs.next()){
		dao.commitTransaction();
		dao.close();
		return;
	}
 %>
 <div align="center"><form action="doUpdType.jsp" method="post"> 
	<p><br></p><p><br></p><p><br></p><p><br></p><p>         用户ID：<input type="text" name="custId" value='<%=rs.getString("cust_id") %>'><font color="#ff0000">*不能修改</font></p> 
	<p>用户名：<input type="text" name="custName" value='<%=rs.getString("cust_name") %>'></p> 
	<p>用户类型：<input type="text" name="custStyle" value='<%=rs.getString("cust_style") %>'></p> 
	<p>电话：<input type="text" name="custTel" value='<%=rs.getString("cust_tel") %>'></p> 
	<p>密码：<input type="text" name="custPwd" value='<%=rs.getString("cust_pwd") %>'></p> 
	<p><input type="submit" value="提交"></p> 
</form></div>
<%
	dao.commitTransaction();
	dao.close();
%>
</body>
</html>
	
	