<%@ page language="java" import="java.sql.*,com.fit.dao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String styId=request.getParameter("styId");
	
	Dao dao=new Dao();
	dao.beginTransaction();
	
	dao.update("delete from veg_style  where sty_id=?",styId);
	
	dao.commitTransaction();
	dao.close();
	
	response.sendRedirect("types.jsp");

 %>	
	
























