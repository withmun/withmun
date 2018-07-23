/*
 * DB에 연결할 Connection을 반환할 목적
 */

package bean;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	// 필드
	String driver = "oracle.jdbc.driver.OracleDriver";			// oracle JDBC 드라이버 문자열 상수
	String dbUrl = "jdbc:oracle:thin:@192.168.0.7:1521:xe";	// withmun
	
	String dbUser = "withmun";
	String dbPwd = "withmun";
	Connection conn;
	
	// 생성자
	public DBConnection() {
		try {
			// driver loading
			Class.forName(driver);
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}

	// getter
	public Connection getConn() {
		return conn;
	}
	
}
