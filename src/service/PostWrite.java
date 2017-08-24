package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.PostDao;
import dto.Post;

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
			String fileName = multi.getFilesystemName("imageUpload");
			String fileFullPath = savePath + "/" + fileName;

			System.out.println("text : " + text);
			System.out.println("member_id : " + member_id);
			System.out.println("url : " + fileFullPath);
			PostDao dao = PostDao.getInstance();
			Post post = new Post();
			post.setMember_id(member_id);
			post.setText(text);
			post.setUrl(fileFullPath);
			int result = dao.insertPost(post);
			if (result > 0) {
				System.out.println("작성성공");
			} else {
				System.out.println("작성실패");
			}
			request.setAttribute("result", result);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		return "postWriteResult.jsp";
	}
}
