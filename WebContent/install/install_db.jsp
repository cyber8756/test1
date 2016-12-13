<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.net.InetAddress"%>
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
    
<%!
public String implode(String glue, ArrayList<String> strs) {
	String ret = "";
	int strs_size = strs.size();
	for(int i=0; i<strs_size; i++) ret += (i == strs_size - 1) ? strs.get(i) : strs.get(i) + glue;
	return ret;
}
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

rs=dbc.select("desc "+table_prefix+"config");
if(rs.next()){
    result=rs.getString(1);
}
System.out.println(result);

 
 
 
 
 
 //그누보드5 재설치에 체크했거나 그누보드5가 설치되어 있지 않다면 테이블생성
 if(g5_install[0].equals("1") || (result==null || result.isEmpty()) ){
	 String sql=filelib.getFileContent(new File(getServletContext().getRealPath("/install/gnuboard5.sql")));
	 /* sql=sql.replaceAll("/^--.*$/m", "");
	 sql=sql.replaceAll("/`g5_([^`]+`)/","'"+table_prefix+sql); */
	 String s[]=sql.split(";");
	 for(int i=0;i<s.length;i++){
		 if(s[i].trim()==null||s[i].trim().length()==0) 
			 continue;
		 dbc.select(s[i]);
		 
		 //System.out.println(s[i]);
	 }
	 System.out.println("그누보드5 설치끝");
 }
 

 //쇼핑몰 테이블 생성
 if(g5_shop_install[0].equals("1")){
	 System.out.println("쇼핑몰설치 시작");
	String sql=filelib.getFileContent(new File(getServletContext().getRealPath("/install/gnuboard5shop.sql")));
	/* sql=sql.replaceAll("/^--.*$/m", "");	 
	sql=sql.replaceAll("/`g5_shop_([^`]+`)/","'"+g5_shop_prefix+sql); */
 	String s[]=sql.split(";");
 	
 	for(int i=0;i<s.length;i++){
 		if(s[i].trim()==null || s[i].trim().length()==0) 
 			continue;
 		dbc.select(s[i]);
 		 //System.out.println(s[i]);
 	}
 	
 	System.out.println("쇼핑몰설치 끝");
}
%>

<li>전체 테이블 생성 완료</li>


