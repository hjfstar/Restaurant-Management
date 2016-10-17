<%@ page language="java" import="java.sql.*,com.fit.dao.*"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%    
	String styId=request.getParameter("styId");
	
	Dao dao=new Dao();
	dao.beginTransaction();
	
	ResultSet rs=dao.query("select * from veg_style  where sty_id=?",styId);
	
	
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
	<p><br></p><p><br></p><p><br></p><p><br></p><p>编号：<input type="text" name="styId" value='<%=rs.getString("sty_id") %>'></p> 
	<p>名称：<input type="text" name="styName" value='<%=rs.getString("sty_name") %>'></p> 
	<p><input type="submit" value="提交"></p> 
</form></div>
<%
	dao.commitTransaction();
	dao.close();
%>
</body>
</html>











