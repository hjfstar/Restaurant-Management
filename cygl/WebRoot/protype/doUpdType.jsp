<%@ page language="java" import="java.sql.*,com.fit.dao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String styId=request.getParameter("styId");
	String styName=request.getParameter("styName");
	
	Dao dao=new Dao();
	dao.beginTransaction();
	
	dao.update("update veg_style set sty_name=? where sty_id=?" ,styName,styId);
	
	dao.commitTransaction();
	dao.close();
	
	response.sendRedirect("types.jsp");

 %>	
	
