<% 
//config테이블 설정
 if(g5_install[0].equals("1") || (result==null || result.isEmpty()) ){
	System.out.println("체크1");
	int isSuccess=0;
	String sql = "insert into "+table_prefix+"config"+
            " set cf_title = '',"+
                "cf_theme = 'basic',"+
                "cf_admin = '"+admin_id+"',"+
                "cf_admin_email = '"+admin_email+"',"+
                "cf_admin_email_name = 'admin',"+
                "cf_use_point = '1',"+
                "cf_use_copy_log = '1',"+
                "cf_login_point = '100',"+
                "cf_memo_send_point = '500',"+
                "cf_cut_name = '15',"+
                "cf_nick_modify = '60',"+
                "cf_new_skin = 'basic',"+
                "cf_new_rows = '15',"+
                "cf_search_skin = 'basic',"+
                "cf_connect_skin = 'basic',"+
                "cf_read_point = 0,"+
                "cf_write_point = 0,"+
                "cf_comment_point = 0,"+
                "cf_download_point = 0,"+
                "cf_write_pages = '10',"+
                "cf_mobile_pages = '5',"+
                "cf_link_target = '_blank',"+
                "cf_delay_sec = '30',"+
                "cf_filter = '18아,18놈,18새끼,18년,18뇬,18노,18것,18넘,개년,개놈,개뇬,개새,개색끼,개세끼,개세이,개쉐이,개쉑,개쉽,개시키,개자식,개좆,게색기,게색끼,광뇬,뇬,눈깔,뉘미럴,니귀미,니기미,니미,도촬,되질래,뒈져라,뒈진다,디져라,디진다,디질래,병쉰,병신,뻐큐,뻑큐,뽁큐,삐리넷,새꺄,쉬발,쉬밸,쉬팔,쉽알,스패킹,스팽,시벌,시부랄,시부럴,시부리,시불,시브랄,시팍,시팔,시펄,실밸,십8,십쌔,십창,싶알,쌉년,썅놈,쌔끼,쌩쑈,썅,써벌,썩을년,쎄꺄,쎄엑,쓰바,쓰발,쓰벌,쓰팔,씨8,씨댕,씨바,씨발,씨뱅,씨봉알,씨부랄,씨부럴,씨부렁,씨부리,씨불,씨브랄,씨빠,씨빨,씨뽀랄,씨팍,씨팔,씨펄,씹,아가리,아갈이,엄창,접년,잡놈,재랄,저주글,조까,조빠,조쟁이,조지냐,조진다,조질래,존나,존니,좀물,좁년,좃,좆,좇,쥐랄,쥐롤,쥬디,지랄,지럴,지롤,지미랄,쫍빱,凸,퍽큐,뻑큐,빠큐,ㅅㅂㄹㅁ',"+
                "cf_possible_ip = '',"+
                "cf_intercept_ip = '',"+
                "cf_member_skin = 'basic',"+
                "cf_mobile_new_skin = 'basic',"+
                "cf_mobile_search_skin = 'basic',"+
                "cf_mobile_connect_skin = 'basic',"+
                "cf_mobile_member_skin = 'basic',"+
                "cf_faq_skin = 'basic',"+
                "cf_mobile_faq_skin = 'basic',"+
                "cf_editor = 'smarteditor2',"+ 
                "cf_captcha_mp3 = 'basic',"+
                "cf_register_level = '2',"+
                "cf_register_point = '1000',"+
                "cf_icon_level = '2',"+
                "cf_leave_day = '30',"+
                "cf_search_part = '10000',"+
                "cf_email_use = '1',"+
                "cf_prohibit_id = 'admin,administrator,관리자,운영자,어드민,주인장,webmaster,웹마스터,sysop,시삽,시샵,manager,매니저,메니저,root,루트,su,guest,방문객',"+
                "cf_prohibit_email = '',"+
                "cf_new_del = '30',"+
                "cf_memo_del = '180',"+
                "cf_visit_del = '180',"+
                "cf_popular_del = '180',"+
                "cf_use_member_icon = '2',"+
                "cf_member_icon_size = '5000',"+
                "cf_member_icon_width = '22',"+
                "cf_member_icon_height = '22',"+
                "cf_login_minutes = '10',"+
                "cf_image_extension = 'gif|jpg|jpeg|png',"+
                "cf_flash_extension = 'swf',"+
                "cf_movie_extension = 'asx|asf|wmv|wma|mpg|mpeg|mov|avi|mp3',"+
                "cf_formmail_is_member = '1',"+
                "cf_page_rows = '15',"+
                "cf_mobile_page_rows = '15',"+
                "cf_cert_limit = '2',"+
                "cf_stipulation = '해당 홈페이지에 맞는 회원가입약관을 입력합니다.',"+
                "cf_privacy = '해당 홈페이지에 맞는 개인정보처리방침을 입력합니다.'";
	
	
	isSuccess=dbc.insert(sql);
	if(isSuccess==1){
		System.out.println("config 테이블 값 설정 끝");
	}
	
	
	sql="insert into "+table_prefix+"qa_config"+
            "(qa_title, qa_category, qa_skin, qa_mobile_skin, qa_use_email, qa_req_email, qa_use_hp, qa_req_hp, qa_use_editor, qa_subject_len, qa_mobile_subject_len, qa_page_rows, qa_mobile_page_rows, qa_image_width, qa_upload_size, qa_insert_content)"+
          " values('1:1문의', '회원|포인트', 'basic', 'basic', '1', '0', '1', '0', '1', '60', '30', '15', '15', '600', '1048576', '' ) ";
	
	
	isSuccess=dbc.insert(sql);
	if(isSuccess==1){
		System.out.println("qa_config 테이블 값 설정끝");
	}
	
	
	InetAddress inet = InetAddress.getLocalHost();
	String serverIP = inet.getHostAddress();
	String G5_TIME_YMDHIS=new SimpleDateFormat("yyyy HH:mm:ss").format(Calendar.getInstance().getTime());
	
	
	 sql = "insert into "+table_prefix+"member"+
             " set mb_id = '"+admin_id+"',"+
             "mb_password = PASSWORD('"+admin_pass+"'),"+
             "mb_name = '"+admin_name+"',"+
             "mb_nick = '"+admin_name+"',"+
             "mb_email = '"+admin_email+"',"+
             "mb_level = '10',"+
             "mb_mailling = '1',"+
             "mb_open = '1',"+
             "mb_email_certify = '"+G5_TIME_YMDHIS+"',"+
             "mb_datetime = '"+G5_TIME_YMDHIS+"',"+
             "mb_ip = '"+serverIP+"'";	
	
	isSuccess=dbc.insert(sql);
	if(isSuccess==1){
		System.out.println("member 테이블 값 설정끝");
	}
	
	
	
	
	 // 내용관리 생성
    sql="insert into "+table_prefix+"content set co_id = 'company', co_html = '1', co_subject = '회사소개', co_content= '<p align=center><b>회사소개에 대한 내용을 입력하십시오.</b></p>', co_skin = 'basic', co_mobile_skin = 'basic'";
    dbc.insert(sql);
    
    sql="insert into "+table_prefix+"content set co_id = 'privacy', co_html = '1', co_subject = '개인정보 처리방침', co_content= '<p align=center><b>개인정보 처리방침에 대한 내용을 입력하십시오.</b></p>', co_skin = 'basic', co_mobile_skin = 'basic'";
    dbc.insert(sql);
    
    sql="insert into "+table_prefix+"content set co_id = 'provision', co_html = '1', co_subject = '서비스 이용약관', co_content= '<p align=center><b>서비스 이용약관에 대한 내용을 입력하십시오.</b></p>', co_skin = 'basic', co_mobile_skin = 'basic'";
	dbc.insert(sql);
    
    // FAQ Master
    sql="insert into "+table_prefix + "faq_master set fm_id = '1', fm_subject = '자주하시는 질문'";
	dbc.insert(sql);
	 
	System.out.println("내용관리생성끝");	 
	//FAQMaster

	 
	 
} 


