package com.fit;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fit.dao.Dao;

public class CheckServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			String custid=request.getParameter("custId");
			String custpwd=request.getParameter("custPwd");
			
			
			String sql=
				"select * from custom where cust_id=? and cust_pwd=?";
			
			Dao dao=new Dao();
			dao.beginTransaction();//开始事务
			
			ResultSet rs=dao.query(sql, custid,custpwd);
			if(rs.next()){
				request.getSession().setAttribute("custId", custid);
				response.sendRedirect("home.jsp");//重定向到users.jsp
			}else{
				
				request.setAttribute("error", "用户名或密码错误！");
				request
					.getRequestDispatcher("index.jsp")
					.forward(request, response);
				//;response.sendRedirect("index.jsp");
			}
			dao.commitTransaction();//提交事务

			
			dao.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
}
