package tw.ispan.user1;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface User1Repository extends JpaRepository<User1, Integer> {

	public Optional<User1> findByUseremailaddress(String useremailaddress);
	
//	忘記密碼
//	@Query("SELECT u FROM USER1 u WHERE u.useremailaddress = ?1")
//    public User1 findByUseremailaddress1(String useremailaddress); 
//    public User1 findByResetpasswordtoken(String resetpasswordtoken);
}