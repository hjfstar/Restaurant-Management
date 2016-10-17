<%@ page language="java" import="java.sql.*,com.fit.dao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
    String bookId=request.getParameter("bookId");
	if(bookId==null) bookId="";
	
    int first=1;//首页
	int prior=0;//
	int next=0;//
	int last=0;//
	int current=1;//合理的当前页
	
	int pageRecCnt=3;//每页最多记录数
	int totalRecCnt=0;//总记录数
	int totalPageCnt=0;//总页数
	int pageFactRecCnt=0;//本页实际记录数

	Dao dao=new Dao();
	dao.beginTransaction();
	//计算总记录数
 ResultSet rs_cnt=dao.query("select count(*) from details where book_id like '%'+?+'%'",bookId);
	rs_cnt.next();
	totalRecCnt=rs_cnt.getInt(1);
	
	//计算总页数
	if(totalRecCnt<1)totalPageCnt=1;	
	else{
		if(totalRecCnt%pageRecCnt==0) totalPageCnt=totalRecCnt/pageRecCnt;
		else totalPageCnt=totalRecCnt/pageRecCnt+1;
		
	}
	
	//计算当前页码
	String pageCode=request.getParameter("page");
	try{
		current=Integer.parseInt(pageCode);
	}catch(NumberFormatException e){}
	if(current<1)current=1;
	System.out.println(current);
	if(current>totalPageCnt)current=totalPageCnt;
	
	//计算上一页
	prior=current-1<1?first:(current-1);
	//计算下一页
	next=current+1>totalPageCnt?totalPageCnt:(current+1);
	//计算最后一页
	last=totalPageCnt;
	
	System.out.println(current);
	//获取当前页记录	
	String sql="select top "+pageRecCnt+" d.*,v.veg_name "+
			   "from details d inner join veg v on d.veg_id=v.veg_id "+
			   "where  d.book_id like '%'+?+'%' and d.veg_id+'-'+d.book_id  not in "+
			   		"(select top "+(current-1)*pageRecCnt+" veg_id+'-'+book_id  from details where book_id like '%'+?+'%' ) ";
			   		
	ResultSet rs=dao.query(sql,bookId,bookId);
	

 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body  bgcolor="ffffcc"><form action="details.jsp" method="post"><div align="center"> 
	订餐编号：<input type="text" name="bookId" value="${param.bookId }">        <input type="submit" value="查询"><br></div><br><table>
		<tr>
			<td width="200" align="center"><strong>订餐编号</strong></td><td width="200" align="center"><font size="4"><strong>菜编号</strong></font></td><td width="200" align="center"><font size="4"><strong>菜名</strong></font></td><td width="200" align="center"><strong>数量</strong></td><td width="200" align="center"><font size="4"><strong>操作</strong></font></td>
		</tr>
<%
	while(rs.next()){
			pageFactRecCnt++;
 %>		
		<tr>
			<td align="center"><%=rs.getString("book_id") %></td>
			<td align="center"><%=rs.getString("veg_id") %></td>
			<td align="center"><%=rs.getString("veg_name") %></td>
			<td align="center"><%=rs.getString("details_num") %></td>
			<td align="center">
				
			    <a href="delete.jsp?vegId=<%=rs.getString("veg_id") %>&bookId=<%=rs.getString("book_id") %>">删除</a>			
			</td>
		</tr>
<%
	}
 %>	
	
	</table>
	
<% 
	dao.commitTransaction();
	dao.close();

 %>	<p align="center">
	<input type="button" value="首页" onclick="this.form.action='details.jsp?page=<%=first %>';this.form.submit();"/>
	<input type="button" value="上页" onclick="this.form.action='details.jsp?page=<%=prior %>';this.form.submit();"/>
	<input type="button" value="下页" onclick="this.form.action='details.jsp?page=<%=next %>';this.form.submit();"/>
	<input type="button" value="尾页" onclick="this.form.action='details.jsp?page=<%=last %>';this.form.submit();"/>

</p>
</form>		 
	<div align="center"><font size="4"><strong><br><br><a href="addDetails.jsp">增加明细</a></strong></font></div>

	
</body>
</html>

























