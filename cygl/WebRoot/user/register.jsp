<%@ page language="java" import="java.sql.*,com.fit.dao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String cust_id=request.getParameter("cust_id");
	String cust_name=request.getParameter("cust_name");
	String cust_pwd=request.getParameter("cust_pwd");
	String cust_tel=request.getParameter("user_tel");
	String cust_style=request.getParameter("cust_style");
	Dao dao=new Dao();
	dao.beginTransaction();
	
	dao.update("insert into custom values(?,?,?,?,?)",cust_id,cust_name,cust_pwd,cust_tel,cust_style);
	
	
	dao.commitTransaction();
	dao.close();
	
	response.sendRedirect("index.jsp");

 %>	
	
























