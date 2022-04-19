package tw.ispan.productorder.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.ispan.product.Product;
import tw.ispan.product.ProductRepository;
import tw.ispan.product.ProductService;
import tw.ispan.store.Store;
import tw.ispan.store.StoreRepository;
import tw.ispan.store.StoreService;




@Controller
@RequestMapping("/product")
@SessionAttributes(names = {"totalPages" , "totalElements"})
public class ProductController {
	
	@Autowired
	private ProductService pService;
	@Autowired
	private StoreService sService;
	@Autowired
	private StoreRepository s;
	@Autowired
	private ProductRepository p;
	
	@GetMapping("/mainacction.controller")
	public String processProductMainAction() {
		return "/product/productAll";		
	}
	
	//創建餐點
	@PostMapping("/insertProduct.controller")
	public Product processProductInsertAction(@RequestBody Product pro ) throws FileNotFoundException {
		
		//取得登入廠商的ID 才能新增廠申自己的餐點進資料庫  還沒寫防呆
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        System.out.println(username); // user  
        Optional<Store> op1 = s.findByAccount(username);
        Integer ss = op1.get().getStoreID();
      
		pro.setStoreid(ss);
	
		return pService.insert(pro);
		
	}
	
	//抓取餐點上傳的圖片
	@PostMapping("/insertProduct2.controller")
	public String uplaod(HttpServletRequest req,@RequestParam("uploadFile") MultipartFile file,@RequestParam("ProductName") String productname,Model m) {
		
		if(!file.isEmpty()) {
		
		File dest;
		Product product =pService.findByName(productname);
		try {
			
			String fileName = System.currentTimeMillis() + file.getOriginalFilename();
			
			File path = new File(ResourceUtils.getURL("src").getPath());
			if(!path.exists()) path = new File("");
			System.out.println("path:"+path.getAbsolutePath());
			
			File upload = new File(path.getAbsolutePath(),"main/webapp/WEB-INF/resources/images/product");
			if(!upload.exists()) upload.mkdirs();
			System.out.println("upload url:"+upload.getAbsolutePath());
			
			 dest = new File(upload + File.separator + fileName); 
			 file.transferTo(dest);
			 System.out.println(dest.toString());
			
			 
			 
			 m.addAttribute("fileName",fileName);
			 product.setPreview(dest.toString());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			 e.printStackTrace();
			 return null;
		 }
		pService.insert(product);
		}
		 return "/product/productAll";
	} 
	
	
	//更新餐點
	@PostMapping("/updateProduct.controller")
	public Product processProductupdateAction(@RequestBody Product pro) {
		
		
		//取得登入廠商的ID 才能新增廠申自己的餐點進資料庫  還沒寫防呆
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        System.out.println(username); // user  
        Optional<Store> op1 = s.findByAccount(username);
        Integer ss = op1.get().getStoreID();
      
		pro.setStoreid(ss);
	
		//取得登產品ID 透過ID 更新資料
		Integer p = pro.getProductid();
		Product pro2 = pService.findById(p);
		pro.setProductid(p);
		pro.setPreview(pro2.getPreview());

		return pService.insert(pro);
	}	
	

	//刪除餐點
	@GetMapping("/deleteProduct.controller")
	public String processDeleteAction(@RequestParam("pid") int pid , Model m) {
		pService.delete(pid);
		return "/product/productAll";
	}
	
	
	@PostMapping("/queryByPage/{pageNo}/{SearchText}/{SearchText2}")	
	@ResponseBody
	public List<Product> processQueryAllByPage(@PathVariable("pageNo") int pageNo,@PathVariable("SearchText") String SearchText,@PathVariable("SearchText2") String SearchText2 , Model m){
		
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        System.out.println(username); // user  
        Optional<Store> op1 = s.findByAccount(username);
        Integer ss = op1.get().getStoreID();
		//每頁顯示的筆數
		int pageSize = Integer.parseInt(SearchText2);
		//設定顯示頁碼與每頁筆數
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		System.out.println(pageNo);
		if (SearchText.equals("全部")) {
			SearchText="%";
		}

		Page<Product> page =pService.findAllByPage2(ss,"%"+SearchText+"%","%"+SearchText+"%","%"+SearchText+"%","%"+SearchText+"%",pageable);
		System.out.println(page);
		//取得資料總頁數
	//	m.addAttribute("totalPages", page.getTotalPages());
		//取得全部資料筆數
	//	m.addAttribute("totalElements", page.getTotalElements());
		//取得所取得的該頁資料內容
		return page.getContent();
	}
	@PostMapping("/queryByPage3/{pageNo}/{SearchText}/{SearchText2}")	
	@ResponseBody
	public long processQueryAllByPage2(@PathVariable("pageNo") int pageNo,@PathVariable("SearchText") String SearchText ,@PathVariable("SearchText2") String SearchText2 , Model m){
		
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        System.out.println(username); // user  
        Optional<Store> op1 = s.findByAccount(username);
        Integer ss = op1.get().getStoreID();
		//每頁顯示的筆數
		int pageSize = Integer.parseInt(SearchText2);
		//設定顯示頁碼與每頁筆數
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		System.out.println(pageNo);
		if (SearchText.equals("全部")) {
			SearchText="%";
		}

		Page<Product> page =pService.findAllByPage2(ss,"%"+SearchText+"%","%"+SearchText+"%","%"+SearchText+"%","%"+SearchText+"%",pageable);
		
		long pagelong = page.getTotalElements();

		return pagelong;
	}	
	
	
	//新增餐點 
	@GetMapping("/storeCreateProduct.controller")
	public String processSidActiong() {
		return "/product/createProduct";
	}
	
	//透過id 查詢商家
	@PostMapping("/storequerybyid.controller")
	@ResponseBody
	public Store processQueryByIdAction(@RequestParam("sid") int sid) {
		return sService.findById(sid);
	}
	
	//更新餐點
	@GetMapping("/updateproduct.controller")
	public String processUpdateAction(@RequestParam("pid") int pid , Model m) {
		m.addAttribute("pid", pid);
		return "/product/updateProduct";
	}
	
	//透過id 查詢產品
	@PostMapping("/productquerybyid.controller")
	@ResponseBody
	public Product processQueryByIdAction2(@RequestParam("pid") int pid) {
		return pService.findById(pid);
	}
	
	//透過Store id 查詢 產品資料  (後台根據商家登入的帳號去獲取商家自己的商品)
	@PostMapping("/testtest")	
	@ResponseBody
	public List<Product> processQueryAllByStoreID(){
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        System.out.println(username); // user  
        Optional<Store> op1 = s.findByAccount(username);
        Integer ss = op1.get().getStoreID();
		
		

        return p.findByStoreId(ss);
        
	}
	
	//透過Store id 查詢 產品資料  (點擊 網頁 某間餐廳 取得參數)
	@GetMapping("/testtest2")	
	public String processQueryAllByStoreID2(@RequestParam("sid") int sid,Model m){
		m.addAttribute("sid", sid);

        return "test2";
        
	}
	//透過Store id 查詢 產品資料  (點擊 網頁 某間餐廳 取得參數)
	@PostMapping("/testtest3")	
	@ResponseBody
	public List<Product> processQueryAllByStoreID3(@RequestParam("sid") int sid){


        return p.findByStoreId(sid);
        
	}
	
	@PostMapping("/StoreAll.controler")
	@ResponseBody
	public List<Store> processQueryStoreAll(){
		return s.findAll();
		
	}
	
	@GetMapping("/checkout.controller")
	public String checkout(){
		return "checkout";
		
	}
	
	
}
