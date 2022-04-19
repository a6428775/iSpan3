package tw.ispan.user1.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.ispan.account.Account;
import tw.ispan.account.AccountRepository;
import tw.ispan.account.AccountService;
import tw.ispan.store.Store;
import tw.ispan.store.StoreService;
import tw.ispan.user1.User1;
import tw.ispan.user1.User1Repository;
import tw.ispan.user1.User1Service;

@Controller
public class User1Controller {
	
	@Autowired
	private User1Service User1Service;
	@Autowired
	private User1Repository urpo;
	@Autowired
	private AccountService aService;
	@Autowired
	private StoreService sService;
	@Autowired
	private AccountRepository arp;
	
//	註冊新會員
	@RequestMapping(path = "/createuser1main.controller", method = RequestMethod.GET)
    public String processuser1MainAction(Model m) {

    	return "registerUser";
	}
	@PostMapping("/createuser1.controller")
	public String processCreateUserAction(@RequestParam("useremailaddress") String user, @RequestParam("userpassword") String pwd, @RequestParam("userrole") String userrole, Model m) {
		
System.out.println(userrole);
		
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		
		Account account = new Account();
		User1 user1 = new User1();
		Store store = new Store();
		
		String encode = new BCryptPasswordEncoder().encode(pwd);
		
		Optional<Account> op1 = arp.findByUserAccount(user);

		if(op1.isPresent()) {
				errors.put("account", "Account already exists");	
				return "registerUser";
		}	  
		account.setUserAccount(user);
		account.setUserPassword(encode);
		
		
		account.setUserRole(userrole);
			 
		aService.createAccount(account);
		
		if (userrole.equals("USER")) {
			
		user1.setUseremailaddress(user);
		User1Service.createUser1(user1);
		}else {
			store.setStoreAccount(user);
			sService.createAccount(store);
		}
		return "registerResult";


	}

	// 登入、取得登入成功後使用者名稱
	@RequestMapping(path = "/user1/membercenter.controller", method = RequestMethod.GET)
	public String UserProfileInfo() {
		// 取得登入帳號
		String SecurityName = SecurityContextHolder.getContext().getAuthentication().getName();
		System.out.println("SecurityName:" + SecurityName);
				

		return "memberCenter";
	}

//	修改會員基本資料
	@PostMapping("/user1/membercenterupdate.controller")
	public User1 UserProfileUpdate(@RequestBody User1 User1) {

		// 取得登入帳號
		String SecurityName = SecurityContextHolder.getContext().getAuthentication().getName();
		// findByName()取得一筆會員Bean
	//	User1 findByName1 = User1Service.findByUseremailaddress(SecurityName);

        Optional<User1> op1 = urpo.findByUseremailaddress(SecurityName);
        
        if ( op1.isEmpty() ) {
        	
        	User1.setUseremailaddress(SecurityName);
        	
        }else {
        	
        	 Integer ss = op1.get().getUserid();
        	 User1.setUserid(ss);
        	 User1.setUseremailaddress(op1.get().getUseremailaddress());
        	
        }

		return User1Service.update(User1);
	}
	
	
	
	@PostMapping("/userInformation.controller")
	@ResponseBody
	public User1 processUpdateStoreAction2() {
		//取得登入廠商的ID 才能新增商家自己的餐點進資料庫  還沒寫防呆
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        System.out.println(username); // user  
        return User1Service.findByUseremailaddress(username);

	}
	
	//重設會員密碼
//	@PostMapping("/user1/membercenterupdatepwd.controller")
//	public String UserProfileUpdatePwd(@ModelAttribute("user1") User1 User1, Model m) {
//
//		// 取得登入帳號
//		String SecurityName = SecurityContextHolder.getContext().getAuthentication().getName();
//		// findByName()取得一筆會員Bean
//		User1 findByName1 = User1Service.findByUseremailaddress(SecurityName);
//		
//		//編碼、修改後更新、print
//		String encode = new BCryptPasswordEncoder().encode(User1.getUserpassword());
// 		findByName1.setUserpassword(encode);
//		User1 update1 = User1Service.update(findByName1);
//
//		System.out.println(update1.getPhone() + "," + update1.getNickname() + "," + update1.getAddress() + "," + update1.getUseremailaddress() +
//				"," + update1.getUserpassword() + ","+ update1.getUserid()+ ","+ update1.getBirthday() );	
//		
//		m.addAttribute("User1", findByName1);
//		m.addAttribute("Useremailaddress", findByName1.getUseremailaddress());
//		m.addAttribute("Userpassword", findByName1.getUserpassword());
//		m.addAttribute("Nickname", findByName1.getNickname());
//		m.addAttribute("Phone", findByName1.getPhone());
//		m.addAttribute("Address", findByName1.getAddress());
//		m.addAttribute("Birthday", findByName1.getBirthday());
//
//		return "memberCenter";
//	}
	
}
