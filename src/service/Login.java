package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import dao.MemberDao;
import dto.Member;

public class Login implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Login ����.");
		String id = request.getParameter("member_id");
		String pwd = request.getParameter("password");
		System.out.println("고쳤어 테스트");
		MemberDao dao = MemberDao.getInstance();
		int result = dao.login(id, pwd);
		Member member = dao.getMember(id);
		System.out.println(id + ", " + pwd);
		if(result>0){
			System.out.println("Login ����  by " + id);
			request.setAttribute("id", id);
			request.setAttribute("name", member.getUsername());
			request.setAttribute("profile_img", member.getProfile_image());
		} else if(result==0){
			System.out.println("��й�ȣ�� ���� �ʽ��ϴ�");
		}else{
			System.out.println("�ش� ID�� ����");
		}
		request.setAttribute("result", result);
		return "login.jsp";
	}

}
