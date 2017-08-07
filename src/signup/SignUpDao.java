package signup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SignUpDao {
	private static SignUpDao instance;

	private SignUpDao() {

	}

	public static SignUpDao getInstance() {
		if (instance == null) {
			instance = new SignUpDao();
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

	public int insert(SignUp signUp) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		// 탈퇴일, 전화번호 , 생일은 가입시 수집하지 않음. = null
		// 기본이미지 = 0(img url 넣을 것)
		// status 0 = 탈퇴, 1 = 사용중, 2 = 일시정지(비활성화)
		String sql = "insert into MEMBER " + "values (?,?,?,?,1,sysdate,null,0,null,null)";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, signUp.getMember_id());
			pstmt.setString(2, signUp.getNickname());
			pstmt.setString(3, signUp.getPassword());
			pstmt.setString(4, signUp.getEmail());
			result = pstmt.executeUpdate();
			System.out.println("가입성공");
			System.out.println();
		} catch (Exception e) {
			System.out.println("가입실패");
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
			}
		}
		return result;
	}

	public int login(String id, String pwd) {
		int result = -1;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbPass = "";

		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select password from MEMBER where MEMBER_ID = ?");
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			// 아이디와 패스워드가 일치하는지 검사
			if (rs.next()) {
				dbPass = rs.getString("password");
				if (dbPass.equals(pwd)) {
					result = 1;
					System.out.println("로그인 성공");
					// 로그인 성공 = 1
				} else {
					result = 0;
					System.out.println("로그인 실패 비밀번호 틀림");
					// 패스워드가 다를때 = 0
				}
			} else {
				result = -1;
				System.out.println("로그인 실패 아이디 없음");
				// 아이디가 다를때 = -1
			}
			return result;
		} catch (Exception e) {
			System.out.println("로그인 실패");
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
			}
		}
		return result;
	}
}
