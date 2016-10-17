<%@ page language="java" import="java.sql.*,com.fit.dao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String bookId=request.getParameter("bookId");
	
	Dao dao=new Dao();
	dao.beginTransaction();
	
	dao.update("delete from book  where book_id=?",bookId);
	
	dao.commitTransaction();
	dao.close();
	
	response.sendRedirect("book.jsp");

 %>	