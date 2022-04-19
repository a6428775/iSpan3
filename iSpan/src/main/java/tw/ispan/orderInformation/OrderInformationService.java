package tw.ispan.orderInformation;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;





@Service
@Transactional
public class OrderInformationService {
	
	@Autowired
	private OrderInformationRepository orp;
	
	public List<OrderInformation> findAll(){
		return orp.findAll();
	}
	
	public OrderInformation findById(int id) {
		
		Optional<OrderInformation> op = orp.findById(id);
		
		if(op.isPresent()) {
			return op.get();
		}
		
		return null;
	}
	
	public Page<OrderInformation> findAllByPage(Pageable pageable){
		return orp.findAll(pageable);
	}
	
	public OrderInformation save(OrderInformation o) {	
		return orp.save(o);
	}
	
//	04/12-----findByOrderId1
	public OrderInformation findByOrderId1(int orderID){
		OrderInformation op = orp.findByOrderId1(orderID);
		return op;
	}	
	
}
