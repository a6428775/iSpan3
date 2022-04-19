package tw.ispan.account;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.ispan.exception.UserNotFoundException;
import tw.ispan.store.Store;




@Service
public class AccountService {

	
	@Autowired
	private AccountRepository arpo;
	
	public Account createAccount(Account account) {
		return arpo.save(account);
	} 
	
	//登入驗證有無此帳號
	public Account findByAccount(String Account) {
		
		 Optional<Account> op1 = arpo.findByUserAccount(Account);

		 if(op1.isEmpty()) {
			 throw new UserNotFoundException("Account errow");
		 }	 
			 return op1.get();
	}
}
