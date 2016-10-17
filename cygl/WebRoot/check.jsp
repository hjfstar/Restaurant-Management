<%@ page language="java" import="java.sql.*,com.fit.dao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 目前没有使用本页，登录验证使用的是CheckServlet --%>
<%
	String custid=request.getParameter("cust_id");
	String custpwd=request.getParameter("cust_pwd");
	
	//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");//加载JDBC驱动
	//Connection conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=mydb","sa","11fit");
	//Statement st=conn.createStatement();
	//String sql=
	//	"select * from t_user where user_id='"+userid+"' and user_pwd='"+userpwd+"'";
	String sql=
		"select * from custom  where cust_id=? and cust_pwd=?";
	
	//PreparedStatement pstmt=conn.prepareStatement(sql);
	//pstmt.setString(1,userid);
	//pstmt.setString(2,userpwd);
	
	//String sql=
	//	"select * from t_user where user_id='"+userid+"' and cust_pwd='"+userpwd+"'";
	System.out.println(sql);
	
	/*
	ResultSet rs=
		st.executeQuery(sql);
	*/
	Dao dao=new Dao();
	dao.beginTransaction();
	ResultSet rs=dao.query(sql,custid,custpwd);
		//pstmt.executeQuery();
	if(rs.next()){
		session.setAttribute("custId",custid);
		response.sendRedirect("home.jsp");//重定向到users.jsp
	}else{
		response.sendRedirect("index.jsp");
	}
	
	//rs.close();
	//st.close();
	//pstmt.close();
	//conn.close();
	dao.commitTransaction();
	dao.close();

%>