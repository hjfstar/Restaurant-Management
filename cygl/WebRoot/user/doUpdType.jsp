<%@ page language="java" import="java.sql.*,com.fit.dao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String custId=request.getParameter("custId");
	String custName=request.getParameter("custName");
	String custStyle=request.getParameter("custStyle");
	String custTel=request.getParameter("custTel");
	String custPwd=request.getParameter("custPwd");
	
	Dao dao=new Dao();
	dao.beginTransaction();
	
	dao.update("update custom set cust_name=?,cust_tel=?,cust_pwd=?,cust_style=?  where cust_id=?" ,custName,custTel,custPwd,custStyle,custId);
	
	dao.commitTransaction();
	dao.close();
	
	response.sendRedirect("users.jsp");

 %>	
	
























