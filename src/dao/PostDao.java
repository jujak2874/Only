package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Post;

public class PostDao {
	private static PostDao instance;

	private PostDao() {
	}

	public static PostDao getInstance() {
		if (instance == null) {
			instance = new PostDao();
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

	public long insertPost(Post post) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		// postID생성
		long myId = 0;
		String sqlIdentifier = "select seq_pid.NEXTVAL from dual";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sqlIdentifier);
			synchronized (this) {
				ResultSet rs = pstmt.executeQuery();
				if (rs.next()) {
					myId = rs.getLong(1);
					System.out.println("seq_pid: " + myId);
				}
			}
		} catch (Exception e) {

		}

		String sql = "insert into POST values(?,sysdate,0,?,?,?,?,null,0)";
		try {
			/*con = getConnection();*/
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, myId);
			// question
			pstmt.setString(2, null);
			// text
			pstmt.setString(3, post.getText());
			// URL
			pstmt.setString(4, post.getUrl());
			// mid
			pstmt.setString(5, post.getMember_id());
			result = pstmt.executeUpdate();
			System.out.println("작성성공 from DAO");
		} catch (Exception e) {
			myId = 0;
			System.out.println("작성실패 from DAO");
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
		return myId;
	}

	public List<Post> postView(Post post) {
		List<Post> list = new ArrayList<Post>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from post, follow where userid1 = ? and userid = userid2 and status = y order by pid desc";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, post.getMember_id());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				post.setPost_id(rs.getString("pid"));
				post.setMember_id(rs.getString("member_id"));
				post.setWrite_date(rs.getDate("created"));
				post.setUrl(rs.getString("url"));
				post.setText(rs.getString("text"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				con.close();
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
			}
		}
		return list;
	}
}
