<%@ page language="java" import="java.sql.*,com.fit.dao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String styId=request.getParameter("styId");
	String styName=request.getParameter("styName");
	String styUrl=request.getParameter("styUrl");
	
	Dao dao=new Dao();
	dao.beginTransaction();
	
	dao.update("insert into veg_style values(?,?,?)",styId,styName,styUrl);
	
	dao.commitTransaction();
	dao.close();
	
	response.sendRedirect("types.jsp");

 %>	
	
























