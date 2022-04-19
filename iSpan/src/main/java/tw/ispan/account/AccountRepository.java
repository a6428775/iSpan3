package tw.ispan.account;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;



public interface AccountRepository extends JpaRepository<Account, Integer> {
	
	public Optional<Account> findByUserAccount(String userAccount);
	

}
