package tw.ispan.productorder.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.ispan.orderInformation.OrderInformation;
import tw.ispan.orderInformation.OrderInformationRepository;
import tw.ispan.orderInformation.OrderInformationService;
import tw.ispan.product.Product;
import tw.ispan.productorder.ProductOrder;
import tw.ispan.productorder.ProductOrderRepository;
import tw.ispan.productorder.ProductOrderService;
import tw.ispan.store.Store;
import tw.ispan.store.StoreRepository;
import tw.ispan.store.StoreService;
import tw.ispan.user1.User1;
import tw.ispan.user1.User1Service;


@Controller
@RequestMapping("/Store")
@SessionAttributes(names = {"totalPages" , "totalElements"})
public class OrderController {
	
	@Autowired
	private ProductOrderService pService;
	@Autowired
	private StoreRepository s;
	@Autowired
	private StoreService sService;
	@Autowired
	private ProductOrderRepository p;
	@Autowired
	private OrderInformationRepository o;
	@Autowired
	private OrderInformationService oService;
	@Autowired
	private User1Service uService;
	
//	04/13-----取得orderid抓取該筆回饋資料
	@PostMapping("/orderquerybyidremark.controller")
	@ResponseBody
	public ProductOrder processQueryByIdAction2(@RequestParam("oid") int oid, Model m) {
		
		m.addAttribute("oid", oid);

		ProductOrder ProductOrder = pService.findByOrderID(oid);
		
		return ProductOrder;
	}

	
//	----該用戶的所有訂單
	@PostMapping("/queryUserIDByPage/{pageNo}")	
	@ResponseBody
	public List<ProductOrder> processQueryUserIDByPage(@SessionAttribute("UserID") int UserID, @PathVariable("pageNo") int pageNo , Model m){
		//每頁顯示的筆數
		int pageSize = 2;
		//設定顯示頁碼與每頁筆數
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<ProductOrder> page = pService.findUserIDByPage(UserID, pageable);
		//取得資料總頁數
		m.addAttribute("totalPages", page.getTotalPages());
		//取得全部資料筆數
		m.addAttribute("totalElements", page.getTotalElements());
		//取得所取得的該頁資料內容
		return page.getContent();
	}
	
//	-----取得orderid進入回饋頁面
	@GetMapping("/orderquerybyid.controller")
	public String processQueryByIdAction1(@RequestParam("oid") int oid, Model m) {
		
		m.addAttribute("oid", oid);
		
		ProductOrder ProductOrder = pService.findByOrderID(oid);
		m.addAttribute("StoreID", ProductOrder.getStoreid());
		
		Store Store = sService.findById(oid);
		m.addAttribute("StoreName", Store.getStoreName());
		
		return "feedback";
	}	
	
	
	@GetMapping("/Store.controller")
	public String processAction(){ 
		return "Order/OrderAll";  
	}

	@PostMapping("/orderquerybyid.controller")
	@ResponseBody
	public ProductOrder processQueryByIdAction(@RequestParam("oid") int oid) {
		return pService.findById(oid);
	}
	@PostMapping("/orderqueryall.controller")	
	@ResponseBody
	public List<ProductOrder> processQueryAll(){
		return pService.findAll();
	}
	
	@PostMapping("/QueryAllByStoreIDByPage/{pageNo}/{SearchText2}/{OrderStatus}")	
	@ResponseBody
	public List<ProductOrder> processQueryAllByPage(@PathVariable("pageNo") int pageNo,@PathVariable("SearchText2") String SearchText2 ,@PathVariable("OrderStatus") String OrderStatus , Model m){
		
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        System.out.println(username); // user  

        Optional<Store> op1 = s.findByAccount(username);
		int storeid = op1.get().getStoreID();		
		//每頁顯示的筆數
		int pageSize = Integer.parseInt(SearchText2);
		//設定顯示頁碼與每頁筆數
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		if (OrderStatus.equals("全部")) {
			OrderStatus = "%";
		}
		Page<ProductOrder> page =pService.findAllByStoreId(storeid,"%"+OrderStatus+"%",pageable);

		return page.getContent();
	}
	
	@PostMapping("/QueryAllByStoreIDByPage2/{pageNo}/{SearchText2}/{OrderStatus}")	
	@ResponseBody
	public long processQueryAllByPage2(@PathVariable("pageNo") int pageNo ,@PathVariable("SearchText2") String SearchText2 ,@PathVariable("OrderStatus") String OrderStatus , Model m){
		
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        System.out.println(username); // user  

        Optional<Store> op1 = s.findByAccount(username);
		int storeid = op1.get().getStoreID();		
		//每頁顯示的筆數
		int pageSize = Integer.parseInt(SearchText2);
		//設定顯示頁碼與每頁筆數
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		if (OrderStatus.equals("全部")) {
			OrderStatus = "%";
		}
		
		
		Page<ProductOrder> page =pService.findAllByStoreId(storeid,"%"+OrderStatus+"%",pageable);
		long pagelong = page.getTotalElements();
		return pagelong;
	}	
        
	//商家資訊修改網頁
	@GetMapping("/updateStore.controller")
	public String processUpdateStoreActiong() {
		return "/Order/updateStore";
	}
	
