<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>頁籤</title>
<!-- STYLE CSS -->
<link href="https://fonts.googleapis.com/css?family=Raleway:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Yellowtail"
	rel="stylesheet">
<link href="/css/fonts/styles.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">


</style>

<title>付款</title>

<script type="text/javascript">

$(function test() {
	const lsContent = getLSContent();
	let productMarkup = "";
	let productMarkup2 = "";
		if (lsContent !== null) {
			
			for (let product of lsContent) {
				productMarkup += `
		         <tr>
					<td id="pid" data-id=\${product['id']} store-id=\${product.storeid}></td>
		          	<td id="name">\${product['name']} </td>
		         	<td id="productPrice">\${product['price']}</td>
		         	<td id="productQty">\${product['quantity']}</td>
		      
				  	<td id="itemTotalPrice">\${product['price']*product['quantity']}</td>
				   	<td id="storeid" style="display: none">\${product['storeid']}</td>
				   	
		          </tr>
		        `;
				productMarkup2 = productMarkup2 + product['name'] + '$' + product['price'] + ' x ' + product['quantity'] + '#'
				}
			}

		
		console.log(productMarkup2);
		var b = "<input type='hidden'	name='ItemName' value='"+productMarkup2+"' class='form-control' />";
		
		$('#idFormAioCheckOut').append(b);
})


function getLSContent() {
			const lsContent = JSON.parse(localStorage.getItem("products"))
					|| [];
			return lsContent;
			
		};

$(function displayProductDetail() {

	const lsContent = getLSContent();
	let productMarkup = "";
		if (lsContent !== null) {
			var n = 1
			for (let product of lsContent) {
				productMarkup += `
		         <tr>
					<td id="pid" data-id=\${product['id']} store-id=\${product.storeid}></td>
		          	<td id="name">\${product['name']} </td>
		         	<td id="productPrice">\${product['price']}</td>
		         	<td id="productQty">\${product['quantity']}</td>
		      
				  	<td id="itemTotalPrice">\${product['price']*product['quantity']}</td>
				   	<td id="storeid" style="display: none">\${product['storeid']}</td>
				   	<td><input id="remark\${n}"></input></td>
		          </tr>
		        `;
			n=n+1
				}
			} else {
				productMarkup = "Your cart is empty.";
			}
			document.getElementById("cartItem").innerHTML = productMarkup;
			});


$(function getCartItemPrices(){
	const prices = []
	let nums = document.getElementById("cartItem").querySelectorAll("tr td:nth-child(5)")
	let total = 0;
	if(nums.length > 0){
		for (let cell=0; cell< nums.length; cell++){
		 	let num = nums[cell].innerText;
			num = num.replace(/[^\d]/g, "");
			num = parseInt(num);
			prices.push(num);
		}

		for(let i=0 ; i<prices.length;i++){
			total = total +prices[i];
		}
		var totalMarkUp = "Total: " + total;

		var a = "<input type='hidden' id='TotalAmount2' name='TotalAmount' value='" + total + "' class='form-control'  />"+
		"<input type='hidden' name='TradeDesc' value='嗨' class='form-control' />";
		$('#idFormAioCheckOut').append(a);
		document.getElementById("total").innerHTML = totalMarkUp;
		
	} else{
		return;
	}
});

<!--///////////////////////////////////////////////////////////ProductOrder-->
function sendOrderSave(){

	  var idFormAioCheckOut=document.getElementById('idFormAioCheckOut');
	    
	        setTimeout("mooy()",500);
	    

	 
	  var storeid = document.getElementById("storeid").innerHTML;
	  var price =  $("#TotalAmount2").val();
	  console.log(price);

		  
var params = {    
        "storeid":storeid,
        "price":price,
        "orderstatus":"未付款"
}

console.log("SUCCESS : ", JSON.stringify(params));
$.ajax({
	   type:'post',
	   url:'/Store/saveorder.controller',
	   dataType:'JSON',
	   contentType:'application/json',
	   data: JSON.stringify(params),
	   success: function(data) {
	      var json = JSON.stringify(data);
	      
	      console.log("SUCCESS : ", data.orderid);

	
			var c = "<input type='hidden'	name='CustomField1' value='"+data.orderid+"' class='form-control' />"
			$('#idFormAioCheckOut').append(c);
	      

	      <!---->
	  	const lsContent2 = getLSContent();
		var c = 1
		  console.log(lsContent2) ;
		  $.each(lsContent2, function(i,n){

		
			  var id = "remark" + (i+1)

					var params = {  
							"orderID":data.orderid,
							"productName":n.name,
							"number":n.quantity,
							"productUnitPrice":n.price,
							"productPrice":n.quantity*n.price,
							"remark":document.getElementById(id).value,
					}
				
					console.log("SUCCESS : ", JSON.stringify(params));
					$.ajax({
						   type:'post',
						   url:'/Store/saveorderInformation.controller',
						   dataType:'JSON',
						   contentType:'application/json',
						   data: JSON.stringify(params),
						   success: function(data) {
						      var json = JSON.stringify(data);
			
						      
						      console.log("SUCCESS : ", json);
						   },
					
					});
				});

	      <!---->
	   },

});
}


function mooy(){
    idFormAioCheckOut.submit();
    }
