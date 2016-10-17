<%@ page language="java"  import="java.sql.*,com.fit.dao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	String custId=(String)session.getAttribute("custId");
	String old=request.getParameter("old");
	String newpwd=request.getParameter("new");
	String renew=request.getParameter("renew");
	
	Dao dao=new Dao();
	dao.beginTransaction();
	
	String sql="select * from custom where cust_id=? and cust_pwd=?";
	if(!dao.query(sql,custId,old).next()){
		request.setAttribute("err","原密码不正确！");
		request.getRequestDispatcher("updPwd.jsp").forward(request,response);
	}else{
	     
	    request.setAttribute("err","原密码不正确！");
		//....
		
		
		sql="update custom set cust_pwd=? where cust_id=?";
		dao.update(sql,newpwd,custId);
		
		out.println("<script>alert('修改成功！请重登陆。');top.location='../index.jsp';</script>");
	
	
	}
	
	
	
	dao.commitTransaction();
	dao.close();





%>