if(g5_shop_install[0].equals("1")){
	int simg_width=230;
	int simg_height=230;
	int mimg_width=320;
	int mimg_height=320;
	int isSuccess=0;
	System.out.println("체크2");
	
	String sql = "insert into "+g5_shop_prefix+"default"+
           " set de_admin_company_name = '회사명',"+
                "de_admin_company_saupja_no = '123-45-67890',"+
                "de_admin_company_owner = '대표자명',"+
                "de_admin_company_tel = '02-123-4567',"+
                "de_admin_company_fax = '02-123-4568',"+
                "de_admin_tongsin_no = '제 OO구 - 123호',"+
                "de_admin_buga_no = '12345호',"+
                "de_admin_company_zip = '123-456',"+
                "de_admin_company_addr = 'OO도 OO시 OO구 OO동 123-45',"+
                "de_admin_info_name = '정보책임자명',"+
                "de_admin_info_email = '정보책임자 E-mail',"+
                "de_shop_skin = 'basic',"+
                "de_shop_mobile_skin = 'basic',"+
                "de_type1_list_use = '1',"+
                "de_type1_list_skin = 'main.10.skin.php',"+
                "de_type1_list_mod = '3',"+
                "de_type1_list_row = '2',"+
                "de_type1_img_width = '"+simg_width+"',"+
                "de_type1_img_height = '"+simg_height+"',"+
                "de_type2_list_use = '1',"+
                "de_type2_list_skin = 'main.10.skin.php',"+
                "de_type2_list_mod = '3',"+
                "de_type2_list_row = '2',"+
                "de_type2_img_width = '"+simg_width+"',"+
                "de_type2_img_height ='"+simg_height+"',"+
                "de_type3_list_use = '1',"+
                "de_type3_list_skin = 'main.10.skin.php',"+
                "de_type3_list_mod = '1',"+
                "de_type3_list_row = '3',"+
                "de_type3_img_width = '"+simg_width+"',"+
                "de_type3_img_height = '"+simg_width+"',"+
                "de_type4_list_use = '1',"+
                "de_type4_list_skin = 'main.10.skin.php',"+
                "de_type4_list_mod = '3',"+
                "de_type4_list_row = '1',"+
                "de_type4_img_width = '"+simg_width+"',"+
                "de_type4_img_height = '"+simg_height+"',"+
                "de_type5_list_use = '1',"+
                "de_type5_list_skin = 'main.10.skin.php',"+
                "de_type5_list_mod = '3',"+
                "de_type5_list_row = '1',"+
                "de_type5_img_width = '"+simg_width+"',"+
                "de_type5_img_height = '"+simg_height+"',"+
                "de_mobile_type1_list_use = '1',"+
                "de_mobile_type1_list_skin = 'main.10.skin.php',"+
                "de_mobile_type1_list_mod = '3',"+
                "de_mobile_type1_list_row = '2',"+
                "de_mobile_type1_img_width = '"+simg_width+"',"+
                "de_mobile_type1_img_height = '"+simg_height+"',"+
                "de_mobile_type2_list_use = '1',"+
                "de_mobile_type2_list_skin = 'main.10.skin.php',"+
                "de_mobile_type2_list_mod = '3',"+
                "de_mobile_type2_list_row = '2',"+
                "de_mobile_type2_img_width = '"+simg_width+"',"+
                "de_mobile_type2_img_height = '"+simg_height+"',"+
                "de_mobile_type3_list_use = 1,"+
                "de_mobile_type3_list_skin = 'main.10.skin.php',"+
                "de_mobile_type3_list_mod = '3',"+
                "de_mobile_type3_list_row = '2',"+
                "de_mobile_type3_img_width = '"+simg_width+"',"+
                "de_mobile_type3_img_height ='"+simg_height+"',"+
                "de_mobile_type4_list_use = '1',"+
                "de_mobile_type4_list_skin = 'main.10.skin.php',"+
                "de_mobile_type4_list_mod = '3',"+
                "de_mobile_type4_list_row = '2',"+
                "de_mobile_type4_img_width = '"+simg_width+"',"+
                "de_mobile_type4_img_height ='"+simg_height+"',"+
                "de_mobile_type5_list_use = '1',"+
                "de_mobile_type5_list_skin = 'main.10.skin.php',"+
                "de_mobile_type5_list_mod = '3',"+
                "de_mobile_type5_list_row = '2',"+
                "de_mobile_type5_img_width = '"+simg_width+"',"+
                "de_mobile_type5_img_height ='"+simg_height+"',"+
                "de_bank_use = '1',"+
                "de_bank_account = 'OO은행 12345-67-89012 예금주명',"+
                "de_vbank_use = '0',"+
                "de_iche_use = '0',"+
                "de_card_use = '0',"+
                "de_settle_min_point = '5000',"+
                "de_settle_max_point = '50000',"+
                "de_settle_point_unit = '100',"+
                "de_cart_keep_term = '15',"+
                "de_card_point = '0',"+
                "de_point_days = '7',"+
                "de_pg_service = 'kcp',"+
                "de_kcp_mid = '',"+
                "de_send_cost_case = '차등',"+
                "de_send_cost_limit = '20000;30000;40000',"+
                "de_send_cost_list = '4000;3000;2000',"+
                "de_hope_date_use = '0',"+
                "de_hope_date_after = '3',"+
                "de_baesong_content = '배송 안내 입력전입니다.',"+
                "de_change_content = '교환/반품 안내 입력전입니다.',"+
                "de_rel_list_use = '1',"+
                "de_rel_list_skin = 'relation.10.skin.php',"+
                "de_rel_list_mod = '3',"+
                "de_rel_img_width = '"+simg_width+"',"+
                "de_rel_img_height ='"+simg_height+"',"+
                "de_mobile_rel_list_use = '1',"+
                "de_mobile_rel_list_skin = 'relation.10.skin.php',"+
                "de_mobile_rel_list_mod = '3',"+
                "de_mobile_rel_img_width = '"+simg_width+"',"+
                "de_mobile_rel_img_height='"+simg_height+"',"+
                "de_search_list_skin = 'list.10.skin.php',"+
                "de_search_img_width = '"+simg_width+"',"+
                "de_search_img_height = '"+simg_height+"',"+
                "de_search_list_mod = '3',"+
                "de_search_list_row = '5',"+
                "de_mobile_search_list_skin = 'list.10.skin.php',"+
                "de_mobile_search_img_width = '"+simg_width+"',"+
                "de_mobile_search_img_height = '"+simg_height+"',"+
                "de_mobile_search_list_mod = '3',"+
                "de_mobile_search_list_row = '5',"+
                "de_listtype_list_skin = 'list.10.skin.php',"+
                "de_listtype_img_width = '"+simg_width+"',"+
                "de_listtype_img_height = '"+simg_height+"',"+
                "de_listtype_list_mod = '3',"+
                "de_listtype_list_row = '5',"+
                "de_mobile_listtype_list_skin = 'list.10.skin.php',"+
                "de_mobile_listtype_img_width = '"+simg_width+"',"+
                "de_mobile_listtype_img_height = '"+simg_height+"',"+
                "de_mobile_listtype_list_mod = '3',"+
                "de_mobile_listtype_list_row = '5',"+
                "de_simg_width = '"+simg_width+"',"+
                "de_simg_height ='"+simg_height+"',"+
                "de_mimg_width = '"+mimg_width+"',"+
                "de_mimg_height ='"+mimg_height+"',"+
                "de_item_use_use = '1',"+
                "de_level_sell = '1',"+
                "de_code_dup_use = '1',"+
                "de_card_test = '1',"+
                "de_sms_cont1 = '{이름}님의 회원가입을 축하드립니다.\nID:{회원아이디}\n{회사명}',"+
                "de_sms_cont2 = '{이름}님 주문해주셔서 고맙습니다.\n{주문번호}\n{주문금액}원\n{회사명}',"+
                "de_sms_cont3 = '{이름}님께서 주문하셨습니다.\n{주문번호}\n{주문금액}원\n{회사명}',"+
                "de_sms_cont4 = '{이름}님 입금 감사합니다.\n{입금액}원\n주문번호:\n{주문번호}\n{회사명}',"+
                "de_sms_cont5 = '{이름}님 배송합니다.\n택배:{택배회사}\n운송장번호:\n{운송장번호}\n{회사명}'";

                isSuccess=dbc.insert(sql);
                if(isSuccess==1){
                	System.out.println("쇼핑몰 설정 끝");
                }
                
                //게시판 그룹 생성
                sql="insert into "+table_prefix+"group set gr_id='shop',gr_subject='쇼핑몰'";
                dbc.insert(sql);
                
                
                //게시판 생성
                String[] bo_table={"qa","free","notice"};
                String[] bo_subject={"질문답변","자유게시판","공지사항"};
                
              
                for(int i=0;i<bo_table.length;i++){
                	sql="insert into "+table_prefix+"board"+
                        "set bo_table = "+bo_table[i]+","+
                        "gr_id = 'shop',"+
                        "bo_subject = "+bo_subject[i]+","+
                        "bo_device = both,"+
                        "bo_admin = '',"+
                        "bo_list_level = '1',"+
                        "bo_read_level = '1',"+
                        "bo_write_level = '1',"+
                        "bo_reply_level = '1',"+
                        "bo_comment_level = '1',"+
                        "bo_html_level = '1',"+
                        "bo_link_level = '1',"+
                        "bo_count_modify = '1',"+
                        "bo_count_delete = '1',"+
                        "bo_upload_level = '1',"+
                        "bo_download_level = '1',"+
                        "bo_read_point = '-1',"+
                        "bo_write_point  = '5',"+
                        "bo_comment_point = '1',"+
                        "bo_download_point   = '-20',"+
                        "bo_use_category     = '0',"+
                        "bo_category_list    = '',"+
                        "bo_use_sideview     = '0',"+
                        "bo_use_file_content = '0',"+
                        "bo_use_secret       = '0',"+
                        "bo_use_dhtml_editor = '0',"+
                        "bo_use_rss_view     = '0',"+
                        "bo_use_good         = '0',"+
                        "bo_use_nogood       = '0',"+
                        "bo_use_name         = '0',"+
                        "bo_use_signature    = '0',"+
                        "bo_use_ip_view      = '0',"+
                        "bo_use_list_view    = '0',"+
                        "bo_use_list_content = '0',"+
                        "bo_use_email        = '0',"+
                        "bo_table_width      = '100',"+
                        "bo_subject_len      = '60',"+
                        "bo_mobile_subject_len      = '30',"+
                        "bo_page_rows        = '15',"+
                        "bo_mobile_page_rows = '15',"+
                        "bo_new              = '24',"+
                        "bo_hot              = '100',"+
                        "bo_image_width      = '600',"+
                        "bo_skin             = 'basic',"+
                        "bo_mobile_skin      = 'basic',"+
                        "bo_include_head     = '_head.php',"+
                        "bo_include_tail     = '_tail.php',"+
                        "bo_content_head     = '',"+
                        "bo_content_tail     = '',"+
                        "bo_mobile_content_head     = '',"+
                        "bo_mobile_content_tail     = '',"+
                        "bo_insert_content   = '',"+
                        "bo_gallery_cols     = '4',"+
                        "bo_gallery_width    = '174',"+
                        "bo_gallery_height   = '124',"+
                        "bo_mobile_gallery_width = '125',"+
                        "bo_mobile_gallery_height= '100',"+
                        "bo_upload_count     = '2',"+
                        "bo_upload_size      = '1048576',"+
                        "bo_reply_order      = '1',"+
                        "bo_use_search       = '0',"+
                        "bo_order            = '0'";
                	
                	
                	  isSuccess=dbc.insert(sql);
                	  
                	  sql=filelib.getFileContent(new File(getServletContext().getRealPath("../adm/sql_write.sql")));
                	  String create_table=table_prefix+"write_"+bo_table[i];
                	  
                	  
                	  
                	  
                	  
                	  
                	
                }//for
                
              
              
                
}//if
%>

<li>디비설정완료</li>


<!---------------------------------------------------------  -->
<!--  디렉토리생성 -->
<%
String data_path="/data/";
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
	File file = new File(dir_arr[i]);
	file.mkdir();
}	
	
	
%>













