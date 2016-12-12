<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnect.DBConnector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>	

<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");


	DBConnector dbc=DBConnector.getInstance(); 	
 	ResultSet rs=dbc.select("select * from g5_config");
 	
 	String G5_URL="abc";
 	
 	String cf_title=null;
 	String cf_admin=null;
 	String cf_admin_email=null;
 	String cf_admin_email_name=null;
 	int cf_use_point=0;
 	int cf_login_point=0;
 	int cf_memo_send_point=0;
 	int cf_cut_name=0;
 	int cf_nick_modify=0;
 	int cf_open_modify=0;
 	int cf_new_del=0;
 	int cf_memo_del=0;
 	int cf_visit_del=0;
 	int cf_popular_del=0;
 	int cf_login_minutes=0;
 	int cf_new_rows=0;
 	int cf_page_rows=0;
 	int cf_mobile_page_rows=0;
 	int cf_write_pages=0;
 	int cf_mobile_pages=0;
 	int cf_use_copy_log=0;
 	int cf_point_term=0;
 	String cf_possible_ip=null;
 	String cf_intercept_ip=null;
 	String cf_analytics=null;
 	String cf_add_meta=null;
 	String cf_syndi_token=null;
 	String cf_syndi_except=null;
 	int cf_delay_sec=0;
 	int cf_read_point=0;
 	int cf_write_point=0;
 	int cf_comment_point=0;
 	int cf_download_point=0;
 	int cf_search_part=0;
 	String cf_image_extension=null;
 	String cf_flash_extension=null;
 	String cf_movie_extension=null;
 	String cf_filter=null;
 	int cf_use_homepage=0;
 	int cf_req_homepage=0;
 	int cf_use_tel=0;
 	int cf_use_hp=0;
 	int cf_use_addr=0;
 	int cf_req_addr=0;
 	int cf_use_signature=0;
 	int cf_req_signature=0;
 	int cf_register_point=0;
 	int cf_leave_day=0;
 	int cf_member_icon_size=0;
 	int cf_member_icon_width=0;
 	int cf_member_icon_height=0;
 	int cf_use_reommend=0;
 	int cf_recommend_point=0;
 	String cf_prohibit_id=null;
 	String cf_prohibit_email=null;
 	String cf_stipulation=null;
 	String cf_privacy=null;
 	int cf_cert_use=0;
 	String cf_cert_kcb_cd=null;
 	String cf_cert_kcp_cd=null;
 	String cf_lg_mid=null;
 	String cf_lg_mert_key=null;
 	int cf_cert_limit=0;
 	int cf_cert_req=0;
 	int cf_email_use=0;
 	int cf_use_email_certify=0;
 	int cf_formmail_is_member=0;
 	int cf_email_wr_super_admin=0;
 	int cf_email_wr_group_admin=0;
 	int cf_email_wr_board_admin=0;
 	int cf_email_wr_write=0;
 	int cf_email_wr_comment_all=0;
 	int cf_email_mb_super_admin=0;
 	int cf_email_mb_member=0;
 	int cf_email_po_super_admin=0;
 	String cf_facebook_appid=null;
 	String cf_facebook_secret=null;
 	String cf_twitter_key=null;
 	String cf_twitter_secret=null;
 	String cf_googl_shorturl_apikey=null;
 	String cf_kakao_js_apikey=null;
 	String cf_add_script=null;
 	String cf_icode_id=null;
 	String cf_icode_pw=null;
 	String cf_icode_server_ip=null;
 	
 	while(rs.next()){
 		cf_title=rs.getString("cf_title");
 		cf_admin=rs.getString("cf_admin");
 		cf_admin_email=rs.getString("cf_admin_email");
 		cf_admin_email_name=rs.getString("cf_admin_email_name");
 		cf_use_point=rs.getInt("cf_use_point");
 		cf_login_point=rs.getInt("cf_login_point");
 		cf_memo_send_point=rs.getInt("cf_memo_send_point");
 		cf_cut_name=rs.getInt("cf_cut_name");
 		cf_nick_modify=rs.getInt("cf_nick_modify");
 		cf_open_modify=rs.getInt("cf_open_modify");
 		cf_new_del=rs.getInt("cf_new_del");
 		cf_memo_del=rs.getInt("cf_memo_del");
 		cf_visit_del=rs.getInt("cf_visit_del");
 		cf_popular_del=rs.getInt("cf_popular_del");
 		cf_login_minutes=rs.getInt("cf_login_minutes");
 		cf_new_rows=rs.getInt("cf_new_rows");
 		cf_page_rows=rs.getInt("cf_page_rows");
 		cf_mobile_page_rows=rs.getInt("cf_mobile_page_rows");
 		cf_write_pages=rs.getInt("cf_write_pages");
 		cf_mobile_pages=rs.getInt("cf_mobile_pages");
 		cf_use_copy_log=rs.getInt("cf_use_copy_log");
 		cf_point_term=rs.getInt("cf_point_term");
 		cf_possible_ip=rs.getString("cf_possible_ip");
 		cf_intercept_ip=rs.getString("cf_intercept_ip");
 		cf_analytics=rs.getString("cf_analytics");
 		cf_add_meta=rs.getString("cf_add_meta");
 		cf_syndi_token=rs.getString("cf_syndi_token");
 		cf_syndi_except=rs.getString("cf_syndi_except");
 		cf_delay_sec=rs.getInt("cf_delay_sec");
 		cf_read_point=rs.getInt("cf_read_point");
 		cf_write_point=rs.getInt("cf_write_point");
 		cf_comment_point=rs.getInt("cf_comment_point");
 		cf_download_point=rs.getInt("cf_download_point");
 		cf_search_part=rs.getInt("cf_search_part");
 		cf_image_extension=rs.getString("cf_image_extension");
 		cf_flash_extension=rs.getString("cf_flash_extension");
 		cf_movie_extension=rs.getString("cf_movie_extension");
 		cf_filter=rs.getString("cf_filter");
 		cf_use_homepage=rs.getInt("cf_use_homepage");
 		cf_req_homepage=rs.getInt("cf_req_homepage");
 		cf_use_tel=rs.getInt("cf_use_tel");
 		cf_use_hp=rs.getInt("cf_use_hp");
 		cf_use_addr=rs.getInt("cf_use_addr");
 		cf_req_addr=rs.getInt("cf_req_addr");
 		cf_use_signature=rs.getInt("cf_use_signature");
 		cf_req_signature=rs.getInt("cf_req_signature");
 		cf_register_point=rs.getInt("cf_register_point");
 		cf_leave_day=rs.getInt("cf_leave_day");
 		cf_member_icon_size=rs.getInt("cf_member_icon_size");
 		cf_member_icon_width=rs.getInt("cf_member_icon_width");
 		cf_member_icon_height=rs.getInt("cf_member_icon_height");
 		cf_use_reommend=rs.getInt("cf_use_recommend");
 		cf_recommend_point=rs.getInt("cf_recommend_point");
 		cf_prohibit_id=rs.getString("cf_prohibit_id");
 		cf_prohibit_email=rs.getString("cf_prohibit_email");
 		cf_stipulation=rs.getString("cf_stipulation");
 		cf_privacy=rs.getString("cf_privacy");
 		cf_cert_use=rs.getInt("cf_cert_use");
 		cf_cert_kcb_cd=rs.getString("cf_cert_kcb_cd");
 		cf_cert_kcp_cd=rs.getString("cf_cert_kcp_cd");
 		cf_lg_mid=rs.getString("cf_lg_mid");
 		cf_lg_mert_key=rs.getString("cf_lg_mert_key");
 		cf_cert_limit=rs.getInt("cf_cert_limit");
 		cf_cert_req=rs.getInt("cf_cert_req");
 		cf_email_use=rs.getInt("cf_email_use");
 		cf_use_email_certify=rs.getInt("cf_use_email_certify");
 		cf_formmail_is_member=rs.getInt("cf_formmail_is_member");
 		cf_email_wr_super_admin=rs.getInt("cf_email_wr_super_admin");
 		cf_email_wr_group_admin=rs.getInt("cf_email_wr_group_admin");
 		cf_email_wr_board_admin=rs.getInt("cf_email_wr_board_admin");
 		cf_email_wr_write=rs.getInt("cf_email_wr_write");
 		cf_email_wr_comment_all=rs.getInt("cf_email_wr_comment_all");
 		cf_email_mb_member=rs.getInt("cf_email_mb_member");
 		cf_email_po_super_admin=rs.getInt("cf_email_po_super_admin");
 		cf_facebook_appid=rs.getString("cf_facebook_appid");
 		cf_facebook_secret=rs.getString("cf_facebook_secret");
 		cf_twitter_key=rs.getString("cf_twitter_key");
 		cf_twitter_secret=rs.getString("cf_twitter_secret");
 		cf_googl_shorturl_apikey=rs.getString("cf_googl_shorturl_apikey");
 		cf_kakao_js_apikey=rs.getString("cf_kakao_js_apikey");
 		cf_add_script=rs.getString("cf_add_script");
 		cf_icode_id=rs.getString("cf_icode_id");
 		cf_icode_pw=rs.getString("cf_icode_pw");
 		cf_icode_server_ip=rs.getString("cf_icode_server_ip");
 		
 		
 	}
 	
 	
 	
 
