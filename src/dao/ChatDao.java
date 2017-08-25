package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.naming.*;
import javax.sql.*;

import dto.ChatMessage;

public class ChatDao {
	private static ChatDao instance;

	private ChatDao() {
	}

	public static ChatDao getInstance() {
		if (instance == null) {
			instance = new ChatDao();
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

	// 채팅방 있는지 확인
	// 있으면 그 채팅방에 메시지 저장, 없으면 채팅방을 만든 후 저장
	// ChatService(채팅메시지, 받는사람, 보내는사람)
	public void ChatService(String chatT, String getT, String sendT) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String chatroom = ChkCR(getT, sendT); // 채팅방 아이디를 받아옴
		if (chatroom == null) {
			System.out.println("없음 ==> 채팅방 생성");
			chatroom = CreateChat(getT, sendT); // 채팅방 생성
		} else {
			System.out.println("있음");
		}
		String sql = "insert into chat_message " + "values(?,?,sysdate,mid_seq.nextval,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, getT);
			pstmt.setString(2, chatT);
			pstmt.setString(3, chatroom);
			pstmt.setInt(4, 0);
			pstmt.setString(5, sendT);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
	}

	private String CreateChat(String getT, String sendT) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into chat " + " values(?)";
		String chatroom = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			if (getT.compareTo(sendT) > 0) {
				pstmt.setString(1, getT + ":" + sendT);
				chatroom = getT + ":" + sendT;
			} else {
				pstmt.setString(1, sendT + ":" + getT);
				chatroom = sendT + ":" + getT;
			}
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return chatroom;
	}

	private String ChkCR(String getT, String sendT) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select cid from chat where cid = ?";
		String chatRoom = "";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			if (getT.compareTo(sendT) > 0) {
				pstmt.setString(1, getT + ":" + sendT);
			} else {
				pstmt.setString(1, sendT + ":" + getT);
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				chatRoom = rs.getString(1);
				System.out.println(chatRoom);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
			}
		}
		return chatRoom;
	}

	public List<ChatMessage> chatload(String chatroom) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from chat_message where cid=? order by mid asc";
		ResultSet rs = null;
		List<ChatMessage> chathistory = new ArrayList<ChatMessage>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, chatroom);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ChatMessage cm = new ChatMessage();
				cm.setMessage(rs.getString("message"));
				cm.setUserid(rs.getString("userid"));
				cm.setCreated(rs.getDate("created"));
				cm.setDel_status(rs.getInt("del_status"));
				cm.setMid(rs.getInt("mid"));
				chathistory.add(cm);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
			}
		}
		return chathistory;
	}

	public List<ChatMessage> chatRLoad(String user) {
		System.out.println("chatRLoad()실행.. " + user);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ChatMessage> messageList = new ArrayList<>();
		//String sql = "select * from chat_message where mid in (select max(mid) from CHAT_MESSAGE where cid in (SELECT cid FROM chat where cid like ('%' || ? || '%')) group by cid) order by created";
		String sql = "select * from chat_message where mid in (select max(mid) from CHAT_MESSAGE where cid in (SELECT cid FROM chat where cid like ('%' || ? || '%')) group by cid) order by created";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					System.out.println(rs.getString("message"));
					ChatMessage cm = new ChatMessage();
					cm.setMessage(rs.getString("message"));
					cm.setUserid(rs.getString("userid"));
					cm.setCreated(rs.getDate("created"));
					cm.setDel_status(rs.getInt("del_status"));
					cm.setMid(rs.getInt("mid"));
					cm.setCid(rs.getString("cid"));
					messageList.add(cm);
				} while (rs.next());
			} else{
				System.out.println("메시지 기록 없음");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
			}
		}
		return messageList;
	}
}