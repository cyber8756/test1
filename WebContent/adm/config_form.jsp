<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnect.DBConnector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
 	DBConnector dbc=new DBConnector(); 	
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
 		
 	}
 	
 	
 	dbc.closeDB();
 
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
					<td colspan="3">"<%=cf_admin%></td>
				</tr>

				<tr>
					<th scope="row"><label for="cf_admin_email">관리자 메일 주소<strong
							class="sound_only">필수</strong></label></th>
					<td colspan="3">관리자가 보내고 받는 용도로 사용하는 메일 주소를 입력합니다. (회원가입,
						인증메일, 테스트, 회원메일발송 등에서 사용)<br /> <input type="text"
						name="cf_admin_email" value="<%=cf_admin_email %>"
						id="cf_admin_email" required class="required email frm_input"
						size="40">
					</td>
				</tr>

				<tr>
					<th scope="row"><label for="cf_admin_email_name">관리자
							메일 발송이름<strong class="sound_only">필수</strong>
					</label></th>
					<td colspan="3">관리자가 보내고 받는 용도로 사용하는 메일의 발송이름을 입력합니다. (회원가입,
						인증메일, 테스트, 회원메일발송 등에서 사용)<br /> <input type="text"
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
					<td>회원이 로그인시 하루에 한번만 적립 <input type="text"
						name="cf_login_point" value="<%=cf_login_point%>"
						id="cf_login_point" required class="required frm_input" size="5">
						점
					</td>
					<th scope="row"><label for="cf_memo_send_point">쪽지보낼시
							차감 포인트<strong class="sound_only">필수</strong>
					</label></th>
					<td>
						<?php echo help('양수로 입력하십시오. 0점은 쪽지 보낼시 포인트를 차감하지 않습니다.') ?> <input
						type="text" name="cf_memo_send_point"
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
					<td>설정일이 지난 최근게시물 자동 삭제 <input type="text" name="cf_new_del"
						value="<%=cf_new_del%>" id="cf_new_del" class="frm_input" size="5">
						일
					</td>
					<th scope="row"><label for="cf_memo_del">쪽지 삭제</label></th>
					<td>설정일이 지난 쪽지 자동 삭제<br /> <input type="text"
						name="cf_memo_del" value="<%=cf_memo_del%>" id="cf_memo_del"
						class="frm_input" size="5"> 일
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="cf_visit_del">접속자로그 삭제</label></th>
					<td>설정일이 지난 접속자 로그 자동 삭제<br /> <input type="text"
						name="cf_visit_del" value="<%= cf_visit_del%>" id="cf_visit_del"
						class="frm_input" size="5"> 일
					</td>
					<th scope="row"><label for="cf_popular_del">인기검색어 삭제</label></th>
					<td>설정일이 지난 인기검색어 자동 삭제<br /> <input type="text"
						name="cf_popular_del" value="<%=cf_popular_del%>"
						id="cf_popular_del" class="frm_input" size="5"> 일
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="cf_login_minutes">현재 접속자</label></th>
					<td>설정값 이내의 접속자를 현재 접속자로 인정<br /> <input type="text"
						name="cf_login_minutes" value="<%=cf_login_minutes %>"
						id="cf_login_minutes" class="frm_input" size="3"> 분
					</td>
					<th scope="row"><label for="cf_new_rows">최근게시물 라인수</label></th>
					<td>목록 한페이지당 라인수<br /> <input type="text" name="cf_new_rows"
						value="<%=cf_new_rows%>" id="cf_new_rows" class="frm_input"
						size="3"> 라인
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="cf_page_rows">한페이지당 라인수</label></th>
					<td>목록(리스트) 한페이지당 라인수<br /> <input type="text"
						name="cf_page_rows" value="<%=cf_page_rows%>" id="cf_page_rows"
						class="frm_input" size="3"> 라인
					</td>
					<th scope="row"><label for="cf_mobile_page_rows">모바일
							한페이지당 라인수</label></th>
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
						G5_EDITOR_URL.' 밑의 DHTML 에디터 폴더를 선택합니다.<br/>
						 <select name="cf_editor" id="cf_editor"></select>
					</td>
				</tr>

				<tr>
					<th scope="row"><label for="cf_captcha_mp3">음성캡챠 선택<strong
							class="sound_only">필수</strong></label></th>
					<td colspan="3">
						G5_CAPTCHA_URL/mp3 밑의 음성 폴더를 선택합니다. <select
						name="cf_captcha_mp3" id="cf_captcha_mp3" required
						class="required">
							
					</select>
					</td>
				</tr>

				<tr>
					<th scope="row"><label for="cf_use_copy_log">복사, 이동시
							로그</label></th>
					<td colspan="3">
						게시물 아래에 누구로 부터 복사, 이동됨 표시
						 <input type="checkbox" name="cf_use_copy_log" value="1" id="cf_use_copy_log"
						  <%if(cf_use_copy_log==1) out.print("checked"); %> >						  
						 남김
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="cf_point_term">포인트 유효기간</label></th>
					<td colspan="3">
						<?php echo help('기간을 0으로 설정시 포인트 유효기간이 적용되지 않습니다.') ?> <input
						type="text" name="cf_point_term"
						value="<%=cf_point_term%>" id="cf_point_term"
						required class="required frm_input" size="5"> 일
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="cf_possible_ip">접근가능 IP</label></th>
					<td>
						입력된 IP의 컴퓨터만 접근할 수 있습니다.<br>123.123.+ 도 입력 가능. (엔터로 구분)
						<textarea name="cf_possible_ip" id="cf_possible_ip"><%=cf_possible_ip%></textarea>
					</td>
					<th scope="row"><label for="cf_intercept_ip">접근차단 IP</label></th>
					<td>
						입력된 IP의 컴퓨터는 접근할 수 없음.<br>123.123.+ 도 입력 가능.
						<textarea name="cf_intercept_ip" id="cf_intercept_ip"><%=cf_intercept_ip%></textarea>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="cf_analytics">방문자분석 스크립트</label></th>
					<td colspan="3">
						방문자분석 스크립트 코드를 입력합니다. 예) 구글 애널리틱스<br/> <textarea
							name="cf_analytics" id="cf_analytics"><%=cf_analytics%></textarea>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="cf_add_meta">추가 메타태그</label></th>
					<td colspan="3">
						<?php echo help('추가로 사용하실 meta 태그를 입력합니다.'); ?> <textarea
							name="cf_add_meta" id="cf_add_meta"><%=cf_add_meta%></textarea>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="cf_syndi_token">네이버 신디케이션
							연동키</label></th>
					<td colspan="3">
						<?php if (!function_exists('curl_init')) echo help('<b>경고) curl이 지원되지 않아 네이버 신디케이션을 사용할수 없습니다.</b>'); ?>
						네이버 신디케이션 연동키(token)을 입력하면 네이버 신디케이션을 사용할 수 있습니다.<br>연동키는 <a href="http://webmastertool.naver.com/" target="_blank"><u>네이버 웹마스터도구</u></a> -> 네이버 신디케이션에서 발급할 수 있습니다.
						<input type="text" name="cf_syndi_token"
						value="<%=cf_syndi_token %>"
						id="cf_syndi_token" class="frm_input" size="70">
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="cf_syndi_except">네이버 신디케이션
							제외게시판</label></th>
					<td colspan="3">
						네이버 신디케이션 수집에서 제외할 게시판 아이디를 | 로 구분하여 입력하십시오. 예) notice|adult<br>참고로 그룹접근사용 게시판, 글읽기 권한 2 이상 게시판, 비밀글은 신디케이션 수집에서 제외됩니다.
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

</form>