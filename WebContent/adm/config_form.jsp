<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnect.DBConnector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	DBConnector dbc=new DBConnector();
 	
 	ResultSet rs=dbc.select("select cf_title,cf_admin,cf_admin_email from g5_config");
 	
 	String cf_title=null;
 	String cf_admin=null;
 	String cf_admin_email=null;
 	
 	while(rs.next()){
 		cf_title=rs.getString(1);
 		cf_admin=rs.getString(2);
 		cf_admin_email=rs.getString(3);
 	}
 
 %> 
    
<%!String sub_menu="100100";%>
<%!String pg_anchor="<ul class=\"anchor\">"+
"<li><a href=\"#anc_cf_basic\">기본환경</a></li>"+
"<li><a href=\"#anc_cf_board\">게시판기본</a></li>"+
"<li><a href=\"#anc_cf_join\">회원가입</a></li>"+
"<li><a href=\"#anc_cf_cert\">본인확인</a></li>"+
"<li><a href=\"#anc_cf_mail\">기본메일환경</a></li>"+
"<li><a href=\"#anc_cf_article_mail\">글작성메일</a></li>"+
"<li><a href=\"#anc_cf_join_mail\">가입메일</a></li>"+
"<li><a href=\"#anc_cf_vote_mail\">투표메일</a></li>"+
"<li><a href=\"#anc_cf_sns\">SNS</a></li>"+
"<li><a href=\"#anc_cf_lay\">레이아웃 추가설정</a></li>"+
"<li><a href=\"#anc_cf_sms\">SMS</a></li>"+
"<li><a href=\"#anc_cf_extra\">여분필드</a></li>"+
"</ul>";%>

<!--auth_check($auth[$sub_menu],"r");  -->

<!-- 최고관리자만 접근가능 기능  -->

<form name="fconfigform" id="fconfigform" method="post" onsubmit="return fconfigform_submit(this);">
<input type="hidden" name="token" value="" id="token">

<section id="anc_cf_basic">
    <h2 class="h2_frm">홈페이지 기본 환경설정</h2>
    <%=pg_anchor%>
    <div class="tbl_frm01 tbl_wrap">
    	<table>
    	<caption>홈페이지 기본 환경 설정</caption>
    	<colgroup>
    		<col class="grid_4">
    		<col>
    		<col class="grid_4">
    		<col>
    	</colgroup>    	   
    	
    	<tbody>
    	<tr>
    		<th scope="row"><label for="cf_title">홈페이지 제목<strong class="sound_only">필수</strong></label></th>
    		<td colspan="3"><input type="text" name="cf_title" value="<%=cf_title %>" id="cf_title" 
    		required class="required frm_input" size="40"></td> 
    	</tbody>
    	
    	<tr>
    		<th scope="row"><label for="cf_admin">최고관리자<Strong class="sound_only">필수</Strong></label></th>
    		<td colspan="3">"<%=cf_admin%></td>
    	</tr>
    	
    	<tr>
    		<th scope="row"><label for="cf_admin_email">관리자 메일 주소<strong class="sound_only">필수</strong></label></th>
    		<td colspan="3">
    		관리자가 보내고 받는 용도로 사용하는 메일 주소를 입력합니다. (회원가입, 인증메일, 테스트, 회원메일발송 등에서 사용)'
    		<input type="text" name="cf_admin_email" value="<%=cf_admin_email %>" id="cf_admin_email" required class="required email frm_input" size="40"> 
    		</td> 
    	</tr>
    		 	
    	
    	</table> 
    </div>    
</section>

</form>