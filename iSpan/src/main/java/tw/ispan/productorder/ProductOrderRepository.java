package tw.ispan.productorder;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface ProductOrderRepository extends JpaRepository<ProductOrder, Integer> {
	
	@Query(value = "select * from ProductOrder where StoreID = ?", nativeQuery = true)
	public List<ProductOrder> findByStoreId(int storeID);
	
//	--查詢該餐廳訂單
	@Query(value = "select * from ProductOrder where StoreID = ? and OrderStatus LIKE ?", nativeQuery = true)
	public Page<ProductOrder> findAllByStoreId(int storeID,String OrderStatus, Pageable pageable);
	
	
//	--查詢該用戶訂單
	@Query(value = "select * from ProductOrder where UserID = ?", nativeQuery = true)
	public Page<ProductOrder> findAllByUserId(int UserID, Pageable pageable);
	
//  -----OrderID取得訂單StoreID
	@Query(value = "select * from ProductOrder where OrderID = ?", nativeQuery = true)
	public ProductOrder findByOrderID(int OrderID);	

}
