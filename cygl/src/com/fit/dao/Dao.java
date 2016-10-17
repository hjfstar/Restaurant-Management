package com.fit.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * �������ݿ�Ĺ�����
 * @author �Ķ���  �� 2012-1-1 
 *
 */
public class Dao {
	
	private static String DRIVER=//"oracle.jdbc.OracleDriver";
							//"com.mysql.jdbc.Driver";
			"com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String URL=//"jdbc:oracle:thin:@localhost:1521:orcl";
							//"jdbc:mysql://localhost:3306/mydb";
		"jdbc:sqlserver://localhost:1433;databaseName=cygl";
	private static String USER="sa";//"tsgl";//"root";
	private static String PASSWORD="11fit";//"tsgl";//"root";//���ݿ���������
	
	//��ǰ�߳������ݿ�����
	private static ThreadLocal<Connection> threadLocalConnection=new ThreadLocal<Connection>();
	//��ǰ�߳��Ƿ�������
	private static ThreadLocal<Boolean> threadLocalTransaction=new ThreadLocal<Boolean>();
	
	static{
		
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {			
			e.printStackTrace();
			System.out.println("û���ҵ���������");
		}	
	}
	
	private boolean isTransaction(){
		if(threadLocalTransaction.get()==null){
			threadLocalTransaction.set(false);
		}
		return threadLocalTransaction.get();
	}
	private void setTransaction(boolean transaction){
		
		threadLocalTransaction.set(transaction);
		
	}
	
	//Ԥ���������󼯺ϻ���
	private Set<PreparedStatement> pstmts=new HashSet<PreparedStatement>();;
	//��ǰԤ����������
	private PreparedStatement pstmt;
	//��������󼯺ϻ���
	private Set<ResultSet> rss=new HashSet<ResultSet>();
	
	
	private String array2String(Object... params){
		
		StringBuffer buffer=new StringBuffer("{");
		if(params!=null){
			for(int i=0;i<params.length;i++){
				if(i==0)buffer.append("["+params[i]+"]");
				else buffer.append(","+"["+params[i]+"]");
			}
		}
		buffer.append("}");
		
		return buffer.toString();
		
	}
	
	private void preWork(PreparedStatement pst,Object... params) throws SQLException{
		
		if(params!=null){			
			for(int i=0;i<params.length;i++){				
				if(params[i] instanceof java.util.Date){
					long time=((java.util.Date)params[i]).getTime();
					pst.setTimestamp(i+1, new java.sql.Timestamp(time));
				}else{				
					pst.setObject(i+1, params[i]);
				}
			}
		}
	}	
	
	private void preWork(String sql,Object... params) throws SQLException{
		
		pstmt = getConnection().prepareStatement(sql);	
		pstmts.add(pstmt);
		this.preWork(pstmt, params);
		
	}
	