%>
 
<link rel="stylesheet" type="text/css" href="css/admin.css">

<%!
public String help(String str){
	str="<span class=\"frm_info\">" + str.replace("\n", "<br>")+"</span>";
	return str;
}
%>
 
<%
String frm_submit = "<div class=\"btn_confirm01 btn_confirm\">"+
"<input type=\"submit\" value=\"확인\" class=\"btn_submit\" accesskey=\"s\">"+
"<a href=\"" + G5_URL +"/\">"+"메인으로</a>" +
"</div>";
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
<form name="fconfigform" id="fconfigform" method="post"
	onsubmit="return fconfigform_submit(this);">
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
						<th scope="row"><label for="cf_title">홈페이지 제목<strong
								class="sound_only">필수</strong></label></th>
						<td colspan="3"><input type="text" name="cf_title"
							value="<%=cf_title %>" id="cf_title" required
							class="required frm_input" size="40"></td>
				</tbody>

				<tr>
					<th scope="row"><label for="cf_admin">최고관리자<Strong
							class="sound_only">필수</Strong></label></th>
					<td colspan="3"><input type="text" name="cf_admin" value="<%=cf_admin%>"/></td>
				</tr>

				<tr>
					<th scope="row"><label for="cf_admin_email">관리자 메일 주소<strong
							class="sound_only">필수</strong></label></th>
					<td colspan="3"><%=help("관리자가 보내고 받는 용도로 사용하는 메일 주소를 입력합니다. (회원가입,인증메일, 테스트, 회원메일발송 등에서 사용") %>
					<input type="text"
						name="cf_admin_email" value="<%=cf_admin_email %>"
						id="cf_admin_email" required class="required email frm_input"
						size="40">
					</td>
				</tr>

				<tr>
					<th scope="row"><label for="cf_admin_email_name">관리자
							메일 발송이름<strong class="sound_only">필수</strong>
					</label></th>
					<td colspan="3"><%=help("관리자가 보내고 받는 용도로 사용하는 메일의 발송이름을 입력합니다. (회원가입,인증메일, 테스트, 회원메일발송 등에서 사용)") %>
					 <input type="text"
						name="cf_admin_email_name" value="<%=cf_admin_email_name %>"
						id="cf_admin_email_name" required class="required frm_input"
						size="40">
					</td>
				</tr>

				<tr>
					<th scope="row"><label for="cf_use_point">포인트 사용</label></th>
					<td colspan="3"><input type="checkbox" name="cf_use_point"
						value="1" id="cf_use_point"
						<%if(cf_use_point==1) out.print("checked"); %>> 사용</td>
				</tr>


				<tr>
					<th scope="row"><label for="cf_login_point">로그인시 포인트<strong
							class="sound_only">필수</strong></label></th>
					<td><%=help("회원이 로그인시 하루에 한번만 적립") %> <input type="text"
						name="cf_login_point" value="<%=cf_login_point%>"
						id="cf_login_point" required class="required frm_input" size="5">
						점
					</td>
					<th scope="row"><label for="cf_memo_send_point">쪽지보낼시
							차감 포인트<strong class="sound_only">필수</strong>
					</label></th>
					<td>
						<%=help("양수로 입력하십시오. 0점은 쪽지 보낼시 포인트를 차감하지 않습니다.") %> 
						<input type="text" name="cf_memo_send_point"
						value="<%=cf_memo_send_point%>" id="cf_memo_send_point" required
						class="required frm_input" size="5"> 점
					</td>
				</tr>

				<tr>
					<th scope="row"><label for="cf_cut_name">이름(닉네임) 표시</label></th>
					<td colspan="3"><input type="text" name="cf_cut_name"
						value="<%=cf_cut_name %>" id="cf_cut_name" class="frm_input"
						size="5"> 자리만 표시</td>
				</tr>


				<tr>
					<th scope="row"><label for="cf_nick_modify">닉네임 수정</label></th>
					<td>수정하면 <input type="text" name="cf_nick_modify"
						value="<%=cf_nick_modify%>" id="cf_nick_modify" class="frm_input"
						size="3"> 일 동안 바꿀 수 없음
					</td>
					<th scope="row"><label for="cf_open_modify">정보공개 수정</label></th>
					<td>수정하면 <input type="text" name="cf_open_modify"
						value="<%=cf_open_modify%>" id="cf_open_modify" class="frm_input"
						size="3"> 일 동안 바꿀 수 없음
					</td>
				</tr>

				<tr>
					<th scope="row"><label for="cf_new_del">최근게시물 삭제</label></th>
					<td><%=help("설정일이 지난 최근게시물 자동 삭제") %> <input type="text" name="cf_new_del"
						value="<%=cf_new_del%>" id="cf_new_del" class="frm_input" size="5">
						일
					</td>
					<th scope="row"><label for="cf_memo_del">쪽지 삭제</label></th>
					<td><%=help("설정일이 지난 쪽지 자동 삭제") %> <input type="text"
						name="cf_memo_del" value="<%=cf_memo_del%>" id="cf_memo_del"
						class="frm_input" size="5"> 일
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="cf_visit_del">접속자로그 삭제</label></th>
					<td><%=help("설정일이 지난 접속자 로그 자동 삭제") %> <input type="text"
						name="cf_visit_del" value="<%= cf_visit_del%>" id="cf_visit_del"
						class="frm_input" size="5"> 일
					</td>
					<th scope="row"><label for="cf_popular_del">인기검색어 삭제</label></th>
					<td><%=help("설정일이 지난 인기검색어 자동 삭제") %> <input type="text"
						name="cf_popular_del" value="<%=cf_popular_del%>"
						id="cf_popular_del" class="frm_input" size="5"> 일
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="cf_login_minutes">현재 접속자</label></th>
					<td><%=help("설정값 이내의 접속자를 현재 접속자로 인정") %> <input type="text"
						name="cf_login_minutes" value="<%=cf_login_minutes %>"
						id="cf_login_minutes" class="frm_input" size="3"> 분
					</td>
					<th scope="row"><label for="cf_new_rows">최근게시물 라인수</label></th>
					<td><%=help("목록 한페이지당 라인수")%> <input type="text" name="cf_new_rows"
						value="<%=cf_new_rows%>" id="cf_new_rows" class="frm_input"
						size="3"> 라인
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="cf_page_rows">한페이지당 라인수</label></th>
					<td>목록(리스트) 한페이지당 라인수<br /> <input type="text"
						name="cf_page_rows" value="<%=cf_page_rows%>" id="cf_page_rows"
						class="frm_input" size="3">라인
					</td>
					<th scope="row"><label for="cf_mobile_page_rows">
					<%=help("모바일한페이지당 라인수")%></label></th>
					<td>모바일 목록 한페이지당 라인수<br /> <input type="text"
						name="cf_mobile_page_rows" value="<%=cf_mobile_page_rows%>"
						id="cf_mobile_page_rows" class="frm_input" size="3"> 라인
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="cf_write_pages">페이지 표시 수<strong
							class="sound_only">필수</strong></label></th>
					<td><input type="text" name="cf_write_pages"
						value="<%=cf_write_pages %>" id="cf_write_pages" required
						class="required numeric frm_input" size="3"> 페이지씩 표시</td>
					<th scope="row"><label for="cf_mobile_pages">모바일 페이지
							표시 수<strong class="sound_only">필수</strong>
					</label></th>
					<td><input type="text" name="cf_mobile_pages"
						value="<%=cf_mobile_pages%>" id="cf_mobile_pages" required
						class="required numeric frm_input" size="3"> 페이지씩 표시</td>
				</tr>


				<tr>
					<th scope="row"><label for="cf_new_skin">최근게시물 스킨<strong
							class="sound_only">필수</strong></label></th>
					<td>
						
					</td>
					<th scope="row"><label for="cf_mobile_new_skin">모바일<br>최근게시물
							스킨<strong class="sound_only">필수</strong></label></th>
					<td>
						
					</td>
				</tr>

				<tr>
					<th scope="row"><label for="cf_search_skin">검색 스킨<strong
							class="sound_only">필수</strong></label></th>
					<td>
						
					</td>
					<th scope="row"><label for="cf_mobile_search_skin">모바일
							검색 스킨<strong class="sound_only">필수</strong>
					</label></th>
					<td>
						
					</td>
				</tr>


				<tr>
					<th scope="row"><label for="cf_connect_skin">접속자 스킨<strong
							class="sound_only">필수</strong></label></th>
					<td>
						
					</td>
					<th scope="row"><label for="cf_mobile_connect_skin">모바일
							접속자 스킨<strong class="sound_only">필수</strong>
					</label></th>
					<td>
						
					</td>
				</tr>

				<tr>
					<th scope="row"><label for="cf_faq_skin">FAQ 스킨<strong
							class="sound_only">필수</strong></label></th>
					<td>
						
					</td>
					<th scope="row"><label for="cf_mobile_faq_skin">모바일
							FAQ 스킨<strong class="sound_only">필수</strong>
					</label></th>
					<td>
						
					</td>
				</tr>

				<tr>
					<th scope="row"><label for="cf_editor">에디터 선택</label></th>
					<td colspan="3">
						<%=help("G5_EDITOR_URL. 밑의 DHTML 에디터 폴더를 선택합니다.") %>
						 <select name="cf_editor" id="cf_editor"></select>
					</td>
				</tr>

				<tr>
					<th scope="row"><label for="cf_captcha_mp3">음성캡챠 선택<strong
							class="sound_only">필수</strong></label></th>
					<td colspan="3">
						<%=help("G5_CAPTCHA_URL/mp3 밑의 음성 폴더를 선택합니다.") %> <select
						name="cf_captcha_mp3" id="cf_captcha_mp3" 
						class="required">
							
					</select>
					</td>
				</tr>

				<tr>
					<th scope="row"><label for="cf_use_copy_log">복사, 이동시
							로그</label></th>
					<td colspan="3">
						<%=help("게시물 아래에 누구로 부터 복사, 이동됨 표시") %>
						 <input type="checkbox" name="cf_use_copy_log" value="1" id="cf_use_copy_log"
						  <%if(cf_use_copy_log==1) out.print("checked"); %> >						  
						 남김
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="cf_point_term">포인트 유효기간</label></th>
					<td colspan="3">
						<%=help("기간을 0으로 설정시 포인트 유효기간이 적용되지 않습니다.") %> <input
						type="text" name="cf_point_term"
						value="<%=cf_point_term%>" id="cf_point_term"
						required class="required frm_input" size="5"> 일
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="cf_possible_ip">접근가능 IP</label></th>
					<td>
						<%=help("입력된 IP의 컴퓨터만 접근할 수 있습니다.<br>123.123.+ 도 입력 가능. (엔터로 구분)") %>
						<textarea name="cf_possible_ip" id="cf_possible_ip"><%=cf_possible_ip%></textarea>
					</td>
					<th scope="row"><label for="cf_intercept_ip">접근차단 IP</label></th>
					<td>
						<%=help("입력된 IP의 컴퓨터는 접근할 수 없음.<br>123.123.+ 도 입력 가능.") %>
						<textarea name="cf_intercept_ip" id="cf_intercept_ip"><%=cf_intercept_ip%></textarea>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="cf_analytics">방문자분석 스크립트</label></th>
					<td colspan="3">
						<%=help("방문자분석 스크립트 코드를 입력합니다. 예) 구글 애널리틱스<br/>") %> <textarea
							name="cf_analytics" id="cf_analytics"><%=cf_analytics%></textarea>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="cf_add_meta">추가 메타태그</label></th>
					<td colspan="3">
						<%=help("추가로 사용하실 meta 태그를 입력합니다.") %><textarea
							name="cf_add_meta" id="cf_add_meta"><%=cf_add_meta%></textarea>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="cf_syndi_token">네이버 신디케이션
							연동키</label></th>
					<td colspan="3">
						
						<%=help("네이버 신디케이션 연동키(token)을 입력하면 네이버 신디케이션을 사용할 수 있습니다.<br>연동키는 <a href=\"http://webmastertool.naver.com/\" target=\"_blank\"><u>네이버 웹마스터도구</u></a> -> 네이버 신디케이션에서 발급할 수 있습니다.") %>
						<input type="text" name="cf_syndi_token"
						value="<%=cf_syndi_token %>"
						id="cf_syndi_token" class="frm_input" size="70">
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="cf_syndi_except">네이버 신디케이션
							제외게시판</label></th>
					<td colspan="3">
						<%=help("네이버 신디케이션 수집에서 제외할 게시판 아이디를 | 로 구분하여 입력하십시오. 예) notice|adult<br>참고로 그룹접근사용 게시판, 글읽기 권한 2 이상 게시판, 비밀글은 신디케이션 수집에서 제외됩니다.") %>
						<input type="text" name="cf_syndi_except"
						value="<%=cf_syndi_except%>"
						id="cf_syndi_except" class="frm_input" size="70">
					</td>
				</tr>
				</tbody>

			</table>
		</div>
	</section>
	
	
	<%=frm_submit.replace("</div>", "<button type=\"button\" class=\"get_theme_confc\" data-type=\"conf_member\">테마 회원스킨설정 가져오기</button></div>") %>


	<section id="anc_cf_board">
		<h2 class="h2_frm">게시판 기본 설정</h2>
		<%=pg_anchor%>
		<div class="local_desc02 local_desc">
			<p>각 게시판 관리에서 개별적으로 설정 가능합니다.</p>
		</div>

		<div class="tbl_frm01 tbl_wrap">
			<table>
				<caption>게시판 기본 설정</caption>
				<colgroup>
					<col class="grid_4">
					<col>
					<col class="grid_4">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label for="cf_delay_sec">글쓰기 간격<strong
								class="sound_only">필수</strong></label></th>
						<td><input type="text" name="cf_delay_sec"
							value="<%=cf_delay_sec%>" id="cf_delay_sec" required
							class="required numeric frm_input" size="3"> 초 지난후 가능</td>
						<th scope="row"><label for="cf_link_target">새창 링크</label></th>
						<td><%=help("글내용중 자동 링크되는 타켓을 지정합니다")%> <select name="cf_link_target"
						
							id="cf_link_target">
								<option value="_blank">_blank</option>
								<option value="_self">_self</option>
								<option value="_top">_top</option>
								<option value="_new">_new</option>
						</select>
						</td>
					</tr>


					<tr>
						<th scope="row"><label for="cf_read_point">글읽기 포인트<strong
								class="sound_only">필수</strong></label></th>
						<td><input type="text" name="cf_read_point"
							value="<%=cf_read_point%>" id="cf_read_point"
							required class="required frm_input" size="3"> 점</td>
						<th scope="row"><label for="cf_write_point">글쓰기 포인트</label></th>
						<td><input type="text" name="cf_write_point"
							value="<%=cf_write_point%>"
							id="cf_write_point" required class="required frm_input" size="3">
							점</td>
					</tr>


					<tr>
						<th scope="row"><label for="cf_comment_point">댓글쓰기
								포인트</label></th>
								
						<td><input type="text" name="cf_comment_point"
							value="<%=cf_comment_point%>"
							id="cf_comment_point" required class="required frm_input"
							size="3"> 점</td>
							
						<th scope="row"><label for="cf_download_point">다운로드
								포인트</label></th>
								
						<td><input type="text" name="cf_download_point"
							value="<%=cf_download_point%>"
							id="cf_download_point" required class="required frm_input"
							size="3"> 점</td>
					</tr>
					
					
					<tr>
            			<th scope="row"><label for="cf_search_part">검색 단위</label></th>
           				<td colspan="3"><input type="text" name="cf_search_part" 
           				value="<%=cf_search_part%>" id="cf_search_part" class="frm_input" size="4"> 건 단위로 검색</td>
      			 	</tr>

					<tr>
						<th scope="row"><label for="cf_image_extension">이미지
								업로드 확장자</label></th>
						<td colspan="3">
							<%=help("게시판 글작성시 이미지 파일 업로드 가능 확장자. | 로 구분<br/>") %>
							<input
							type="text" name="cf_image_extension"
							value="<%=cf_image_extension%>"
							id="cf_image_extension" class="frm_input" size="70">
						</td>
					</tr>

					<tr>
						<th scope="row"><label for="cf_flash_extension">플래쉬 업로드 확장자</label></th>
						<td colspan="3">
							<%=help("게시판 글작성시 플래쉬 파일 업로드 가능 확장자 | 로 구분") %>
							<input type="text" name="cf_flash_extension" value="<%=cf_flash_extension %>" id="cf_flash_extension" class="frm_input" size="70"> 
						</td>
					</tr>

					<tr>
						<th scope="row"><label for="cf_movie_extension">동영상,업로드,확장자</label></th>
						<td colspan="3">
						<%=help("게시판 글작성시 동영상 파일 업로드 가능. 확장자 |로 구분") %>
						<input type="text" name="cf_movie_extension" value="<%=cf_movie_extension%>" id="cf_movie_extension" class="frm_input" size="70">
						</td>
					</tr>
					
					<tr>
						<th scope="row"><label for="cf_filter">단어 필터링</label></th>
						<td colspan="3"><%=help("입력된 단어가 포함된 내용은 게시할 수 없습니다. 단어와 딘어 사이는 ,로 구분합니다.") %>
						<textarea name="cf_filter" id="cf_filter" rows="7"><%=cf_filter%></textarea>
						</td>						
					</tr>
				</tbody>
			</table>
		</div>
	</section>


	<%=frm_submit %>
	
	<section id="anc_cf_join">
		<h2 class="h2_frm">회원가입설정</h2>
		<%=pg_anchor%>
		<div class="local_desc02 local_desc">
			<p>회원가입 시 사용할 스킨과 입력 받을 정보 등을 설정할 수 있습니다.</p>
		</div>
		
		<div class="tbl_frm01 tbl_wrap">
			<table>
			<caption>회원가입설정</caption>
			<colgroup>
				<col class="grid_4">
				<col>
				<col class="grid_4">
				<col> 
			</colgroup>
			
			<tbody>
				<tr>
					<th scope="row"><label for="cf_member_skin">회원 스킨<strong class="sound_only">필수</strong></label></th>
					<td> <select></select></td>
					<th scope="row"><label for="cf_mobile_member_data">모바일<br>회원 스킨 <strong class="sound_only">필수</strong></label></th>
					<td><select></select></td>
				</tr>
				
				<tr>
					<th scope="row">홈페이지 입력</th>
					<td>
						<input type="checkbox" name="cf_use_homepage" value="1" id="cf_use_homepage" <%if(cf_use_homepage==1){out.print("checked");} %>>
						<label for="cf_use_homepage">보이기</label>
						<input type="checkbox" name="cf_req_homepage" value="1" id="cf_req_homepage" <%if(cf_req_homepage==1){out.print("checked");} %>>
						<label for="cf_req_homepage">필수입력</label>
					</td>
					
					<th scope="row">주소입력</th>
					<td>
						<input type="checkbox" name="cf_use_addr" value="1" id="cf_use_addr" <%if(cf_use_addr==1)out.print("checked"); %> >
						<label for="cf_use_addr">보이기</label>
						<input type="checkbox" name="cf_req_addr" value="1" id="cf_req_addr" <%if(cf_req_addr==1)out.print("checked"); %>>
						<label for="cf_req_addr">필수입력</label>
					</td>
				</tr>
				
					
				<tr>	
					<th scope="row">전화번호 입력</th>
					<td>
						<input type="checkbox" name="cf_use_tel" value="1" id="cf_use_tel" <%if(cf_use_tel==1)out.print("checked"); %> >
						<label for="cf_use_tel">보이기</label>					
					</td>
					
					<th scope="row">휴대폰번호 입력</th>
					<td><input type="checkbox" name="cf_use_hp" value="1" id="cf_use_hp" <%if(cf_use_hp==1)out.print("checked"); %> >
						<label for="cf_use_hp">보이기</label>
						<input type="checkbox" name="cf_req_hp" value="1" id="cf_req_hp" <%if(cf_req_addr==1)out.print("checked"); %>>
						<label for="cf_req_hp">필수입력</label>
					</td>					
				</tr>	
				
				
				
				<tr>
					<th scope="row">서명입력</th>
					<td><input type="checkbox" name="cf_use_signature" value="1" id="cf_use_signature" <%if(cf_use_signature==1)out.print("checked"); %>>
						<label for="cf_use_signature">보이기</label>
						<input type="checkbox" name="cf_req_signature" value="1" id="cf_req_signature" <%if(cf_req_signature==1)out.print("checked"); %>>
						<label for="cf_req_signature">필수입력</label>
					</td>
				</tr>
				
				
				
				<tr>
					<th scope="row"><label for="cf_register_level">회원가입시 권한</label></th>
					<td><select></select></td>
					<th scope="row"><label for="cf_register_point">회원가입시 포인트</label></th>
					<td><input type="text" name="cf_register_point" value="<%=cf_register_point %>" id="cf_register_point" class="frm_input" size="5">점
					</td>				
				</tr>
				
				
				<tr>
					<th scope="row"><label for="cf_leave_day">회원 탈퇴후 삭제일</label></th>
					<td colspan="3"><input type="text" name="cf_leave_day" value="<%=cf_leave_day%>" class="frm_input" size="2">일 후 자동 삭제</td>
				</tr>
				
				<tr>
					<th scope="row"><label for="cf_use_member_icon">회원아이콘 사용</label></th>
					<td>
						<%=help("게시물에 게시자 닉네임 대신 아이콘 사용") %>
						<select name="cf_use_member_icon" id="cf_use_member_icon">
							<option value="0">미사용
							<option value="1">아이콘만 표시
							<option value="2">아이콘+이름 표시
						</select>
					</td>
					
					<th scope="row"><label for="cf_icon_level">아이콘 업로드 권한</label></th>
					<td>이상</td>					
				</tr>
				
				<tr>
					<th scope="row"><label for="cf_member_icon_size">회원아이콘용량</label></th>
					<td><input type="text" name="cf_member_icon_size" value="<%=cf_member_icon_size %>" id="cf_member_icon_size" class="frm_input" size="10">바이트이하</td>
					<th scope="row">회원아이콘사이즈</th>
					
					<td>
						<label for="cf_number_icon_width">가로</label>
						<input type="text" name="cf_member_icon_width" value="<%=cf_member_icon_width %>" id="cf_member_icon_width" class="frm_input" size="2">
						<label for="cf_member_icon_height">세로</label>
						<input type="text" name="cf_member_icon_height" value="<%=cf_member_icon_height %>" id="cf_member_icon_height" class="frm_input" size="2">픽셀이하 
					</td>				
				</tr>
				
				<tr>
					<th scope="row"><label for="cf_use_recommend">추천인제도 사용</label></th>
					<td><input type="checkbox" name="cf_use_recommend" value="1" id="cf_use_recommend" <%if(cf_use_reommend==1)out.print("checked"); %>>사용</td>
					<th scope="row"><label for="cf_recommend_point">추천인포인트</label></th>
					<td>
					<input type="text" name="cf_recommend_point" value="<%=cf_recommend_point%>" id="cf_recommend_point" class="frm_input">점</td>
				
				</tr>
				
				
				<tr>
					<th scope="row"><label for="cf_prohibit_id">아이디,닉네임 금지단어</label></th>
					<td><%=help("회원아이디, 닉네임으로 사용할 수 없는 단어를 정합니다. 쉼표 (,) 로 구분") %>
						<textarea name="cf_prohibit_id" id="cf_prohibit_id" rows="5"><%=cf_prohibit_id %></textarea>
					</td>
				
					<th scope="row"><label for="">입력금지메일</label></th>
					<td>
						<%=help("입력 받지 않을 도메인을 지정합니다. 엔터로 구분 ex) hotmail.com") %>
						<textarea name="cf_prohibit_email" id="cf_prohibit_email" rows="5"> <%=cf_prohibit_email%> </textarea>
					</td>					
				</tr>
				
				
				<tr>
					<th scope="row"><label for="cf_stipulation">회원가입약관</label></th>
					<td colspan="3"><textarea rows="10" name="cf_stipulation" id="cf_stipulation"><%=cf_stipulation %></textarea></td>
				</tr>
				
				
				<tr>
					<th scope="row"><label for="cf_privacy">개인정보처리방침</label></th>
					<td colspan="3"><textarea id="cf_privacy" name="cf_privacy" rows="10"> <%=cf_privacy %> </textarea></td>
				</tr>
				
				
				
			</tbody>			
			</table>
		</div>	
	</section>

	<%=frm_submit.replace("</div>", "<button type=\"button\" class=\"get_theme_confc\" data-type=\"conf_member\">테마 회원스킨설정 가져오기</button></div>") %>

	
	<section id="anc_cf_cert">
		<h2 class="h2_frm">본인확인 설정</h2>
		<%=pg_anchor %>
		<div class="local_desc02 local desc">
			<p>
				회원가입 시 본인확인 수단을 설정합니다.<br>
          		  실명과 휴대폰 번호 그리고 본인확인 당시에 성인인지의 여부를 저장합니다.<br>
          		  게시판의 경우 본인확인 또는 성인여부를 따져 게시물 조회 및 쓰기 권한을 줄 수 있습니다.
			</p>		
		</div>
		
		<div class="tbl_frm01 tbl_wrap">
			<table>
			<caption>본인확인설정</caption>
			<colgroup>
				<col class="grid_4">
				<col>
			</colgroup>
			
			<tbody>
				<tr>
					<th scope="row"><label for="cf_cert_use">본인확인</label></th>
					<td>
						<select name="cf_cert_use" id="cf_cert_use">
							<option value="0">사용안함
							<option value="1">테스트
							<option value="2">실서비스
						</select>						
					</td>
				</tr>
				
				<tr>
					<th scope="row" class="cf_cert_service"><label for="cf_sert_ipin">아이핀,본인확인</label></th>
					<td class="cf_cert_service">
						<select name="cf_cert_ipin" id="cf_cert_ipin">
							<option value="">사용안함
							<option value="kcb">코리아크레딧뷰로(KCB) 아아핀
						</select>
					</td>				
				</tr>
				
				<tr>
					<th scope="row" class="cf_cert_service"><label for="cf_cert_hp">휴대폰 본인확인</label></th>
					<td class="cf_cert_service">
						<select name="cf_cert_hp" id="cf_cert_hp">
							<option value="">사용안함
							<option value="kcb">코리아크레딧뷰로(KCB)휴대폰 본인확인
							<option value="kcp">NHN KCP 휴대폰 본인확인
							<option value="lg">LG유플러스 휴대폰 본인확인
						</select>
					</td>					
				</tr>
				
				<tr>
					<th scope="row" class="cf_cert_service"><label for="cf_cert_kcb_cd">코리아크레딧뷰로<br/>KCB회원사ID</label></th>
					<td class="cf_cert_service">
						<%=help("KCB 회원사ID를 입력해 주십시오.<br>서비스에 가입되어 있지 않다면, KCB와 계약체결 후 회원사ID를 발급 받으실 수 있습니다.<br>이용하시려는 서비스에 대한 계약을 아이핀, 휴대폰 본인확인 각각 체결해주셔야 합니다.<br>아이핀 본인확인 테스트의 경우에는 KCB 회원사ID가 필요 없으나,<br>휴대폰 본인확인 테스트의 경우 KCB 에서 따로 발급 받으셔야 합니다.") %>
						<input type="text" name="cf_cert_kcb_cd" value="<%=cf_cert_kcb_cd%>" id="cf_cert_kcb_cd" class="frm_input" size="20">
						<a href="http://sir.kr/main/service/b_ipin.php" target="_blank" class="btn_frmline">kcb 휴대폰 본인확인 서비스 신청페이지</a>	
					</td>					
				</tr>
				
				
				<tr>
					<th scope="row" class="cf_cert_service"><label for="cf_cert_kcp_cd">NHN KCP 사이트 코드</label></th>
					<td class="cf_cert_service">
						<%=help("SM으로 시작하는 5자리 사이트 코드중 뒤의 3자리만 입력해 주십시오.<br>서비스에 가입되어 있지 않다면, 본인확인 서비스 신청페이지에서 서비스 신청 후 사이트코드를 발급 받으실 수 있습니다.") %>  
						<span class="sitecode">SM</span>
						<input type="text" name="cf_lg_mid" value="<%=cf_cert_kcp_cd%>" id="cf_cert_kcp_cd" class="frm_input" size="3">
						<a href="http://sir.kr/main/service/p_cert.php" target="_blank" class="btn_frmline">NHK KCP 휴대폰 본인확인 서비스 신청페이지</a>
					</td>
				</tr>
				
				<tr>
					<th scope="row" class="cf_cert_service"><label for="cf_lg_mid">LG유플러스 상점아이디</label></th>
					<td class="cf_cert_service">
					<%=help("LG유플러스 상점아이디 중 si_를 제외한 나머지 아이디만 입력해 주십시오.<br>서비스에 가입되어 있지 않다면, 본인확인 서비스 신청페이지에서 서비스 신청 후 상점아이디를 발급 받으실 수 있습니다.<br><strong>LG유플러스 휴대폰본인확인은 ActiveX 설치가 필요하므로 Internet Explorer 에서만 사용할 수 있습니다.</strong>") %>
					<span class="sitecode">si_</span>
					<input type="text" name="cf_lg_mid" value="<%=cf_lg_mid%>" class="frm_input" size="20">
					<a href="http://sir.kr/main/service/lg_cert.php" target="_blank" class="btn_frmline"> LG유플러스 본인 확인 서비스 신청페이지</a>
					</td>
				</tr>
				
				
				<tr>
					<th scope="row" class="cf_cert_service"><label for="cf_lg_mert_key">LG유플러스 MERT KEY</label></th>
					<td class="cf_cert_service">
							<%=help("LG유플러스 상점MertKey는 상점관리자 -> 계약정보 -> 상점정보관리에서 확인하실 수 있습니다") %>
							<input type="text" name="cf_lg_mert_key" value="<%=cf_lg_mert_key %>" id="cf_lg_mert_key" class="frm_input" size="40">
							
					</td>
				</tr>
				
				
				<tr>
					<th scope="row" class="cf_cert_service"><label for="cf_cert_limit">본인확인 이용제한</label></th>
					<td class="cf_cert_service">
					<%=help("하루동안 아이핀과 휴대폰 본인확인 인증 이용회수를 제한할 수 있습니다.<br>회수제한은 실서비스에서 아이핀과 휴대폰 본인확인 인증에 개별 적용됩니다.<br>0 으로 설정하시면 회수제한이 적용되지 않습니다.") %>
					<input type="text" name="cf_cert_limit" value="<%=cf_cert_limit%>" id="cf_cert_limit" class="frm_input" size="3">회
				</tr>
				
				<tr>
					<th scope="row" class="cf_cert_service"><label for="cf_cert_req">본인확인 필수</label></th>
					<td class="cf_cert_service">
						<%=help("회원가입 때 본인확인을 필수로 할지 설정합니다. 필수로 설정하시면 본인확인을 하지 않은 경우 회원가입이 안됩니다.") %>
						<input type="checkbox" name="cf_cert_req" value="1" id="cf_cert_req" <%if(cf_cert_req==1) out.print("checked=checked"); %> ></td>
				</tr>				
			</tbody>			
			</table>
		</div>		
	</section>

	<%=frm_submit %>

	<section id="anc_cf_mail">
		<h2 class="h2_frm">기본 메일 환경 설정</h2>
		<%=pg_anchor %>
		
		<div class="tbl_frm01 tbl_wrap">
		 <table>
		 <caption>기본 메일 환경 설정</caption>
		 <colgroup>
		 	<col class="grid_4">
		 	<col>
		 </colgroup>
		 
		 <tbody>
		 	<tr>
		 		<th scope="row" ><label for="cf_email.use">메일발송사용</label></th>
				<td>
					<%=help("체크하지 않으면 메일발송을 아예 사용하지 않습니다. 메일 테스트도 불가합니다") %>
					<input type="checkbox" name="cf_email_use" <%if(cf_email_use==1)out.print("checked"); %>>	
				
				</td>
		 	</tr>

			<tr>
				<th scope="row"><label for="cf_use_email_certify">메일인증사용</label></th>
				<td><%=help("메일에 배달된 인증 주소를 클릭하여야 회원으로 인정합니다.") %>
					<input type="checkbox" name="cf_use_email_certify" value="1" id="cf_use_email_certify" 
					<%if(cf_use_email_certify==1)out.print("checked"); %>> 사용
				</td>
				</tr>
				<tr>
					<th scope="row"><label for="cf_formmail_is_member">폼메일사용 여부</label></th>
					<td>
						<%=help("체크하지 않으면 비회원도 사용 할 수 있습니다.") %>
						<input type="checkbox" name="cf_formmail_is_member" value="1"
							id="cf_formmail_is_member" <%if(cf_formmail_is_member==1)out.print("checked"); %>> 회원만 사용
					</td>
					</tr>


				</tbody>		 	
		 </table>		 
		 </div>	
	</section>

	<%=frm_submit %>
	

	<section id="anc_cf_article_mail">
		<h2 class="h2_frm">게시판 글 작성 시 메일 설정</h2>
		<%=pg_anchor %>
		
		<div class="tbl_frm01 tbl_wrap">
			<table>
			<caption>게시판 글 작성 시 메일 설정</caption>
			<colgroup>
			<col class="grid_4">
			<col>
			</colgroup>
			
			<tbody>
				<tr>
					<th scope="row"><label for="cf_email_wr_super_admin">최고관리자</label></th>
					<td>
						<%=help("최고관리자에게 메일을 발송합니다") %>
						<input type="checkbox" name="cf_email_wr_super_admin" value="1" id="cf_email_wr_super_admin" <% if(cf_email_wr_super_admin==1)out.print("checked");%>>
					</td>
				</tr>
			
				<tr>
					<th scope="row"><label for="cf_email_wr_group_admin">그룹관리자</label></th>
					<td>
						<%=help("그룹관리자에게 메일을 발송합니다.") %>
						 <input type="checkbox" name="cf_email_wr_group_admin" value="1" id="cf_email_wr_group_admin" <%if(cf_email_wr_group_admin==1)out.print("checked"); %> >사용				
					</td>
				</tr>	
				
				 <tr>
            		<th scope="row"><label for="cf_email_wr_board_admin">게시판관리자</label></th>
            		<td>
              		 <%=help("게시판관리자에게 메일을 발송합니다.") %>
                	<input type="checkbox" name="cf_email_wr_board_admin" value="1" id="cf_email_wr_board_admin" <%if(cf_email_wr_board_admin==1)out.print("checked"); %>> 사용
           
           			 </td>
       			 </tr>

					<tr>
						<th scope="row"><label for="cf_email_wr_write">원글작성자</label></th>
						<td><%=help("게시자님께 메일을 발송합니다.")%>
						   <input type="checkbox" name="cf_email_wr_write" value="1" id="cf_email_wr_write" <%if (cf_email_wr_write == 1)out.print("checked");%>> 사용</td>
					</tr>
					
					<tr>
			            <th scope="row"><label for="cf_email_wr_comment_all">댓글작성자</label></th>
			            <td>
			                <%=help("원글에 댓글이 올라오는 경우 댓글 쓴 모든 분들께 메일을 발송합니다.") %>
			                <input type="checkbox" name="cf_email_wr_comment_all" value="1" id="cf_email_wr_comment_all" <%if(cf_email_wr_comment_all==1) out.print("checked"); %>> 
			            </td>
			        </tr>
				</tbody>			
			</table>
		</div>
	</section>
	
	<%=frm_submit %>
	<section id="anc_cf_join_mail">
		<h2 class="h2_frm">회원가입 시 메일 설정</h2>
		<%=pg_anchor%>

		<div class="tbl_frm01 tbl_wrap">
			<table>
				<caption>회원가입 시 메일 설정</caption>
				<colgroup>
					<col class="grid_4">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label for="cf_email_mb_super_admin">최고관리자
								메일발송</label></th>
						<td>
							<%=help("최고관리자에게 메일을 발송합니다.") %>
							 <input type="checkbox" name="cf_email_mb_super_admin" value="1" id="cf_email_mb_super_admin" <%if(cf_email_mb_super_admin==1)out.print("checked"); %>> 사용
						</td>						
					</tr>
					
					<tr>
            			<th scope="row"><label for="cf_email_mb_member">회원님께 메일발송</label></th>
           			 <td>
               			<%=help("회원가입한 회원님께 메일을 발송합니다.") %>
             		   <input type="checkbox" name="cf_email_mb_member" value="1" id="cf_email_mb_member" <%if(cf_email_mb_member==1)out.print("checked"); %>> 사용
          			  </td>
        			</tr>
					
				</tbody>
			</table>
		</div>
	</section>


		<%=frm_submit %>
		
	<section id="anc_cf_vote_mail">
    <h2 class="h2_frm">투표 기타의견 작성 시 메일 설정</h2>
    <%=pg_anchor%>

    <div class="tbl_frm01 tbl_wrap">
        <table>
        <caption>투표 기타의견 작성 시 메일 설정</caption>
        <colgroup>
            <col class="grid_4">
            <col>
        </colgroup>
        <tbody>
        <tr>
            <th scope="row"><label for="cf_email_po_super_admin">최고관리자 메일발송</label></th>
            <td>
                <%=help("최고관리자에게 메일을 발송합니다.") %>
                <input type="checkbox" name="cf_email_po_super_admin" value="1" id="cf_email_po_super_admin" <%if(cf_email_po_super_admin==1)out.print("cf_email_po_super_admin"); %>> 사용
            </td>
        </tr>
        </tbody>
        </table>
    </div>
