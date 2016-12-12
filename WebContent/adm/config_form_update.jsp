<%@page import="dbconnect.DBConnector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
%>



<jsp:useBean id="g5configvo" class="dbconnect.G5ConfigVO"/>
<jsp:setProperty property="*" name="g5configvo"/>


 <%=g5configvo.getCf_title() %>
 <%!
 	String submenu="100100";
 	
 	String sql="update g5_config set cf_title=?,"+
 			    "cf_admin=?,"+
 			    "cf_admin_email=?,"+
 			    "cf_admin_email_name=?,"+
 			    "cf_use_point=?,"+
 			    "cf_login_point=?,"+
 			    "cf_memo_send_point=?,"+
 				"cf_cut_name=?,"+
 				"cf_nick_modify=?,"+
 				"cf_open_modify=?,"+
 				"cf_new_del=?,"+
 				"cf_memo_del=?,"+
 				"cf_visit_del=?,"+
 				"cf_popular_del=?,"+
 				"cf_login_minutes=?,"+
 				"cf_new_rows=?,"+
 				"cf_page_rows=?,"+
 				"cf_mobile_page_rows=?,"+
 				"cf_write_pages=?,"+
 			    "cf_mobile_pages=?,"+
 			    "cf_use_copy_log=?,"+
 			    "cf_point_term=?"+
 			    "cf_possible_ip=?"+
 			    "cf_intercept_ip=?"+
 			    "cf_analytics=?"+
 			    "cf_add_meta=?"+
 			    "cf_syndi_token=?"+
 			    "cf_syndi_except=?"+
 			    "cf_delay_sec=?"+
 			    "cf_read_point=?"+
 			    "cf_write_point=?"+
 			    "cf_comment_point=?"+
 			    "cf_download_point=?"+
 			    "cf_search_part=?"+
 			    "cf_image_extension=?"+
 			    "cf_flash_extension=?"+
 			    "cf_movie_extension=?"+
 			    "cf_filter=?"+
 			    "cf_use_homepage=?"+
 			    "cf_req_homepage=?"+
 			    "cf_use_tel=?"+
 			    "cf_use_hp=?"+
 			    "cf_use_addr=?"+
 			    "cf_req_addr=?"+
 			    "cf_use_signature=?"+
 			    "cf_req_signature=?"+
 			    "cf_register_point=?"+
 			    "cf_leave_day=?"+
 			    "cf_member_icon_size=?"+
 			    "cf_member_icon_width=?"+
 			    "cf_member_icon_height=?"+
 			    "cf_use_recommend=?"+
 			    "cf_recommend_point=?"+
 			    "cf_prohibit_id=?"+
 			    "cf_prohibit_email=?"+
 			    "cf_stipulation=?"+
 			    "cf_privacy=?"+
 			    "cf_cert_use=?"+
 			    "cf_cert_kcb_cd=?"+
 			    "cf_cert_kcp_cd=?"+
 			    "cf_lg_mid=?"+
 			    "cf_lg_mert_key=?"+
 			    "cf_cert_limit=?"+
 			    "cf_cert_req=?"+
 			    "cf_email_use=?"+
 			    "cf_use_email_certify=?"+
 			    "cf_formmail_is_member=?"+
 			    "cf_email_wr_super_admin=?"+
 			    "cf_email_wr_group_admin=?"+
 			    "cf_email_wr_board_admin=?"+
 			    "cf_email_wr_write=?"+
 			    "cf_email_wr_comment_all=?"+
 			    "cf_email_mb_super_admin=?"+
 			    "cf_email_mb_member=?"+
 			    "cf_email_po_super_admin=?"+
 			    "cf_facebook_appid=?"+
 			    "cf_facebook_secret=?"+
 			    "cf_twitter_key=?"+
 			    "cf_twitter_secret=?"+
 			    "cf_googl_shorturl_apikey=?"+
 			    "cf_kakao_js_apikey=?"+
 			    "cf_add_script=?"+
 			    "cf_icode_id=?"+
 			    "cf_icode_pw=?"+
 			    "cf_icode_server_ip=?";
 	
 	
 	
 	
 %>
 
 <%
 
 	
 
 	DBConnector dbc=DBConnector.getInstance();
 	int isS=dbc.update_G5config(sql, g5configvo);
 	
 	
 	  %>
 		
 	
 <script>
 if(<%=isS%>==1){
 	alert("성공");
 	location.href="config_form.jsp";
 }else{
	 alert("실패");
	 location.href="config_form.jsp";
 }
 </script>
 
 
 