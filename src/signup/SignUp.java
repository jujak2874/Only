package signup;

import java.sql.Date;

public class SignUp {
	private String member_id;
	private String member_id1;
	private String nickname;
	private String password;
	private String email;
	private int stat;
	private Date join_date;
	private Date withdraw_date;
	private String pf_img;
	private String tel;
	private Date birth;

	
	public String getMember_id1() {
		return member_id1;
	}

	public void setMember_id1(String member_id1) {
		this.member_id1 = member_id1;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getStat() {
		return stat;
	}

	public void setStat(int stat) {
		this.stat = stat;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public Date getWithdraw_date() {
		return withdraw_date;
	}

	public void setWithdraw_date(Date withdraw_date) {
		this.withdraw_date = withdraw_date;
	}

	public String getPf_img() {
		return pf_img;
	}

	public void setPf_img(String pf_img) {
		this.pf_img = pf_img;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

}
