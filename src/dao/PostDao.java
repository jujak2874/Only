package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Hashtag;
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

	public int insertPost(Post post) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into POST " + "values(seq_pid.nextval,sysdate,0,?,?,?,?,null,0)";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			// question
			pstmt.setString(1, null);
			// text
			pstmt.setString(2, post.getText());
			// URL
			pstmt.setString(3, post.getUrl());
			// mid
			pstmt.setString(4, post.getMember_id());
			result = pstmt.executeUpdate();
			System.out.println("작성성공");
		} catch (Exception e) {
			System.out.println("작성실패");
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

	public int getPostCurrId() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int postId = 0;

		String sql = "select nvl(max(PID),0) as currPID from post";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){ 
				postId = (int)rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try{if (pstmt != null) pstmt.close();
			if (con != null) con.close();
			if(rs!=null) rs.close();
		}catch(Exception e) { System.out.println(e.getMessage());}
	}
		return postId;
	}

	public int insertHashtag(Hashtag ht) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into hash_tag values (seq_hid.nextval , ?, ?)";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ht.getTag_id());
			pstmt.setInt(2, ht.getPost_id());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try{if (pstmt != null) pstmt.close();
			if (con != null) con.close();
		}catch(Exception e) { System.out.println(e.getMessage());}
	}
		return result;
	}

	public String memberExist(String memberTag) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String userId=null;
		String sql="select userid from member where exists(select userid from member where userid=?) and userid=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberTag);
			pstmt.setString(2, memberTag);
			rs = pstmt.executeQuery();
			if(rs.next()){
				userId=rs.getString(1);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try{if (pstmt != null) pstmt.close();
			if (con != null) con.close();
			if(rs!=null) rs.close();
		}catch(Exception e) { System.out.println(e.getMessage());}
	}
		return userId;
	}

	public int insertMembertag(String memberTag, int postCurrId) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into member_tag values (?,?)";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberTag);
			pstmt.setInt(2, postCurrId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try{if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			}catch(Exception e) { System.out.println(e.getMessage());}
		}
		
		return result;
	}
}
