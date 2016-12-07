<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = null; //초기화
PreparedStatement pstmt=null;
ResultSet rs=null;
	try {
		String url = "jdbc:mariadb://localhost:3306/sirgjw"; // URL, "jdbc:mysql://localhost:3306/(mySql에서 만든 DB명)" << 입력 이때 3306은 mysql기본 포트
		String id = "sirgjw"; // SQL 사용자 이름
		String pw = "8989"; // SQL 사용자 패스워드
		Class.forName("org.mariadb.jdbc.Driver"); // DB와 연동하기 위해 DriverManager에 등록한다.
		conn = DriverManager.getConnection(url, id, pw); // DriverManager 객체로부터 Connection 객체를 얻어온다.	
		
		
		out.println("연결됨"); // 커넥션이 제대로 연결되면 수행된다.
		
	 	pstmt = conn.prepareStatement("select cf_title,cf_admin,cf_admin_email from g5_config");
		rs = pstmt.executeQuery();
		
		while(rs.next()){
	 		out.println(rs.getString(1));
	 		out.println(rs.getString(2));
	 		out.println(rs.getString(3));
	 	} 
	} catch (Exception e) { // 예외 처리

		out.println("연결실패");
		e.printStackTrace();
	}
%>