</section>

<%=frm_submit %>

<section id="anc_cf_sns">
    <h2 class="h2_frm">소셜네트워크서비스(SNS : Social Network Service)</h2>
    <%=pg_anchor %>

    <div class="tbl_frm01 tbl_wrap">
        <table>
        <caption>소셜네트워크서비스 설정</caption>
        <colgroup>
            <col class="grid_4">
            <col>
            <col class="grid_4">
            <col>
        </colgroup>
        <tbody>
        <tr>
            <th scope="row"><label for="cf_facebook_appid">페이스북 앱 ID</label></th>
            <td>
                <input type="text" name="cf_facebook_appid" value="<%=cf_facebook_appid%>" id="cf_facebook_appid" class="frm_input"> <a href="https://developers.facebook.com/apps" target="_blank" class="btn_frmline">앱 등록하기</a>
            </td>
            <th scope="row"><label for="cf_facebook_secret">페이스북 앱 Secret</label></th>
            <td>
                <input type="text" name="cf_facebook_secret" value="<%=cf_facebook_secret %>" id="cf_facebook_secret" class="frm_input" size="35">
            </td>
        </tr>
        <tr>
            <th scope="row"><label for="cf_twitter_key">트위터 컨슈머 Key</label></th>
            <td>
                <input type="text" name="cf_twitter_key" value="<%=cf_twitter_key %>" id="cf_twitter_key" class="frm_input"> <a href="https://dev.twitter.com/apps" target="_blank" class="btn_frmline">앱 등록하기</a>
            </td>
            <th scope="row"><label for="cf_twitter_secret">트위터 컨슈머 Secret</label></th>
            <td>
                <input type="text" name="cf_twitter_secret" value="<%=cf_twitter_secret %>" id="cf_twitter_secret" class="frm_input" size="35">
            </td>
        </tr>
        <tr>
            <th scope="row"><label for="cf_googl_shorturl_apikey">구글 짧은주소 API Key</label></th>
            <td>
                <input type="text" name="cf_googl_shorturl_apikey" value="<%=cf_googl_shorturl_apikey %>" id="cf_googl_shorturl_apikey" class="frm_input"> <a href="http://code.google.com/apis/console/" target="_blank" class="btn_frmline">API Key 등록하기</a>
            </td>
            <th scope="row"><label for="cf_kakao_js_apikey">카카오 Javascript API Key</label></th>
            <td>
                <input type="text" name="cf_kakao_js_apikey" value="<%=cf_kakao_js_apikey %>" id="cf_kakao_js_apikey" class="frm_input"> <a href="http://developers.kakao.com/" target="_blank" class="btn_frmline">앱 등록하기</a>
            </td>
        </tr>
        </tbody>
        </table>
    </div>
