package tw.ispan.account.controller;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.ispan.account.Account;
import tw.ispan.account.AccountService;
import tw.ispan.user1.User1;
import tw.ispan.user1.User1Service;

@Controller
@SessionAttributes(names = {"UserID"})
public class AccountController {

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private User1Service User1Service;
	
	
//	註冊新會員
	@RequestMapping(path = "/createaccountmain.controller", method = RequestMethod.GET)
    public String processaccountMainAction(Model m) {
		Account account = new Account();
    	m.addAttribute("account", account);
    	return "register";
	}
	
//	修改User1基本資料(若不存在則新增一筆User1)
	@PostMapping("/Account/User1/membercenterupdate.controller")
	public String User1Update(@RequestParam("Nickname") String Nickname, @RequestParam("Phone") String Phone,
									@RequestParam("Address") String Address, @RequestParam("Birthday") String Birthday, Model m, User1 User1) {

//		取得登入帳號
		String SecurityName = SecurityContextHolder.getContext().getAuthentication().getName();
//		取得一筆User1
		Optional<User1> findUser1 = User1Service.findByUseremailaddress2(SecurityName);
		
//		修改User1基本資料(若不存在則新增一筆User1)
		if (findUser1.isEmpty()) {
			
			User1.setUseremailaddress(SecurityName);
			User1.setNickname(Nickname);
			User1.setPhone(Phone);
			User1.setAddress(Address);
			User1.setBirthday(Birthday);

			User1Service.createUser1(User1);
		} else {

			findUser1.get().setNickname(Nickname);
			findUser1.get().setPhone(Phone);
			findUser1.get().setAddress(Address);
			findUser1.get().setBirthday(Birthday);

			User1Service.update(findUser1.get());
		}
		
		return "welcome";
	}
	
	
	
	
	
	@PostMapping("/createaccount.controller")
	public String processCreateUserAction(@RequestParam("useraccount") String useraccount, @RequestParam("userpassword") String userpassword,
											@RequestParam("userrole") String userrole, Model m) {
		
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		
		Account account = new Account();
		String encode = new BCryptPasswordEncoder().encode(userpassword);
		account.setUserPassword(encode);
		account.setUserAccount(useraccount);
		account.setUserRole(userrole);
		Account createAccount = accountService.createAccount(account);
		if(createAccount != null) {
			return "registerResult";
		} else {
			errors.put("account", "!!帳號已存在，請更換其他帳號信箱!!");	
			return "register";
		}
	}

//  登入、取得登入成功後使用者名稱
	@RequestMapping(path = "/Account/User1/membercenter.controller", method = RequestMethod.GET)
	public String AccountInfo(Model m) {
		// 取得登入帳號
		String SecurityName = SecurityContextHolder.getContext().getAuthentication().getName();

		// findByUseraccount()取得一筆會員Bean，用Model丟出來給jsp顯示
		Account account = accountService.findByAccount(SecurityName);
		
//		取得一筆User1
		Optional<User1> findUser1 = User1Service.findByUseremailaddress2(SecurityName);
		
		System.out.println(account.getUserAccount() + "," + account.getUserPassword() + "," + account.getUserRole());	
		
		m.addAttribute("Account",account);
		m.addAttribute("Useraccount", account.getUserAccount());
		m.addAttribute("Userpassword", account.getUserPassword());
		
		if (findUser1.isPresent()) {
			m.addAttribute("Nickname", findUser1.get().getNickname());
			m.addAttribute("Phone", findUser1.get().getPhone());
			m.addAttribute("Address", findUser1.get().getAddress());
			m.addAttribute("Birthday", findUser1.get().getBirthday());
		}
		
		return "memberCenter";
	}
	
//	重設會員密碼
	@PostMapping("/Account/User1/membercenterupdatepwd.controller")
	public String AccountUpdatePwd(@RequestParam("userpassword") String userpassword, Model m) {

		// 取得登入帳號
		String SecurityName = SecurityContextHolder.getContext().getAuthentication().getName();
		// findByUseraccount()取得一筆會員Bean
		Account account1 = accountService.findByAccount(SecurityName);
		
		//編碼、修改後更新
		String encode = new BCryptPasswordEncoder().encode(userpassword);
		account1.setUserPassword(encode);
		Account update1 = accountService.createAccount(account1);

		System.out.println(update1.getUserAccount() + "," + update1.getUserPassword() + "," + update1.getUserRole());	
		
		m.addAttribute("Account", update1);
		m.addAttribute("Useraccount", update1.getUserAccount());
		m.addAttribute("Userpassword", update1.getUserPassword());
		
		
		return "login";
	}
	
//	權限限制：僅允許store使用者登入此方法
	@RequestMapping(path = "/store/membercenter.controller", method = RequestMethod.GET)
	@PreAuthorize("hasAnyAuthority('ROLE_STORE')")
	public String adminpage() {
		return ("welcome");
	}
	
//	權限限制：會員 進入 USER頁面   商家 進入STORE頁面	
	@GetMapping("/verifyIdentity.controller")
	public String verifyIdentity(Model m) {
		Collection<? extends GrantedAuthority> SecurityAuth = SecurityContextHolder.getContext().getAuthentication().getAuthorities();

		
		String SecurityName2 = SecurityAuth.toString();
		System.out.println(SecurityName2);
		String a = "[ROLE_USER]";
		String b = "[ROLE_STORE]";
		
		System.out.println(a);
		if (SecurityName2.equals(a)) {
			// 取得登入帳號
			String SecurityName = SecurityContextHolder.getContext().getAuthentication().getName();

			// findByUseraccount()取得一筆會員Bean，用Model丟出來給jsp顯示
			Account account = accountService.findByAccount(SecurityName);
			
//			取得一筆User1
			Optional<User1> findUser1 = User1Service.findByUseremailaddress2(SecurityName);
			
			System.out.println(account.getUserAccount() + "," + account.getUserPassword() + "," + account.getUserRole());	
			
			m.addAttribute("Account",account);
			m.addAttribute("Useraccount", account.getUserAccount());
			m.addAttribute("Userpassword", account.getUserPassword());
			
			if (findUser1.isPresent()) {
				m.addAttribute("Nickname", findUser1.get().getNickname());
				m.addAttribute("Phone", findUser1.get().getPhone());
				m.addAttribute("Address", findUser1.get().getAddress());
				m.addAttribute("Birthday", findUser1.get().getBirthday());
				m.addAttribute("UserID", findUser1.get().getUserid());
			}			
			return "memberCenter";
			
		}else if(SecurityName2.equals(b)){
			
			return "Background_Home";
			
		}else {
			return "welcome";
		}
		
		
	}
	
	
	@PostMapping("/Auth.controller")
	@ResponseBody
	public Account Auth() {
		String SecurityName = SecurityContextHolder.getContext().getAuthentication().getName();
		Account account = accountService.findByAccount(SecurityName);
		System.out.println(account);
		return account;
	}
}


