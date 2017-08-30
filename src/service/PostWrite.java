package service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.PostDao;
import dto.Post;
import dto.Hashtag;

public class PostWrite implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			// 파일이 저장되는 경로
			String savePath = request.getServletContext().getRealPath("upload");
			int size = 1024 * 1024 * 15;
			MultipartRequest multi = new MultipartRequest(request, savePath, size, "utf-8", new DefaultFileRenamePolicy());
			String text = multi.getParameter("text");
			String member_id = multi.getParameter("member_id");
			// 파일이름, 중복되는 파일이름은 뒤에 숫자가 늘어남
			String fileName = multi.getFilesystemName("imageUpload");
			// 파일 URL
			String fileFullPath = savePath + "/" + fileName;
			System.out.println("text : " + text);
			System.out.println("member_id : " + member_id);
			System.out.println("url : " + fileFullPath);
			//해시태그, 멤버태그
			String hashtags=multi.getParameter("hashtag");
			String membertags=multi.getParameter("membertag");
			System.out.println("해시태그 입력값들: "+ hashtags);
			System.out.println("멤버태그 입력값들: "+ membertags);
			String[] splitedHashTags=hashtags.split("#");
			String[] splitedMemberTags=membertags.split(",");
			//#으로 구분한 0번째 인덱스 해시태그는 공백이기 때문에 1번째 인덱스부터 불러온다. 
			for(int i=1;i<splitedHashTags.length;i++){
				System.out.println(i+"번째 해시태그 " + splitedHashTags[i]);
			}
			for(int i=0;i<splitedMemberTags.length;i++){
				System.out.println(i+1+"번째 멤버태그 " + splitedMemberTags[i]);
			}
			PostDao dao = PostDao.getInstance();
			Post post = new Post();
			post.setMember_id(member_id);
			post.setText(text);
			if(fileName==null) {
				post.setUrl(null);
			}else {
				post.setUrl(fileFullPath);
			}
			int result = dao.insertPost(post);

			if (result > 0) {
				System.out.println("포스트 작성성공");
			} else {
				System.out.println("포스트 작성실패");
			}
			
			int postCurrId=dao.getPostCurrId();//포스트 작성 후 포스트 아이디 값 부르기
			System.out.println( "포스트 현재 아이디: "+ postCurrId);
			
			Hashtag ht=new Hashtag();
			ht.setPost_id(postCurrId);//해시태그 객체에 포스트 아이디 입력
			for(int i=1;i<splitedHashTags.length;i++){
				ht.setTag_id(splitedHashTags[i]);//입력한 값을 해시태그 객체에 대입
				int hashtagInsertResult=dao.insertHashtag(ht);//만들어진 해시태그 객체를 DB에 입력
				if(hashtagInsertResult>0){
					System.out.println(i+"번째 해시태그 입력성공");
				}
			}
			
			//멤버태그에 포스트 아이디와 멤버아이디 입력
			//존재하지 않는 아이디를 하나라도 입력하면 무결성 제약조건에 걸리기 때문에 브레이크 걸기
			for(int i=0;i<splitedMemberTags.length;i++){
				if(dao.memberExist(splitedMemberTags[i])==null){
					System.out.println(i+1 +"번째 입력한 멤버아이디 "+ splitedMemberTags[i]+"가 존재하지 않습니다");
					request.setAttribute("notExistingMemberOrder", i);
					request.setAttribute("notExistingMemberId", splitedMemberTags[i]);
					return "notExistMember.jsp";
				}else{
					int mtagResult=dao.insertMembertag(splitedMemberTags[i],postCurrId);
					if(mtagResult>0) System.out.println(i+1+"번째 멤버태그 "+splitedMemberTags[i]+ "가 DB에 입력되었습니다.");
				}
			}
			System.out.println("for문 끝나고 여기는 오니????===========================");
			request.setAttribute("result", result);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		return "postWriteResult.jsp";
	}
}
