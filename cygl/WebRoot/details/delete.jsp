<%@ page language="java" import="java.sql.*,com.fit.dao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String bookId=request.getParameter("bookId");
	String vegId=request.getParameter("vegId");
	Dao dao=new Dao();
	dao.beginTransaction();
	
	dao.update("delete from details  where book_id=? and veg_id=? ",bookId,vegId);
	
	dao.commitTransaction();
	dao.close();
	
	response.sendRedirect("details.jsp");

 %>	