<!--///////////////////////////////////////////////////////////OrderInformation-->
function sendOrderInformationSave(){
	
	const lsContent2 = getLSContent();

		  console.log(lsContent2) ;
		  $.each(lsContent2, function(i,n){
			
		  
					var params = {  
							
							"productName":n.name,
							"number":n.quantity,
							"productUnitPrice":n.price,
							"productPrice":n.quantity*n.price,
							
					}
					
					console.log("SUCCESS : ", JSON.stringify(params));
					$.ajax({
						   type:'post',
						   url:'/Store/saveorderInformation.controller',
						   dataType:'JSON',
						   contentType:'application/json',
						   data: JSON.stringify(params),
						   success: function(data) {
						      var json = JSON.stringify(data);
			
						      
						      console.log("SUCCESS : ", json);
						   },
					
					});
});
}	
	</script>

</head>
<body>


	<div id="page" class="hfeed site">
		<!-- start page wrapper -->

		<header id="masthead" class="site-header navbar-fixed-top">
			<div class="header-navigation">
				<div class="container-fluid">

					<div class="row">

						<div class="col col-md-2">
							<div class="site-branding navbar-brand">
								<!-- 左上logo圖片 //////////////////////////////////////////////////////////////////////////-->
								<a href="#"><img src="/images/logo-2.png"
									alt="Food Recipe Web Template" title="Taplak"></a>
							</div>
							<!-- end logo -->
						</div>
						<!-- end col-md-3 -->

						<div class="col-12 col-md-8">
							<nav class="site-navigation navbar navbar-expand-lg navbar-light">

								<button class="navbar-toggler" type="button"
									data-toggle="collapse" data-target="#navbarSupportedContent"
									aria-controls="navbarSupportedContent" aria-expanded="false"
									aria-label="Toggle navigation">
									<span class="navbar-toggler-icon"></span>
								</button>

								<div class="collapse navbar-collapse"
									id="navbarSupportedContent">
									<!-- header 標題列///////////////////////////////////////////////////////////////////// -->
									<ul class="navbar-nav" id="loginlogout" >
<!--  										<li class="nav-item active"><a class="nav-link"
											href="/login/welcome">Home <span class="sr-only">(current)</span></a>
										</li>-->	
										<li class="nav-item" ><a class="nav-link" href="/aboutus" style="font-size:18px;">關於我們</a></li>
										<li class="nav-item"><a class="nav-link" href="/events" style="font-size:18px;">最新消息</a></li>
										<li class="nav-item"><a class="nav-link" href="welcome" style="font-size:18px;">餐廳列表</a></li>						
										<li class="nav-item"><a class="nav-link" href="/faq" style="font-size:18px;">常見問題</a></li>
										<li class="nav-item"><a class="nav-link" href="javascript:sendmail()" style="font-size:18px;">訂閱我們</a></li>
									</ul>
								</div>
								<!-- end navbar-collapse -->
							</nav>
							<!-- end site-navigation -->
						</div>
						<!-- end col-md-8 -->

						<!-- 刪除社群icon、搜尋icon-->

					</div>
					<!-- end row -->

				</div>
				<!-- end container-fluid -->
			</div>
			<!-- end header-navigation -->
		</header>
		<!-- end #masthead -->

		<!-- ====================================================自由發揮區==================================================== -->


		<div class="modal-body">
			<table class="table table-image">
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">產品名稱</th>
						<th scope="col">單價</th>
						<th scope="col">數量</th>
						<th scope="col">總價</th>
						<th scope="col">餐點註記</th>
					</tr>
				</thead>
				<tbody id="cartItem"></tbody>
			</table>
			<div class="d-flex justify-content-end" id="total">
				<h5>
					<span class="price text-success"></span>
				</h5>
			</div>
			<div class="d-flex justify-content-end">
			<form id="idFormAioCheckOut" method="post" action="ECPayServer" class="border shadow p-3 mb-5">	
			<input type ="button" onclick="history.back()" value="回上一頁"></input>
			


<!--  
			<button type="submit" class="btn btn-primary" onclick="sendOrderSave()">結帳</button>
-->
			<input type ="button" onclick="sendOrderSave()" value="送出訂單" align="right" ></input>
            </form>
     
            
            
			</div>
		</div>




		<!-- ====================================================自由發揮區==================================================== -->
		<div class="bottom">
			<div class="container">
				<!-- 頁尾 //////////////////////////////////////////////////////////////////////////-->
				<div class="row no-gutters">
					<div class="col-md-6">
						<div class="copy">
							<p>
								&copy; copyright 2022 by iii-Java-123-group1 <i
									class="fas fa-heart"></i>
							</p>
						</div>
						<!-- end copy -->
					</div>
					<!-- end col -->
					<div class="col-md-6">
						<ul class="bottom-nav">
							<li><a href="http://www.bootstrapmb.com/">Home</a></li>
							<li><a href="#">Contact Us</a></li>
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Terms and Conditions</a></li>
						</ul>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</div>
		<!-- end bottom -->

	</div>
	<!-- end #page hfeed site -->

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="/js/fonts/modernizr-3.7.1.min.js"></script>
	<script src="/js/fonts/jquery-3.4.1.min.js"></script>

	<!-- Include all compiled plugins(below),or include individual files as needed -->
	<script src="/js/fonts/plugin.js"></script>
	<script src="/js/fonts/main.js"></script>
	
</body>
</html>