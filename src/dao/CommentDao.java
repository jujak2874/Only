package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Comments;
import dto.Post;

public class CommentDao {
	private static CommentDao instance;
	
	private CommentDao() {
		
	}
	public static CommentDao getInstance() {
		if (instance == null) {
			instance = new CommentDao();
		}
		return instance;
	}
	
	private Connection getConnection() {
		Connection con = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			con = ds.getConnection();
			System.out.println("DB연결성공");
		} catch (Exception e) {
			System.out.println("DB연결실패");
			System.out.println(e.getMessage());
		}
		return con;
	}
	
	public long insertComment(Comments comment) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		String sql = "insert into COMMENTS values(?,?,?,sysdate,?,?,?)";
		try {
			/* con = getConnection(); */
			pstmt = con.prepareStatement(sql);
			// text
			pstmt.setString(1, "text");
			// userId
			pstmt.setString(2, "userId");
			// postId
			pstmt.setInt(3, 1);
			// commentId
			pstmt.setInt(4, 1);
			// delStatus
			pstmt.setString(5, "Y");
			// modified
			pstmt.setDate(6, null);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
			}
		}
		return result;
	}
}
