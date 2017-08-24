package dto;

import java.sql.Date;

public class Post {
	private String post_id;
	private Date write_date;
	private Date modifi_date;
	private int delete_chk;
	private String member_id;
	private String qna;
	private String text;
	private String url;
	private int type;

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

	public Date getModifi_date() {
		return modifi_date;
	}

	public void setModifi_date(Date modifi_date) {
		this.modifi_date = modifi_date;
	}

	public int getDelete_chk() {
		return delete_chk;
	}

	public void setDelete_chk(int delete_chk) {
		this.delete_chk = delete_chk;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getQna() {
		return qna;
	}

	public void setQna(String qna) {
		this.qna = qna;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
