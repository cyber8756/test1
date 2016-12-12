<%@page import="java.io.File"%>
<%@page import="lib.FileLib"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnect.DBConnector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");

FileLib filelib= new FileLib();
%>    
    
<%
	
	String mysql_host=request.getParameter("mysql_host");
	String mysql_user=request.getParameter("mysql_user");
	String mysql_pass=request.getParameter("mysql_pass");
	String mysql_db=request.getParameter("mysql_db");
	String table_prefix=request.getParameter("table_prefix");
	String admin_id=request.getParameter("admin_id");
	String admin_pass=request.getParameter("admin_pass");
	String admin_name=request.getParameter("admin_name");
	String admin_email=request.getParameter("admin_email");
	
	String[] g5_install={"0"};
	if(request.getParameterValues("g5_install")!=null){
		g5_install=request.getParameterValues("g5_install");
	}
	
	
	String g5_shop_prefix=request.getParameter("g5_shop_prefix");
	
	String[] g5_shop_install={"0"};
	if(request.getParameter("g5_shop_install")!=null){
		g5_shop_install=request.getParameterValues("g5_shop_install");
	}
	
	
	
%>

<div class="ins_inner">
    <p>MySQL Host, User, Password 를 확인해 주십시오.</p>
    <div class="inner_btn"><a href="./install_config.jsp">뒤로가기</a></div>
</div>




<%
    
String mysql_set_mode = "false";
String result=null;
//캐릭터셋이 안맞으면 아래줄 url 을 디비 url로 사용
//String url = "jdbc:mysql://localhost/hoho?useUnicode=true&characterEncoding=utf8";

DBConnector dbc =DBConnector.getInstance();
//sql_set_charset('utf',$dblink)
ResultSet rs=dbc.select("SELECT @@sql_mode as mode");
rs.next();
result=rs.getString("mode");

System.out.println(result);
 
if(result!=null) {
    dbc.set("SET SESSION sql_mode = ''");
    mysql_set_mode = "true";
}
rs=null;
result=null;

%>

<div class="ins_inner">
    <h2><?php echo G5_VERSION ?> 설치가 시작되었습니다.</h2>

<ol>

<%

/* rs=dbc.select("desc "+table_prefix+"config");
rs.next(); 
result=rs.getString(1);
System.out.println(result);

 */
 
 
 
 
 //그누보드5 재설치에 체크했거나 그누보드5가 설치되어 있지 않다면 테이블생성
 if(g5_install[0].equals("1") || result==null){
	 String sql=filelib.getFileContent(new File(getServletContext().getRealPath("/install/gnuboard5.sql")));
	 sql=sql.replace("/^--.*$/m", "");
	 sql=sql.replace("/`g5_([^`]+`)/","'"+table_prefix+sql);
	 String s[]=sql.split(";");
	 for(int i=0;i<s.length;i++){
		 if(s[i].trim()==null||s[i].trim().length()==0) 
			 continue;
		 dbc.select(s[i]);
		 
		 System.out.println(s[i]);
	 }
	 System.out.println("그누보드5 설치끝");
 }
 

 //쇼핑몰 테이블 생성
 if(g5_shop_install[0].equals("1")){
	 System.out.println("쇼핑몰설치 시작");
	String sql=filelib.getFileContent(new File(getServletContext().getRealPath("/install/gnuboard5shop.sql")));
	sql=sql.replace("/^--.*$/m", "");	 
	sql=sql.replace("/`g5_shop_([^`]+`)/","'"+g5_shop_prefix+sql);
 	String s[]=sql.split(";");
 	
 	for(int i=0;i<s.length;i++){
 		if(s[i].trim()==null || s[i].trim().length()==0) 
 			continue;
 		dbc.select(s[i]);
 		 System.out.println(s[i]);
 	}
 	
 	System.out.println("쇼핑몰설치 끝");
}
%>

<li>전체 테이블 생성 완료</li>


<% 
//config테이블 설정


%>








