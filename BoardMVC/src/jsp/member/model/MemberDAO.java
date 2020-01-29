package jsp.member.model;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;

import javax.naming.NamingException;

import jsp.common.util.DBConnection;

public class MemberDAO {
	private static MemberDAO instance;

	private MemberDAO() {
	}

	public static MemberDAO getInstance() {
		if (instance == null)
			instance = new MemberDAO();
		return instance;
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


	public Date stringToDate(MemberBean member) {
		String year = member.getBirthyy();
		String month = member.getBirthmm();
		String day = member.getBirthdd();

		Date birthday = null;

		if (year != null && month != null && day != null)
			birthday = Date.valueOf(year + "-" + month + "-" + day);

		return birthday;

	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


	public void insertMember(MemberBean member) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {

			conn = DBConnection.getConnection();

			conn.setAutoCommit(false);

			StringBuffer sql = new StringBuffer();
			sql.append("insert into JSP_MEMBER values");
			sql.append("(?, ?, ?, ?, ?, ?, ?, ?, sysdate)");
			stringToDate(member);

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.setDate(5, stringToDate(member));
			pstmt.setString(6, member.getMail1() + "@" + member.getMail2());
			pstmt.setString(7, member.getPhone());
			pstmt.setString(8, member.getAddress());

			pstmt.executeUpdate();

			conn.commit();

		} catch (ClassNotFoundException | NamingException | SQLException sqle) {
			conn.rollback();
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


	public MemberBean getUserInfo(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberBean member = null;

		try {
			StringBuffer query = new StringBuffer();
			query.append("SELECT * FROM JSP_MEMBER WHERE ID=?");

			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String birthday = rs.getDate("birth").toString();
				String year = birthday.substring(0, 4);
				String month = birthday.substring(5, 7);
				String day = birthday.substring(8, 10);

				String mail = rs.getString("mail");
				int idx = mail.indexOf("@");
				String mail1 = mail.substring(0, idx);
				String mail2 = mail.substring(idx + 1);

				member = new MemberBean();
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setGender(rs.getString("gender"));
				member.setBirthyy(year);
				member.setBirthmm(month);
				member.setBirthdd(day);
				member.setMail1(mail1);
				member.setMail2(mail2);
				member.setPhone(rs.getString("phone"));
				member.setAddress(rs.getString("address"));
				member.setReg(rs.getTimestamp("reg"));
			}

			return member;

		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


	public ArrayList<MemberBean> getMemberList() {
		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberBean member = null;

		try {
			StringBuffer query = new StringBuffer();
			query.append("SELECT * FROM JSP_MEMBER");

			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				member = new MemberBean();
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setGender(rs.getString("gender"));
				member.setBirthyy(rs.getDate("birth").toString());
				member.setMail1(rs.getString("mail"));
				member.setPhone(rs.getString("phone"));
				member.setAddress(rs.getString("address"));
				member.setReg(rs.getTimestamp("reg"));
				memberList.add(member);
			}

			return memberList;

		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	public void updateMember(MemberBean member) throws SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {

			StringBuffer query = new StringBuffer();
			query.append("UPDATE JSP_MEMBER SET");
			query.append(" PASSWORD=?, MAIL=?, PHONE=?, ADDRESS=?");
			query.append(" WHERE ID=?");

			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());

			conn.setAutoCommit(false);

			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getMail1() + "@" + member.getMail2());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getAddress());
			pstmt.setString(5, member.getId());

			int flag = pstmt.executeUpdate();
			if (flag > 0) {
				conn.commit();
			}

		} catch (Exception sqle) {
			conn.rollback();
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	@SuppressWarnings("resource")
	public int deleteMember(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbpw = "";
		int x = -1;

		try {
			StringBuffer query1 = new StringBuffer();
			query1.append("SELECT PASSWORD FROM JSP_MEMBER WHERE ID=?");

			StringBuffer query2 = new StringBuffer();
			query2.append("DELETE FROM JSP_MEMBER WHERE ID=?");

			conn = DBConnection.getConnection();

			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(query1.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpw = rs.getString("password");
				if (dbpw.equals(pw)) {
					pstmt = conn.prepareStatement(query2.toString());
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					conn.commit();
					x = 1;
				} else {
					x = 0;
				}
			}

			return x;

		} catch (Exception sqle) {
			try {
				conn.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	public int loginCheck(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbPW = "";
		int x = -1;

		try {
			StringBuffer query = new StringBuffer();
			query.append("SELECT PASSWORD FROM JSP_MEMBER WHERE ID=?");

			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbPW = rs.getString("password");

				if (dbPW.equals(pw))
					x = 1;
				else
					x = 0;

			} else {
				x = -1;
			}

			return x;

		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	public boolean duplicateIdCheck(String id) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		boolean x = false;

		try {
			StringBuffer query = new StringBuffer();
			query.append("SELECT ID FROM JSP_MEMBER WHERE ID=?");

			conn = DBConnection.getConnection();
			pstm = conn.prepareStatement(query.toString());
			pstm.setString(1, id);
			rs = pstm.executeQuery();

			if (rs.next())
				x = true;

			return x;

		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
					pstm = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	public String searchID(String name, String phone) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String searchID = "";

		try {
			StringBuffer query = new StringBuffer();
			query.append("SELECT ID FROM JSP_MEMBER WHERE NAME=? AND PHONE = ?");

			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				searchID = rs.getString("id");
			}

			return searchID;

		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	public String searchPW(String id, String phone) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String searchPW = "";

		try {
			StringBuffer query = new StringBuffer();
			query.append("SELECT PASSWORD FROM JSP_MEMBER WHERE ID=? AND PHONE = ?");

			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, phone);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				searchPW = rs.getString("password");
			}

			return searchPW;

		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}

}