	/**
	 * �ر���Դ
	 */
	public void close(){
		
		if(isTransaction()){
			System.out.println("��Դ�رչ����лع�δ�ύ����");
			this.rollback();
		}
		
		for(ResultSet rs:rss){				
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
			}
		}
		rss.clear();
		for(PreparedStatement pstmt:pstmts){
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
			}
		}
		pstmts.clear();
		try {
			if (threadLocalConnection.get()!= null)
				if (!threadLocalConnection.get().isClosed())
					threadLocalConnection.get().close();
		} catch (Exception e) {}
		threadLocalConnection.set(null);
	}
	
	/**
	 * ִ�в�ѯ���
	 * @param sql
	 * @param params
	 * @return
	 * @throws SQLException
	 */
	public ResultSet query(String sql,Object... params) throws SQLException{
		if(!isTransaction()){
			this.close();
			throw new RuntimeException("δ��������");				
		}
		System.out.println("��ѯsql:"+sql);
		System.out.println("sql����:"+this.array2String(params));
		try {
			this.preWork(sql, params);		
			ResultSet rs = pstmt.executeQuery();
			rss.add(rs);			
			return rs;
		} catch (SQLException e) {			
			e.printStackTrace();
			this.rollback();
			throw e;
		}catch (RuntimeException e) {			
			e.printStackTrace();
			this.rollback();
			throw e;
		}
		
	}
	
	/**
	 * ִ�и������
	 * @param sql
	 * @param params
	 * @return
	 * @throws SQLException
	 */
	public Dao update(String sql,Object... params) throws SQLException{
		if(!isTransaction()){
			this.close();
			throw new RuntimeException("δ��������");				
		}
		System.out.println("����sql:"+sql);
		System.out.println("sql����:"+this.array2String(params));
		try {
			this.preWork(sql, params);
			pstmt.executeUpdate();
			return this;
		}catch (SQLException e) {			
			e.printStackTrace();
			this.rollback();
			throw e;
		}catch (RuntimeException e) {			
			e.printStackTrace();
			this.rollback();
			throw e;
		}
		
	}

	/**
	 * ��ȡԤ����sql����
	 * @param sql
	 * @return
	 * @throws SQLException
	 */
	public PreSQL createPreSQL(String sql) throws SQLException {
		
		if(!isTransaction()){
			close();
			throw new RuntimeException("δ��������");				
		}
		
		
		
		class PreSqlImpl implements PreSQL{
			private String sql;
			private PreparedStatement pst;
			
			private PreSqlImpl(String sql) throws SQLException{	
				this.sql=sql;
				this.pst=getConnection().prepareStatement(sql);
				pstmts.add(pst);	
			}
			
			
			public PreSQL update(Object... params) throws SQLException {
				System.out.println("����sql:"+sql);
				System.out.println("sql����:"+array2String(params));
				try {
					preWork(pst, params);
					pst.executeUpdate();
					pst.clearParameters();
					return this;
				}catch (SQLException e) {			
					e.printStackTrace();
					rollback();
					throw e;
				}catch (RuntimeException e) {			
					e.printStackTrace();
					rollback();
					throw e;
				}				
			}

			
			public ResultSet query(Object... params) throws SQLException {
				System.out.println("��ѯsql:"+sql);
				System.out.println("sql����:"+array2String(params));
				try {
					preWork(pst, params);
					ResultSet rs=pst.executeQuery();
					rss.add(rs);
					pst.clearParameters();
					return rs;
				}catch (SQLException e) {			
					e.printStackTrace();
					rollback();
					throw e;
				}catch (RuntimeException e) {			
					e.printStackTrace();
					rollback();
					throw e;
				}
				
			}			
			
			
		}
		
		
		try {				
			return new PreSqlImpl(sql);
		}catch (SQLException e) {			
			e.printStackTrace();
			rollback();
			throw e;
		}catch (RuntimeException e) {			
			e.printStackTrace();
			rollback();
			throw e;
		}
		
		
	}
	
	private static Connection getConnection() throws SQLException{
		Connection conn=threadLocalConnection.get();
		if(conn==null){			
			conn = DriverManager.getConnection(
					URL,USER,PASSWORD);
			conn.setAutoCommit(false);
			threadLocalConnection.set(conn);			
		}
		return conn;
	}
	
	
	/**
	 * ��������
	 * @return
	 * @throws SQLException
	 */
	public Dao beginTransaction() throws SQLException{
		if(isTransaction()){
			this.rollback();
			throw new RuntimeException("�����ѿ�������δ�������������ظ���������");			
		}
		getConnection();
		this.setTransaction(true);	
		System.out.println("---��ʼ����---");
		return this;
	}	
	
	/**
	 * �ύ����
	 * @return
	 */
	public Dao commitTransaction(){
		if(!isTransaction()){
			throw new RuntimeException("δ��������");
		}
		try {
			getConnection().commit();
			this.setTransaction(false);
			System.out.println("---�����ύ---");			
		} catch (SQLException e) {
			e.printStackTrace();
			this.rollback();
		}
		
		return this;
	}
	
	private void rollback(){
		try{
			if(!isTransaction()){
				throw new RuntimeException("δ��������");
			}
			try{
				getConnection().rollback();
				System.out.println("---����ع�---");			
			}catch(SQLException e){
				e.printStackTrace();
				System.out.println("����ع��쳣��ԭ��" +e.getMessage());
			}
		}finally{
			this.setTransaction(false);
		}
	}
	
	/**
	 * ��ʼ��
	 * @param url
	 * @param user
	 * @param password
	 */
	static void init(String url, String user, String password) {
		URL=url;
		USER=user;
		PASSWORD=password;		
	}
	
	/**
	 * ���Դ���
	 * @param args
	 * @throws SQLException
	 */
	public static void main(String[] args) throws SQLException{
		Dao dao=new Dao();		
		try {
			//dao.commitTransaction();
			dao.beginTransaction();
			dao.beginTransaction();
			//dao.update("delete from t_user2");
			
			//dao.update("insert into t_user2 values('ddd5','ddd5') ");
			
			/*PreSQL presql=dao.createPreSQL("select * from t_user2 where user_id like ?");
			ResultSet rs=presql.query("%%");
			while(rs.next()){
				System.out.println(rs.getString(1));
			}*/
			
			//dao.update("insert into t_user2 values('xxx5','xxx5') ");
			
			/*rs=presql.query();
			while(rs.next()){
				System.out.println(rs.getString(1));
			}*/
			dao.update("delete from t_user2 where user_id like '2%' or user_id like '3%' or user_id like '4%'");
			PreSQL presql2=dao.createPreSQL("insert into t_user2 values(?,?)");
			for(int i=201;i<=400;i++)
				presql2.update(i+"",i+"");
			
			
			dao.commitTransaction();
		}finally{
			dao.close();
		}
	}

	

}
