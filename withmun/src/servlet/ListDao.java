package servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ListDao {

	Connection conn = null;
	
	int listSize = 9;
	int blockSize = 2;
	int nowPage = 1;
	
	int totSize = 0;
	int totPage = 0;
	int totBlock = 0;
	int nowBlock = 0;
	
	int endPage = 0;
	int startPage = 0;
	
	int endNo = 0;
	int startNo = 0;
	
	/*public ListDao(){
		conn = new DBConnection().getConn();	//DBConnection 클래스 생성하자
	}
	*/
}
