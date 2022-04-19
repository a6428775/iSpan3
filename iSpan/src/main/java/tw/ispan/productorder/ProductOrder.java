package tw.ispan.productorder;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity @Table(name= "PRODUCTORDER") 
@Component
public class ProductOrder {
	
	@Id
	@Column(name = "ORDERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderid;
	
	@Column(name = "STOREID")
	private int storeid;
	
	@Column(name = "USERID")
	private int userid;
	
	@Column(name = "ORDERDATE")
	@JsonFormat(pattern = "yyyy-MM-dd" ,timezone = "GMT+8")
	private String orderdate;
	
	@Column(name = "ORDERSTATUS")
	private String orderstatus;
	
	@Column(name = "Price")
	private int price;
	
	@Column(name = "REMARK")
	private String remark;
	
	@Column(name = "REMARK2")
	private String remark2;
	
	@Column(name = "ORDERSUCCESSDATE")
	private String ordersuccessdate;

	public String getOrdersuccessdate() {
		return ordersuccessdate;
	}

	public void setOrdersuccessdate(String ordersuccessdate) {
		this.ordersuccessdate = ordersuccessdate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getRemark2() {
		return remark2;
	}

	public void setRemark2(String remark2) {
		this.remark2 = remark2;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}

	public int getStoreid() {
		return storeid;
	}

	public void setStoreid(int storeid) {
		this.storeid = storeid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(String string) {
		this.orderdate = string;
	}

	public String getOrderstatus() {
		return orderstatus;
	}

	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	} 
}
