/*
 * ggjghjghjgjghjhhhhj
 * svjvjvjvjvj1aassa
 */



package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ListDao {
	
	Connection conn;
	
	public ListDao() {
		
		conn = new DBConnection().getConn();
	}
	
	int listSize = 10;
	int blockSize = 2;
	int nowPage = 1; //getter/setter

	int totSize = 0;
	int totPage  = 0; //getter
	int totBlock = 0; //getter
	int nowBlock = 0;

	int endPage   = 0; //getter
	int startPage = 0; //getter

	int endNo   = 0; //getter
	int startNo = 0; //getter
	
	public Connection getConn() {
		return conn;
	}
	public void setConn(Connection conn) {
		this.conn = conn;
	}
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	} 
	public int getTotSize() {
		return totSize;
	}
	public void setTotSize(int totSize) {
		this.totSize = totSize;
	}
	public int getTotPage() {
		return totPage;
	}
	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}
	public int getTotBlock() {
		return totBlock;
	}
	public void setTotBlock(int totBlock) {
		this.totBlock = totBlock;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	
	
	public void pageCompute(String findStr) {
		String sql = "select count(serial) cnt from board where "
				   + " name like ? "
				   + " or doc like ? ";
				
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ findStr + "%");
			ps.setString(2, "%"+ findStr + "%");
			
			ResultSet rs = ps.executeQuery();
			rs.next();

			totSize = rs.getInt("cnt");
			
			totPage  = (int)Math.ceil(totSize/(double)listSize);
			totBlock = (int)Math.ceil(totPage/(double)blockSize);
			nowBlock = (int)Math.ceil(nowPage/(double)blockSize);

			endPage   = nowBlock * blockSize;
			startPage = endPage - blockSize + 1;
			if(endPage > totPage) endPage = totPage;

			endNo   = nowPage * listSize;
			startNo = endNo - listSize + 1;
			if(endNo > totSize) endNo = totSize;
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public List<ListVo> select(String findStr){
		pageCompute(findStr);
		List<ListVo> list = new ArrayList<>();
		String sql = "select * from ("
				   + "   select rownum num, r.* from ( "
				   + "     select * from board where "
				   + "       name like ? "
				   + "       or doc like ? "
				   + "     )r "
				   + ") where num between ? and ? ";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ findStr + "%");
			ps.setString(2, "%"+ findStr + "%");
			ps.setInt(3, startNo);
			ps.setInt(4, endNo);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ListVo vo = new ListVo();
					vo.setSerial(Integer.parseInt(rs.getString("serial")));
					vo.setName(rs.getString("name"));
					vo.setDoc(rs.getString("doc"));
					vo.setBdate(rs.getDate("bdate").toString());
					
				list.add(vo);
			}
		
		}catch(Exception ex) {
			ex.printStackTrace();
			list = null;
		}finally {
			try {
				conn.close();
				conn = null;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
	}
	
	public boolean insert(ListVo vo) {
		boolean b = true;
		String sql = "insert into board values(?,?,seq_serial.nextval,?,sysdate,1)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getDoc());
			
			int cnt = ps.executeUpdate(); //insert, update, delete
			if(cnt <= 0) b=false;
				
		}catch(Exception ex){
			ex.printStackTrace();
			b = false;
		}finally {
			return b;
		}
	}
	
	   public boolean delete(ListVo vo) { // 삭제
		      boolean b = true;
		      String sql = "delete from board where serial = ? and pwd = ?";
		      
		      try {
		         PreparedStatement ps = conn.prepareStatement(sql);
		         ps.setInt(1, vo.getSerial());
		         ps.setString(2, vo.getPwd());
		         int cnt = ps.executeUpdate();
		         
		         if(cnt <= 0) {
		            b = false;
		         }
		      }catch(Exception ex) {
		         ex.printStackTrace();
		         b = false;
		      }finally {
		         return b;
		      }
		   }
	  
	
}
