package tw.ispan.user1;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import tw.ispan.account.Account;
import tw.ispan.account.AccountService;

@Service
public class AuthUser1DetailsService implements UserDetailsService {
	@Autowired
	private AccountService aService;

	@Override
	public UserDetails loadUserByUsername(String useremailaddress) throws UsernameNotFoundException {
		
		
		Account account = aService.findByAccount(useremailaddress);
		
//		return new User(store.getStoreAccount(), store.getStorePassword(), Collections.EMPTY_LIST);		
        return User.withUsername(account.getUserAccount())
        		   .password(account.getUserPassword())
                   //建立 與資料庫對應的 權限
                   .roles(account.getUserRole()).build();
        
        
	}
	
}
