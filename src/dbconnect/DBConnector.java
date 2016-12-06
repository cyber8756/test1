package dbconnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnector {
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/sirgjw";
	String uId = "sirgjw";
	String uPwd = "8989";

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public DBConnector() {
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

	public ResultSet select(String sql) {

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			/*
			 * while(rs.next()){ System.out.println("idx       : " +
			 * rs.getInt("idx")); System.out.println("writer    : " +
			 * rs.getString("writer")); System.out.println("title     : " +
			 * rs.getString("title")); System.out.println("content   : " +
			 * rs.getString("content")); }
			 */

			return rs;
		} catch (SQLException e) {
			System.out.println("쿼리 수행 실패");
		}
		return rs;
	}

}
