<%@page import="java.io.File"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.net.InetAddress" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
InetAddress inet = InetAddress.getLocalHost();

String svrIP = inet.getHostAddress();

out.println(svrIP);

String G5_TIME_YMDHIS=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());

out.print(G5_TIME_YMDHIS);

%>

<%
out.println("폴더생성테스트");
String data_path=getServletContext().getRealPath("/WebContent/data");
	String[] dir_arr={data_path+"/cache",
			data_path+"/editor",
			data_path+"/file",
			data_path+"/log",
			data_path+"/member",
			data_path+"/session",
			data_path+"/content",
			data_path+"/faq",
			data_path+"/tmp"};
	
	
for(int i=0;i<dir_arr.length;i++){
	out.println("폴더경로명="+dir_arr[i]);
	File file = new File(dir_arr[i]);
	boolean a=file.mkdirs();
	if(a==true) out.println("폴더생성성공");
	else out.println("폴더생성실패");
	Runtime rt = Runtime.getRuntime();
	String cmd="chmod 0755" +data_path;
	Process p=rt.exec(cmd);
	p.waitFor();
}	
	
	
%>
<li>디렉토리생성완료</li>

</body>
</html>








