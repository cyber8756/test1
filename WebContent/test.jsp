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
String data_path=getServletContext().getRealPath("/data");
	String[] dir_arr={data_path+"/WebContent/cache",
			data_path+"/WebContent/editor",
			data_path+"/WebContent/file",
			data_path+"/WebContent/log",
			data_path+"/WebContent/member",
			data_path+"/WebContent/session",
			data_path+"/WebContent/content",
			data_path+"/WebContent/faq",
			data_path+"/WebContent/tmp"};
	
	
for(int i=0;i<dir_arr.length;i++){
	out.println("폴더경로명="+dir_arr[i]);
	File file = new File(dir_arr[i]);
	file.mkdirs();
	Runtime rt = Runtime.getRuntime();
	String cmd="chmod 0755" +data_path;
	Process p=rt.exec(cmd);
	p.waitFor();
}	
	
	
%>
<li>디렉토리생성완료</li>

</body>
</html>








