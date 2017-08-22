package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Member;

public class MemberDao {
	private static MemberDao instance;

	private MemberDao() {

	}

	public static MemberDao getInstance() {
		if (instance == null) {
			instance = new MemberDao();
		}
		return instance;
	}

	private Connection getConnection() {
		Connection con = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			con = ds.getConnection();
			System.out.println("DB���Ἲ��");
		} catch (Exception e) {
			System.out.println("DB�������");
			System.out.println(e.getMessage());
		}
		return con;
	}

	public int insert(Member member) {
		int result = -1;
		Connection con = null;
		PreparedStatement pstmt = null;
		// Ż����, ��ȭ��ȣ , ������ ���Խ� �������� ����. = null
		// �⺻�̹��� = 0(img url ���� ��)
		// status 0 = Ż��, 1 = �����, 2 = �Ͻ�����(��Ȱ��ȭ)
		String sql = "insert into MEMBER values (?,?,?,?,1,sysdate,sysdate,'../img_all/default_profile.png',null,null)";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getUserid());
			pstmt.setString(2, member.getUsername());
			pstmt.setString(3, member.getPassword());
			pstmt.setString(4, member.getEmail());
			result = pstmt.executeUpdate();
			if (result > 0) {
				System.out.println("���Լ���..");
			}
		} catch (Exception e) {
			System.out.println("���Խ���..");
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
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
			sql.append("select password from MEMBER where userid = ?");
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			// ���̵�� �н����尡 ��ġ�ϴ��� �˻�
			if (rs.next()) {
				dbPass = rs.getString("password");
				if (dbPass.equals(pwd)) {
					result = 1;
					System.out.println("�α��� ����");
					// �α��� ���� = 1
				} else {
					result = 0;
					System.out.println("�α��� ���� ��й�ȣ Ʋ��");
					// �н����尡 �ٸ��� = 0
				}
			} else {
				result = -1;
				System.out.println("�α��� ���� ���̵� ����");
				// ���̵� �ٸ��� = -1
			}
			return result;
		} catch (Exception e) {
			System.out.println("�α��� ����");
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

	public Member getMember(String id) {
		Member member = new Member();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from MEMBER where userid = ?";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member.setUserid(rs.getString("userid"));
				member.setUsername(rs.getString("username"));
				member.setProfile_image(rs.getString("profile_image"));
				member.setTel(rs.getString("tel"));
				member.setEmail(rs.getString("email"));
				member.setBirth(rs.getDate("birth"));
				member.setCreated(rs.getDate("created"));
				member.setModifed(rs.getDate("modified"));
				member.setPassword(rs.getString("password"));
			} else {
				System.out.println("��� �ҷ����� ����");
				// ���̵� �ٸ��� = -1
			}
		} catch (Exception e) {
			System.out.println("��� �ҷ����� ����");
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
		return member;
	}

	public List<Member> searchMember(String searchTerm) {
		List<Member> list = new ArrayList<Member>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("searchTerm> " + searchTerm);
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select * from MEMBER where userid like ('%' || ? || '%') or username like ('%' || ? || '%')");
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, searchTerm);
			pstmt.setString(2, searchTerm);
			
			rs = pstmt.executeQuery();
			while (true) {
				if (rs.next()) {
					Member member = new Member();
					member.setUserid(rs.getString("userid"));
					member.setUsername(rs.getString("username"));
					member.setTel(rs.getString("tel"));
					member.setEmail(rs.getString("email"));
					member.setBirth(rs.getDate("birth"));
					member.setProfile_image(rs.getString("profile_image"));
					list.add(member);
				} else {
					break;
				}
			}
		} catch (Exception e) {
			System.out.println("�˻� ��������");
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
		return list;
	}
}