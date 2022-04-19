package tw.ispan.home.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tw.ispan.store.Store;

@Controller
public class HomeController {
	
	
//	=============================================================首頁=============================================================
	@RequestMapping(path = "/home.controller", method = RequestMethod.GET)
    public String home() {
    	return "home";
	}
}
