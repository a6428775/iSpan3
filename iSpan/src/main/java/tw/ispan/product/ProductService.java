package tw.ispan.product;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;






@Service
public class ProductService {

	@Autowired
	private ProductRepository prpo;
	
	//查全部
	public List<Product> findAll(){
		return prpo.findAll();
	}
	
	//新增
	public Product insert(Product p) {
		return prpo.save(p);
	}
	
	public Page<Product> findAllByPage2(int storeid,String ProductName,String ProductCategory,String ProductUnitPrice,String ProductID, Pageable pageable){
		
		return prpo.findAllBystoreID(storeid,ProductName,ProductCategory,ProductUnitPrice,ProductID, pageable);
	}
	

	
	public Product findById(int id) {
		Optional<Product> op = prpo.findById(id);
		
		if(op.isPresent()) {
			return op.get();
		}
		
		return null;
	}	
	
	public Product updateById(Product p ,Integer id) {
		return prpo.save(p);
	}
	
	public Product delete(Integer p) {
		prpo.deleteById(p);
		return null;
	}
	
	public Product findByName(String p) {
		return prpo.findByname(p);
		
	}
}
