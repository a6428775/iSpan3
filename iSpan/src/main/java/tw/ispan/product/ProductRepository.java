package tw.ispan.product;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.ispan.productorder.ProductOrder;







public interface ProductRepository extends JpaRepository<Product, Integer> {

	@Query(value = "select * from Product where StoreID = ?", nativeQuery = true)
	public List<Product> findByStoreId(int storeID);
	
	@Query(value = "select * from Product where ProductName = ?", nativeQuery = true)
	public Product findByname(String ProductName);
	
//	--查詢該商家餐點
	@Query(value = "select * from Product where StoreID = ? and (ProductName LIKE ? or ProductCategory LIKE ? or ProductUnitPrice LIKE ? or ProductID LIKE ?)", nativeQuery = true)
	public Page<Product> findAllBystoreID(int storeID,String ProductName,String ProductCategory,String ProductUnitPrice,String ProductID, Pageable pageable);
	

}
