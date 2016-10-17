<%@ page language="java" import="java.sql.*,com.fit.dao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String bookId=request.getParameter("bookId");
	String vegId=request.getParameter("vegId");
	
	String detailsNum=request.getParameter("detailsNum");
	


	
	Dao dao=new Dao();
	dao.beginTransaction();
	
		dao.update("insert into details  values(?,?,?)",vegId,bookId,detailsNum);
	
	dao.commitTransaction();
	dao.close();
	
	response.sendRedirect("details.jsp");

 %>	
	
