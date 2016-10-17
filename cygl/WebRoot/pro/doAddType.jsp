<%@ page language="java" import="java.sql.*,com.fit.dao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String vegId=request.getParameter("vegId");
	String vegName=request.getParameter("vegName");
	String styId=request.getParameter("styId");
	
	Dao dao=new Dao();
	dao.beginTransaction();
	
	dao.update("insert into veg values(?,?,?)",vegId,styId,vegName);
	
	dao.commitTransaction();
	dao.close();
	
	response.sendRedirect("pros.jsp");

 %>	
	
























