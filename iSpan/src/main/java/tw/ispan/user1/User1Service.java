package tw.ispan.user1;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import tw.ispan.exception.UserNotFoundException;

@Service
@Transactional
public class User1Service {
	
	@Autowired
	private User1Repository User1Repository;
	
//	findByUseremailaddress 使用者帳號
	public User1 findByUseremailaddress(String useremailaddress) {
		Optional<User1> op1 = User1Repository.findByUseremailaddress(useremailaddress);
		
	//	System.out.println(op1.get().getUseremailaddress()+","+op1.get().getUserpassword());
		
		if (op1.isEmpty()) {
			throw new UserNotFoundException("帳號或密碼錯誤!");
			
		}
		return op1.get();
	}
//	建立帳號
	public User1 createUser1(User1 User1) {
		Optional<User1> op2 = User1Repository.findByUseremailaddress(User1.getUseremailaddress());
		if (op2.isEmpty()) {
			return User1Repository.save(User1);
		}
		return null;
	}
//	更新帳號資料
	public User1 update(User1 up3) {
		return User1Repository.save(up3);
	}
	
	
//	findByUseremailaddress 使用者帳號
	public Optional<User1> findByUseremailaddress2(String useremailaddress) {
		Optional<User1> op1 = User1Repository.findByUseremailaddress(useremailaddress);
		
	//	System.out.println(op1.get().getUseremailaddress()+","+op1.get().getUserpassword());

		return op1;
	}	
//	忘記密碼
//	public void updateResetPasswordToken(String resetpasswordtoken, String useremailaddress) throws UserNotFoundException {
//		User1 User1 = User1Repository.findByUseremailaddress1(useremailaddress);
//        if (User1 != null) {
//        	User1.setResetpasswordtoken(resetpasswordtoken);
//            User1Repository.save(User1);
//        } else {
//            throw new UserNotFoundException("Could not find any user with the useremailaddress " + useremailaddress);
//        }
//    }
//    public User1 getResetpasswordtoken(String resetpasswordtoken) {
//        return User1Repository.findByResetpasswordtoken(resetpasswordtoken);
//    }
//    public void updatePassword(User1 User1, String newPassword) {
//        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//        String encodedPassword = passwordEncoder.encode(newPassword);
//        User1.setUserpassword(encodedPassword);
//         
//        User1.setResetpasswordtoken(null);
//        User1Repository.save(User1);
//    }
	
}