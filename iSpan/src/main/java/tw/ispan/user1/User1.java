package tw.ispan.user1;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "User1")
@Component
public class User1 {
	
	@Id @Column(name = "USERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userid;
	
	@Column(name = "NICKNAME")
	private String nickname;
	
	@Column(name = "USEREMAILADDRESS")
	private String useremailaddress ;
	
	@Column(name = "BIRTHDAY")
	private String birthday;
	
	@Column(name = "PHONE")
	private String phone;
	
	@Column(name = "ADDRESS")
	private String address;
	
//	@Column(name = "RESET_PASSWORD_TOKEN")
//    private String resetpasswordtoken;

//	public String getResetpasswordtoken() {
//		return resetpasswordtoken;
//	}
//
//	public void setResetpasswordtoken(String resetpasswordtoken) {
//		this.resetpasswordtoken = resetpasswordtoken;
//	}

	public User1() {
		
	}
	
//	public User1 (String useremailaddress, String userpassword ) {
//		
//	}
//
	public User1 (String useremailaddress, String nickname, String birthday, String phone ,String address) {
		
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUseremailaddress() {
		return useremailaddress;
	}

	public void setUseremailaddress(String useremailaddress) {
		this.useremailaddress = useremailaddress;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}


}
