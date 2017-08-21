package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

public class Login implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Login 실행.");
		String id = request.getParameter("member_id");
		String pwd = request.getParameter("password");

		MemberDao dao = MemberDao.getInstance();
		int result = dao.login(id, pwd);
		System.out.println(id + ", " + pwd);
		if(result>0){
			System.out.println("Login 성공  by " + id);
			request.setAttribute("id", id); 
		} else if(result==0){
			System.out.println("비밀번호가 맞지 않습니다");
		}else{
			System.out.println("해당 ID가 없음");
		}
		request.setAttribute("result", result);
		return "login.jsp";
	}

}
