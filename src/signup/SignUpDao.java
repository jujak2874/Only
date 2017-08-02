package signup;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
			System.out.println("연결성공");
		} catch (Exception e) {
			System.out.println("연결실패 : " + e.getMessage());
		}
		return con;
	}

	public int insert(SignUp signUp) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into MEMBER " + "values (?,?,?,?,1,sysdate,null,0,null,null)";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, signUp.getMember_id());
			pstmt.setString(2, signUp.getNickname());
			pstmt.setString(3, signUp.getPassword());
			pstmt.setString(4, signUp.getEmail());
			result = pstmt.executeUpdate();
			System.out.println("입력성공");
			System.out.println(sql);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println(sql);
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
}
