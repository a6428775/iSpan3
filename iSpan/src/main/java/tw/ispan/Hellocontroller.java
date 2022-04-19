package tw.ispan;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ecpay.payment.integration.AllInOne;
import tw.ispan.account.EmailSenderService;
import tw.ispan.orderInformation.OrderInformation;
import tw.ispan.orderInformation.OrderInformationRepository;
import tw.ispan.product.Product;
import tw.ispan.product.ProductRepository;
import tw.ispan.store.Store;
import tw.ispan.store.StoreRepository;
import tw.ispan.store.StoreService;

@Controller
//@RequestMapping("/Store")
public class Hellocontroller {
	

	
	@Autowired
	private StoreRepository s;
	@Autowired
	private ProductRepository p;
	@Autowired
	private OrderInformationRepository o;
	
	@GetMapping("/hello.controller")
	@ResponseBody
	public Integer processaction(){
		
		//取得登入帳號的 "帳號" 資料
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        System.out.println(username); // user  
        
        //透過帳號 去搜尋 Store 資料庫裡的資料
        Optional<Store> op1 = s.findByAccount(username);
        Integer ss = op1.get().getStoreID();
        return ss;
	}
	@GetMapping("/test")
	public String processAction2() {
		return "/Store/QueryInformationByOrderID.controller";
	}
	
	@GetMapping("/test2")
	public String processAction4() {
		return "test2";
	}
	
	@GetMapping("/test3")
	public String processAction5() {
		return "test3";
	}
	
	//只搜尋某STOREID 的餐點
	@GetMapping("/test12313")
	@ResponseBody
	public List<OrderInformation> processAction3() {
		return o.findByOrderId(4);
		
	}
	
	@GetMapping("/test4")
	public String processAction6() {
		return "/product/productQueryAll";
	}
	@GetMapping("/test5")
	public String processAction7() {
		return "/faq/contact";
	}
	
	@GetMapping("/test8")
	public String processAction8() {
		return "/shoppingcart";
	}
	@GetMapping("/aboutus")
	public String processAction9() {
		return "/faq/aboutus";
	}
	@GetMapping("/events")
	public String processAction10() {
		return "/faq/event";
	}
	@GetMapping("/privates")
	public String processAction11() {
		return "/faq/private";
	}
	@GetMapping("/faq")
	public String processAction12() {
		return "/faq/faq";
	}
	
	
	@Autowired
    private EmailSenderService senderService;
	@PostMapping("/sendmail.controller")
   public String sendMail(@RequestParam("email") String email){
		
		System.out.println(email);
		
       senderService.sendEmail(email, 
               "感謝您訂閱美好食程",
               "親愛的會員，感謝您訂閱美好食程，美好食程將會不定期提供最新資訊及餐廳優惠給您，美好食程祝您順心愉快");
       return "welcome";
   }

}
