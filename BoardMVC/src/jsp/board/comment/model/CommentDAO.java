package jsp.board.comment.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jsp.common.util.DBConnection;
import jsp.guestbook.model.GuestbookBean;

public class CommentDAO 
{
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private static CommentDAO instance;
	
	private CommentDAO(){}
	public static CommentDAO getInstance(){
		if(instance==null)
			instance=new CommentDAO();
		return instance;
	}
	
	public int getSeq() 
	{
		int result = 1;
		try {
			conn = DBConnection.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COMMENT_SEQ.NEXTVAL FROM DUAL");

			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery(); 
			if (rs.next())	result = rs.getInt(1);

		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}

		close();
		return result;
	} 
	
	public boolean insertComment(CommentBean comment)
	{
		boolean result = false;
		
		try {
			conn = DBConnection.getConnection();

			conn.setAutoCommit(false);
			
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO BOARD_COMMENT");
			sql.append(" (COMMENT_NUM, COMMENT_BOARD, COMMENT_ID, COMMENT_DATE");
			sql.append(" , COMMENT_PARENT, COMMENT_CONTENT)");
			sql.append(" VALUES(?,?,?,sysdate,?,?)");
	
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, comment.getComment_num());
			pstmt.setInt(2, comment.getComment_board());
			pstmt.setString(3, comment.getComment_id());
			pstmt.setInt(4, comment.getComment_parent());
			pstmt.setString(5, comment.getComment_content());
			
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
	
	public ArrayList<CommentBean> getCommentList(int boardNum)
	{
		ArrayList<CommentBean> list = new ArrayList<CommentBean>();
		
		try {
			conn = DBConnection.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("	SELECT LEVEL, COMMENT_NUM, COMMENT_BOARD,");
			sql.append("			COMMENT_ID, COMMENT_DATE,");
			sql.append("			COMMENT_PARENT, COMMENT_CONTENT");
			sql.append("	FROM BOARD_COMMENT");
			sql.append("	WHERE COMMENT_BOARD = ?");
			sql.append("	START WITH COMMENT_PARENT = 0");
			sql.append("	CONNECT BY PRIOR COMMENT_NUM = COMMENT_PARENT");         
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, boardNum);
			
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				CommentBean comment = new CommentBean();
				comment.setComment_level(rs.getInt("LEVEL"));
				comment.setComment_num(rs.getInt("COMMENT_NUM"));
				comment.setComment_board(rs.getInt("COMMENT_BOARD"));
				comment.setComment_id(rs.getString("COMMENT_ID"));
				comment.setComment_date(rs.getDate("COMMENT_DATE"));
				comment.setComment_parent(rs.getInt("COMMENT_PARENT"));
				comment.setComment_content(rs.getString("COMMENT_CONTENT"));
				list.add(comment);
			}
				
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
		
		close();
		return list;
	} 

	public CommentBean getComment(int comment_num)
	{
		CommentBean comment = null;
		
		try {
			conn = DBConnection.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT * FROM BOARD_COMMENT WHERE COMMENT_NUM = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, comment_num);
			
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				comment = new CommentBean();
				comment.setComment_num(rs.getInt("COMMENT_NUM"));
				comment.setComment_board(rs.getInt("COMMENT_BOARD"));
				comment.setComment_id(rs.getString("COMMENT_ID"));
				comment.setComment_date(rs.getDate("COMMENT_DATE"));
				comment.setComment_parent(rs.getInt("COMMENT_PARENT"));
				comment.setComment_content(rs.getString("COMMENT_CONTENT"));
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		
		close();
		return comment; 
	} 

	public boolean deleteComment(int comment_num) 
	{
		boolean result = false;

		try {
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false); 

			StringBuffer sql = new StringBuffer();
			sql.append("DELETE FROM BOARD_COMMENT");
			sql.append(" WHERE COMMENT_NUM IN");
			sql.append(" (SELECT COMMENT_NUM");
			sql.append(" FROM BOARD_COMMENT");
			sql.append(" START WITH COMMENT_NUM = ?");
			sql.append(" CONNECT BY PRIOR COMMENT_NUM = COMMENT_PARENT) ");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, comment_num);
			
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

	public boolean updateComment(CommentBean comment) 
	{
		boolean result = false;
		
		try{
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false); 
			
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE BOARD_COMMENT SET");
			sql.append(" COMMENT_CONTENT = ?");
			sql.append(" WHERE COMMENT_NUM = ?");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, comment.getComment_content());
			pstmt.setInt(2, comment.getComment_num());

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
