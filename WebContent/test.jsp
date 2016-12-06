<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="vo.ClientVO"/>
<jsp:setProperty property="*" name="vo"/>
<%
String age=request.getParameter("age");
String name=request.getParameter("name");
out.println("<h1>"+age+"</h1>");
out.println("<h1>"+name+"</h1>");

out.println("<h1>"+vo.getAge()+"</h1>");
out.println("<h1>"+vo.getName()+"</h1>");
%>