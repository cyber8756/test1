package dbconnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLSyntaxErrorException;

 

public class DBConnector {
	String driver = "org.mariadb.jdbc.Driver";
	//String url = "jdbc:mariadb://localhost:3306/sirgjw";
	String url = "jdbc:mariadb://sirgjw.gnutest.com:3306/sirgjw_test";
	String uId = "sirgjw";
	String uPwd = "ekffur123!@#";

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	private static DBConnector dbc;
	
	
	private DBConnector() {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, uId, uPwd);

			if (con != null) {
				System.out.println("데이터 베이스 접속 성공");
			}

		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패");
		} catch (SQLException e) {
			System.out.println("데이터 베이스 접속 실패");
		}
	}
	
	public static DBConnector getInstance(){
		if(dbc==null){
			dbc=new DBConnector();
		}
		return dbc;
	}
	
	

	public ResultSet select(String sql) {

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();		
		}catch(SQLSyntaxErrorException e){
			System.out.println("쿼리문법에러:"+sql);
		}catch (SQLException e) {
			System.out.println("쿼리 수행 실패(select)"+sql);
			e.printStackTrace();
		}
		
		return rs;
	}
	
	
	public int insert(String sql){
		int isSuccess=0;
		try {
			pstmt=con.prepareStatement(sql);
			isSuccess=pstmt.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("insert 에러");
			e.printStackTrace();
		}		
		return isSuccess;
	}
	
	
	 
	public void set(String sql){
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();		
		} catch (SQLException e) {
			System.out.println("쿼리 수행 실패(set)"+sql);
			e.printStackTrace();
		}
	}
	
	 
	public void create(String sql){
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();		
		} catch (SQLException e) {
			System.out.println("쿼리 수행 실패(create)");
		}
	}
	
	
	
	
	
	
	
	public int update_G5config(String sql,G5ConfigVO vo){
		int isSuccess=0;
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getCf_title());
			pstmt.setString(2, vo.getCf_admin());
			pstmt.setString(3, vo.getCf_admin_email());
			pstmt.setString(4, vo.getCf_admin_email_name());
			pstmt.setInt(5,vo.getCf_use_point());
			pstmt.setInt(6, vo.getCf_login_point());
			pstmt.setInt(7,vo.getCf_memo_send_point());
			pstmt.setInt(8,vo.getCf_cut_name());
			pstmt.setInt(9, vo.getCf_nick_modify());
			pstmt.setInt(10, vo.getCf_open_modify());
			pstmt.setInt(11, vo.getCf_new_del());
			pstmt.setInt(12, vo.getCf_memo_del());
			pstmt.setInt(13, vo.getCf_visit_del());
			pstmt.setInt(14, vo.getCf_popular_del());
			pstmt.setInt(15, vo.getCf_login_minutes());
			pstmt.setInt(16, vo.getCf_new_rows());
			pstmt.setInt(17, vo.getCf_page_rows());
			pstmt.setInt(18, vo.getCf_mobile_page_rows());
			pstmt.setInt(19, vo.getCf_write_pages());
			pstmt.setInt(20, vo.getCf_mobile_pages());
			pstmt.setInt(21, vo.getCf_use_copy_log());
			pstmt.setInt(22, vo.getCf_point_term());
			pstmt.setString(23, vo.getCf_possible_ip());
			pstmt.setString(24, vo.getCf_intercept_ip());
			pstmt.setString(25, vo.getCf_analytics());
			pstmt.setString(26, vo.getCf_add_meta());
			pstmt.setString(27, vo.getCf_syndi_token());
			pstmt.setString(28, vo.getCf_syndi_except());
			pstmt.setInt(29, vo.getCf_delay_sec());
			pstmt.setInt(30, vo.getCf_write_point());
			pstmt.setInt(31, vo.getCf_download_point());
			pstmt.setInt(32, vo.getCf_search_part());
			pstmt.setString(33, vo.getCf_image_extension());
			pstmt.setString(34, vo.getCf_flash_extension());
			pstmt.setString(35, vo.getCf_movie_extension());
			pstmt.setString(36, vo.getCf_filter());
			pstmt.setInt(37, vo.getCf_use_homepage());
			pstmt.setInt(38, vo.getCf_req_homepage());
			pstmt.setInt(39, vo.getCf_use_tel());
			pstmt.setInt(40, vo.getCf_use_hp());
			pstmt.setInt(41, vo.getCf_use_addr());
			pstmt.setInt(42, vo.getCf_req_addr());
			pstmt.setInt(43, vo.getCf_use_signature());
			pstmt.setInt(44, vo.getCf_req_signature());
			pstmt.setInt(45, vo.getCf_register_point());
			pstmt.setInt(46, vo.getCf_leave_day());
			pstmt.setInt(47, vo.getCf_member_icon_size());
			pstmt.setInt(48, vo.getCf_member_icon_width());
			pstmt.setInt(49, vo.getCf_member_icon_height());
			pstmt.setInt(50, vo.getCf_use_recommend());
			pstmt.setInt(51, vo.getCf_recommend_point());
			pstmt.setString(52,vo.getCf_prohibit_id());
			pstmt.setString(53, vo.getCf_prohibit_email());
			pstmt.setString(54, vo.getCf_stipulation());
			pstmt.setString(54, vo.getCf_privacy());
			pstmt.setInt(55, vo.getCf_cert_use());
			pstmt.setString(56, vo.getCf_cert_kcb_cd());
			pstmt.setString(57, vo.getCf_cert_kcp_cd());
			pstmt.setString(58, vo.getCf_lg_mid());
			pstmt.setString(59, vo.getCf_lg_mert_key());
			pstmt.setInt(60, vo.getCf_cert_limit());
			pstmt.setInt(61, vo.getCf_cert_req());
			pstmt.setInt(62, vo.getCf_use_email_certify());
			pstmt.setInt(63, vo.getCf_formmail_is_member());
			pstmt.setInt(64, vo.getCf_cert_limit());
			pstmt.setInt(65, vo.getCf_email_wr_super_admin());
			pstmt.setInt(66, vo.getCf_email_wr_group_admin());
			pstmt.setInt(67, vo.getCf_email_wr_board_admin());
			pstmt.setInt(68, vo.getCf_email_wr_write());
			pstmt.setInt(69, vo.getCf_email_wr_comment_all());
			pstmt.setInt(70, vo.getCf_email_mb_super_admin());
			pstmt.setInt(71, vo.getCf_email_mb_member());
			pstmt.setInt(72, vo.getCf_email_po_super_admin());
			pstmt.setString(73, vo.getCf_facebook_appid());
			pstmt.setString(74, vo.getCf_facebook_secret());
			pstmt.setString(75, vo.getCf_twitter_key());
			pstmt.setString(76, vo.getCf_twitter_secret());
			pstmt.setString(77, vo.getCf_googl_shorturl_apikey());
			pstmt.setString(78,vo.getCf_kakao_js_apikey());
			pstmt.setString(79, vo.getCf_add_script());
			pstmt.setString(80, vo.getCf_icode_id());
			pstmt.setString(81, vo.getCf_icode_pw());
			pstmt.setString(82,vo.getCf_icode_server_ip());
			
			isSuccess=pstmt.executeUpdate();
			
			
			
		}catch (Exception e) {
			System.out.println("update_G5config 쿼리 실패");
			e.printStackTrace();
		}
		return isSuccess;
	}
	
/*	public String sql_query(String sql){
		String mode=null;
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			mode=rs.getString("mode");
		} catch (SQLException e) {
			System.out.println("getSqlmode메서드 에러");
			e.printStackTrace();
		}		
		return mode;
	}*/
	
	
	
	
	
	public void closeDB(){
		try {
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
	}

}