	//接收資料更新商家資訊
	@PostMapping("/updateStore2.controller")
	public Store processProductupdateAction(@RequestBody Store store) {
		//取得登入廠商的ID 才能新增廠申自己的餐點進資料庫  還沒寫防呆
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        System.out.println(username); // user  
        

        
        Optional<Store> op1 = s.findByAccount(username);
        
  //      Integer ss = op1.get().getStoreID();
        
        if ( op1.isEmpty() ) {
        	
        	store.setStoreAccount(username);
        	
        }else {
        	
        	 Integer ss = op1.get().getStoreID();
        	 store.setStoreID(ss);
        	 store.setStoreAccount(op1.get().getStoreAccount());
        	 store.setPreview(op1.get().getPreview());
        	
        }
      
        
 //       store.setStorePassword(op1.get().getStorePassword());
		//取得登產品ID 透過ID 更新資料

				

		return sService.update(store);
	}	
	
	
	
	
	
	
	@PostMapping("/storeupdateInformation.controller")
	@ResponseBody
	public Store processUpdateStoreAction2() {
		//取得登入廠商的ID 才能新增商家自己的餐點進資料庫  還沒寫防呆
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        System.out.println(username); // user  
        return sService.findByAccount(username);

	}
	
	
	//透過Store id 查詢 商家訂單
	@PostMapping("/QueryAllByStoreID.controller")	
	@ResponseBody
	public List<ProductOrder> processQueryAllByStoreID(){
		//取得登入廠商的ID 才能新增廠申自己的餐點進資料庫  還沒寫防呆
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        System.out.println(username); // user  
        Optional<Store> op1 = s.findByAccount(username);
        Integer ss = op1.get().getStoreID();

        return p.findByStoreId(ss);
        
	}
	
	//還沒寫完
	@PostMapping("/QueryInformationByOrderID.controller")	
	@ResponseBody
	public List<OrderInformation> processQueryAllByOrderID(@RequestParam("oid") int oid){
		return  o.findByOrderId(oid);
	}

	
	@PostMapping("/createStore.controller")
	public Store processCreateStoreAction2(@RequestBody Store store) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        store.setStoreAccount(username);
        
        return sService.createAccount(store);
	}
	
	//儲存成 ProductOrder
	@PostMapping("/saveorder.controller")
	@ResponseBody
	public ProductOrder saveorder(@RequestBody ProductOrder productorder){
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        Optional<User1> us1 = uService.findByUseremailaddress2(username);
        int us1id = us1.get().getUserid();
        
        Date date = new Date();
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");

        
        productorder.setOrderdate(ft.format(date));
        productorder.setStoreid(productorder.getStoreid());
        productorder.setUserid(us1id);
        productorder.setOrdersuccessdate("訂單未完成");
        
		pService.insert(productorder);
		

		return productorder;
	}
	
	//儲存成 OrderInformation
	@PostMapping("/saveorderInformation.controller")
	public String saveorder(@RequestBody OrderInformation orderInformation){
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        Optional<User1> us1 = uService.findByUseremailaddress2(username);

 
    
        oService.save(orderInformation);

		return null;
	}
	
	
	//抓取餐點上傳的圖片
	@PostMapping("/insertStoreProduct2.controller")
	public String uplaod(HttpServletRequest req,@RequestParam("uploadFile") MultipartFile file,@RequestParam("storeId") int storeid,Model m) {
		
		if(!file.isEmpty()) {
			
		File dest;
		Store store =sService.findById(storeid);
		try {
			String fileName = System.currentTimeMillis() + file.getOriginalFilename();
			
			File path = new File(ResourceUtils.getURL("src").getPath());
			if(!path.exists()) path = new File("");
			System.out.println("path:"+path.getAbsolutePath());
			
			File upload = new File(path.getAbsolutePath(),"main/webapp/WEB-INF/resources/images/store");
			if(!upload.exists()) upload.mkdirs();
			System.out.println("upload url:"+upload.getAbsolutePath());
			
			 dest = new File(upload + File.separator + fileName); 
			 file.transferTo(dest);
			 System.out.println(dest.toString());
			
			 
			 
			 m.addAttribute("fileName",fileName);
			 store.setPreview(dest.toString());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			 e.printStackTrace();
			 return null;
		 }
		sService.update(store);
		}
		
		 return "/Order/updateStore";
	} 
	
	@PostMapping("/updateorderstatus.controller")
	@ResponseBody
	public ProductOrder updatestatus(@RequestParam("oid2") int oid2,@RequestBody ProductOrder productorder){	
		ProductOrder pod = pService.findById(oid2);
        Date date = new Date();
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
	//	pod.setOrderstatus("準備中");

		pod.setOrderstatus(productorder.getOrderstatus());
		
		if (productorder.getOrderstatus().equals("已完成")) {	
			
		pod.setOrdersuccessdate(ft.format(date));
		System.out.println(oid2);
		System.out.println(date);
		System.out.println(ft);
		
		}else if(productorder.getOrderstatus().equals("已取消")){
			
			pod.setOrdersuccessdate(ft.format(date)+"(取消)");
			pod.setRemark2(productorder.getRemark2());
			
		}

		return pService.insert(pod);
		
	}
	
}

