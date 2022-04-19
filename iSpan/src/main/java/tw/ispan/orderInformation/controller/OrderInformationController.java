package tw.ispan.orderInformation.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.ispan.orderInformation.OrderInformation;
import tw.ispan.orderInformation.OrderInformationService;
import tw.ispan.productorder.ProductOrder;
import tw.ispan.productorder.ProductOrderService;


//  04/12----------新增OrderInformationController.java

//  04/13----------修改OrderInformationController.java

@Controller
public class OrderInformationController {
	
	@Autowired
	private OrderInformationService OrderInformationService;
	
	@Autowired
	private ProductOrderService ProductOrderService; 
	
	@PostMapping("/OrderInformationupdate.controller")
	public String OrderInformationUpdate(@RequestParam("opinion") String opinion, @RequestParam("oid") Integer oid, Model m) {
		
		System.out.println("OrderID : "+ oid);
		System.out.println("Opinion : "+ opinion);
		
		ProductOrder ProductOrder = ProductOrderService.findByOrderID(oid);
		ProductOrder.setRemark(opinion);
		ProductOrderService.insert(ProductOrder);
		
		return "welcome";
	}

//		OrderInformation OrderInformation = OrderInformationService.findByOrderId1(oid);
//		OrderInformation.setRemark(opinion);
//		OrderInformationService.save(OrderInformation);
	
}
