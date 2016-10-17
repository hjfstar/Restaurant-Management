<%@ page language="java" import="java.sql.*,com.fit.dao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String vegId=request.getParameter("vegId");
	
	Dao dao=new Dao();
	dao.beginTransaction();
	
	dao.update("delete from veg  where veg_id=?",vegId);
	
	dao.commitTransaction();
	dao.close();
	
	response.sendRedirect("pros.jsp");

 %>	
	
