</section>


	<%=frm_submit%>
	
	<section id="anc_cf_lay">
		<h2 class="h2_frm">레이아웃 추가설정</h2>
		<%=pg_anchor %>
		<div class="local_desc02 local_desc">
			<p>기본 설정된 파일 경로 및 script, css 를 추가하거나 변경할 수 있습니다.</p>
		</div>

		<div class="tbl_frm01 tbl_wrap">
			<table>
				<caption>레이아웃 추가설정</caption>
				<colgroup>
					<col class="grid_4">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label for="cf_add_script">추가 script,
								css</label></th>
						<td>
							<%=help("HTML의 &lt;/HEAD&gt; 태그위로 추가될 JavaScript와 css 코드를 설정합니다.<br>관리자 페이지에서는 이 코드를 사용하지 않습니다.") %>
							<textarea name="cf_add_script" id="cf_add_script"><%=cf_add_script %></textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</section>

<%=frm_submit %>

	<section id="anc_cf_sms">
		<h2 class="h2_frm">SMS</h2>
		<%=pg_anchor%>

		<div class="tbl_frm01 tbl_wrap">
			<table>
				<caption>SMS 설정</caption>
				<colgroup>
					<col class="grid_4">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label for="cf_sms_use">SMS 사용</label></th>
						<td><select id="cf_sms_use" name="cf_sms_use">
								<option value="">사용안함</option>
								<option value="icode">아이코드</option>
						</select></td>
					</tr>

					<tr>
						<th scope="row"><label for="cf_sms_type">SMS 전송유형</label></th>
						<td>
							<%= help("전송유형을 SMS로 선택하시면 최대 80바이트까지 전송하실 수 있으며<br>LMS로 선택하시면 90바이트 이하는 SMS로, 그 이상은 1500바이트까지 LMS로 전송됩니다.<br>요금은 건당 SMS는 16원, LMS는 48원입니다.") %>
							<select id="cf_sms_type" name="cf_sms_type">
								<option value="">SMS</option>
								<option value="LMS">LMS</option>
							</select>
						</td>
					</tr>


					<tr>
						<th scope="row"><label for="cf_icode_id">아이코드 회원아이디</label></th>
						<td>
							<%=help("아이코드에서 사용하시는 회원아이디를 입력합니다.") %>
							 <input type="text" name="cf_icode_id" value="<%=cf_icode_id %>" id="cf_icode_id" class="frm_input" size="20">
						</td>
					</tr>


					<tr>
						<th scope="row"><label for="cf_icode_pw">아이코드 비밀번호</label></th>
						<td>
							<%=help("아이코드에서 사용하시는 비밀번호를 입력합니다.") %>
							<input type="password" name="cf_icode_pw" value="<%=cf_icode_pw %>" id="cf_icode_pw" class="frm_input">
						</td>
					</tr>


					<tr>
						<th scope="row">요금제</th>
						<td><input type="hidden" name="cf_icode_server_ip"
							value="<%=cf_icode_server_ip %>">
							가입해주세요
							<input type="hidden" name="cf_icode_server_port" value="7295">                    
                		</td>
					</tr>


					<tr>
            			<th scope="row">아이코드 SMS 신청<br>회원가입</th>
            			<td><a href="http://icodekorea.com/res/join_company_fix_a.php?sellid=sir2" target="_blank" class="btn_frmline">아이코드 회원가입</a></td>
       				 </tr>

					




				</tbody>
			</table>
		</div>
	</section>


	<%=frm_submit%>
	<section id="anc_cf_extra">
    <h2 class="h2_frm">여분필드 기본 설정</h2>
    <%=pg_anchor %>
    <div class="local_desc02 local_desc">
        <p>각 게시판 관리에서 개별적으로 설정 가능합니다.</p>
    </div>

    <div class="tbl_frm01 tbl_wrap">
        <table>
        <caption>여분필드 기본 설정</caption>
        <colgroup>
            <col class="grid_4">
            <col>
        </colgroup>
        <tbody>
        <% for (int i=1; i<=10; i++) { %>
        <tr>
            <th scope="row">여분필드 <%=i%> </th>
            <td class="td_extra">
                <label for="cf_<%=i%>_subj">여분필드<%=i %> 제목</label>
                <input type="text" name="cf_<%=i%>_subj" value="" id="cf_<%=i%>_subj" class="frm_input" size="30">
                <label for="<%=i%>">여분필드<%=i %>값</label>
                <input type="text" name="cf_<%=i%>" value="" id="<%=i%>" class="frm_input" size="30">
             </td>
        </tr>
        <%}%>
        </tbody>
        </table>
    </div>
	</section>
<%=frm_submit %>



</form>




<script>
	$(function() {

		if (<%=cf_cert_use%>== 0) {
			$(".cf_cert_service").addClass("cf_cert_hide");
		}

		$("#cf_cert_use").change(function() {
			switch ($(this).val()) {
			case "0":
				$(".cf_cert_service").addClass("cf_cert_hide");
				break;
			default:
				$(".cf_cert_service").removeClass("cf_cert_hide");
				break;
			}
		})

	});

	function fconfigform_submit(f) {
		f.action = "./config_form_update.jsp";
		return true;
	}
</script>








