package jsp.guestbook.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import jsp.common.util.DBConnection;

public class GuestbookDAO 
{
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private static GuestbookDAO instance;
	
	private GuestbookDAO(){}
	public static GuestbookDAO getInstance(){
		if(instance==null)
			instance=new GuestbookDAO();
		return instance;
	}
	
	public int getSeq() 
	{
		int result = 1;
		try {
			conn = DBConnection.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT guestbook_no_seq.NEXTVAL FROM DUAL");

			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery(); 

			if (rs.next())	result = rs.getInt(1);

		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}

		close();
		return result;
	} 

	public boolean guestbookInsert(GuestbookBean guestbook)
	{
		boolean result = false;
		
		try {
			conn = DBConnection.getConnection();

			conn.setAutoCommit(false);
			
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO GUESTBOOK");
			sql.append(" (GUESTBOOK_NO, GUESTBOOK_ID, GUESTBOOK_PASSWORD, GUESTBOOK_CONTENT");
			sql.append(" , GUESTBOOK_GROUP, GUESTBOOK_PARENT, GUESTBOOK_DATE)");
			sql.append(" VALUES(?,?,?,?,?,?,sysdate)");
			
			int no = guestbook.getGuestbook_no();								
			int group = guestbook.getGuestbook_group(); 	
			int parent = guestbook.getGuestbook_parent(); 	
			
			if(parent == 0) group = no;
	
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			pstmt.setString(2, guestbook.getGuestbook_id());
			pstmt.setString(3, guestbook.getGuestbook_password());
			pstmt.setString(4, guestbook.getGuestbook_content());
			pstmt.setInt(5, group);
			pstmt.setInt(6, parent);

			int flag = pstmt.executeUpdate();
			if(flag > 0){
				result = true;
				conn.commit(); 
			}
			
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			} 
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
		
		close();
		return result;	
	} 
	
	public ArrayList<GuestbookBean> getGuestbookList(int pageNum)
	{
		ArrayList<GuestbookBean> list = new ArrayList<GuestbookBean>();
		
		try {
			conn = DBConnection.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT * FROM");
			sql.append(" (SELECT  ROWNUM AS rnum, data.* FROM ");
			sql.append("	(SELECT LEVEL, guestbook_no, guestbook_id,");
			sql.append("			guestbook_password, guestbook_content,");
			sql.append("			guestbook_group, guestbook_parent, guestbook_date");
			sql.append("	FROM GUESTBOOK");
			sql.append("	START WITH guestbook_parent = 0");
			sql.append("	CONNECT BY PRIOR guestbook_no = guestbook_parent");
			sql.append("	ORDER SIBLINGS BY guestbook_group desc)");              
			sql.append(" data) ");
			sql.append("WHERE rnum>=? and rnum<=?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, pageNum);
			pstmt.setInt(2, pageNum+4);
			
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				GuestbookBean guestbook = new GuestbookBean();
				guestbook.setGuestbook_level(rs.getInt("LEVEL"));
				guestbook.setGuestbook_no(rs.getInt("guestbook_no"));
				guestbook.setGuestbook_id(rs.getString("guestbook_id"));
				guestbook.setGuestbook_password(rs.getString("guestbook_password"));
				guestbook.setGuestbook_content(rs.getString("guestbook_content"));
				guestbook.setGuestbook_group(rs.getInt("guestbook_group"));
				guestbook.setGuestbook_parent(rs.getInt("guestbook_parent"));
				guestbook.setGuestbook_date(rs.getDate("guestbook_date"));
				list.add(guestbook);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
		
		close();
		return list;
	}
	
	public int getGuestbookCount()
	{
		int result = 0;
		
		try {
			conn = DBConnection.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(*) FROM GUESTBOOK");
			
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if(rs.next())	result = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
		
		close();
		return result;	
	}
	
	public GuestbookBean getGuestbook(int g_num)
	{
		GuestbookBean guestbook = null;
		
		try {
			conn = DBConnection.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT * FROM GUESTBOOK where guestbook_no = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, g_num);
			
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				guestbook = new GuestbookBean();
				guestbook.setGuestbook_no(rs.getInt("guestbook_no"));
				guestbook.setGuestbook_id(rs.getString("guestbook_id"));
				guestbook.setGuestbook_password(rs.getString("guestbook_password"));
				guestbook.setGuestbook_content(rs.getString("guestbook_content"));
				guestbook.setGuestbook_group(rs.getInt("guestbook_group"));
				guestbook.setGuestbook_parent(rs.getInt("guestbook_parent"));
				guestbook.setGuestbook_date(rs.getDate("guestbook_date"));
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		
		close();
		return guestbook; 
	} 
	
	public String getPassword(int guestbook_no)
	{
		String password = null;
		
		try {
			conn = DBConnection.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT guestbook_password FROM GUESTBOOK where guestbook_no = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, guestbook_no);
			
			rs = pstmt.executeQuery();
			if(rs.next()) password = rs.getString("guestbook_password");
			
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		
		close();
		return password;
	} 

	public boolean deleteGuestbook(int guestbook_no) 
	{
		boolean result = false;

		try {
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false); 

			StringBuffer sql = new StringBuffer();
			sql.append("DELETE FROM GUESTBOOK");
			sql.append(" WHERE guestbook_no IN");
			sql.append(" (SELECT guestbook_no");
			sql.append(" FROM GUESTBOOK");
			sql.append(" START WITH guestbook_no = ?");
			sql.append(" CONNECT BY PRIOR guestbook_no = guestbook_parent) ");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, guestbook_no);
			
			int flag = pstmt.executeUpdate();
			if(flag > 0){
				result = true;
				conn.commit(); 
			}	
			
		} catch (Exception e) {
			try {
				conn.rollback(); 
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
			throw new RuntimeException(e.getMessage());
		}

		close();
		return result;
	} 

	public boolean updateGuestbook(GuestbookBean guestbook) 
	{
		boolean result = false;
		
		try{
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false); 
			
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE GUESTBOOK SET");
			sql.append(" guestbook_id=?");
			sql.append(" ,guestbook_content=?");
			sql.append(" ,guestbook_date=SYSDATE ");
			sql.append("WHERE guestbook_no=?");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, guestbook.getGuestbook_id());
			pstmt.setString(2, guestbook.getGuestbook_content());
			pstmt.setInt(3, guestbook.getGuestbook_no());
			
			int flag = pstmt.executeUpdate();
			if(flag > 0){
				result = true;
				conn.commit(); 
			}
			
		} catch (Exception e) {
			try {
				conn.rollback(); 
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
			throw new RuntimeException(e.getMessage());
		}
	
		close();
		return result;
	} 
	
	private void close()
	{
		try {
			if ( pstmt != null ){ pstmt.close(); pstmt=null; }
			if ( conn != null ){ conn.close(); conn=null;	}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	} 
		
}
