package signup;

import java.sql.Date;

public class Post {
	private String post_id;
	private Date write_date;
	private int delete_chk;
	private String blog_member_id;
	private String qna;
	private String post_text;
	private String video;
	private String image;
	private String audio;

	public String getPost_id() {
		return post_id;
	}

	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public int getDelete_chk() {
		return delete_chk;
	}

	public void setDelete_chk(int delete_chk) {
		this.delete_chk = delete_chk;
	}

	public String getBlog_member_id() {
		return blog_member_id;
	}

	public void setBlog_member_id(String blog_member_id) {
		this.blog_member_id = blog_member_id;
	}

	public String getQna() {
		return qna;
	}

	public void setQna(String qna) {
		this.qna = qna;
	}

	public String getPost_text() {
		return post_text;
	}

	public void setPost_text(String post_text) {
		this.post_text = post_text;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAudio() {
		return audio;
	}

	public void setAudio(String audio) {
		this.audio = audio;
	}
}
