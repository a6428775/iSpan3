<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ProductListAll</title>
<link rel="stylesheet" href="/css/ordersystem.css">
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'>
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
    var indexPage = 1;

    $(document).ready(function(){
          loadPage(indexPage);
    });

    function loadPage(indexPage){
       $.ajax({
           type:'post',
           url:'/product/queryByPage/' + indexPage,
           dataType:'JSON',
           contentType:'application/json',
           success: function(data){
               console.log(data);
               
               $('#showproduct').empty("");
               
               if(data==null){
            	   $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
               }else{
            	   var table = $('#showproduct'); 
            	   table.append("<tr id='ptitle'><th>ID</th><th>產品名稱</th><th>類別</th><th>價格</th><th>商家</th><th></th></tr>");

            	   //data: jsonArray n:jsonOnject
            	   $.each(data, function(i,n){
            		   var tr = "<tr id='product' align='center'>" + "<td id='pid'>" + n.productid + "</td>" +
            		            "<td id='name'>" + n.productname + "</td>" + "<td id='category'>" + n.productcategory + "</td>" +
            		            "<td id='price'>" + n.productunitprice + "</td>" + "<td id='sid'>" + n.storeid + "</td>" +
            		            "<td>" + "<button class='add-to-cart'>" + "加入購物車" +  "</button>" + "</td>" +
            		            
            		            "</tr>";
            		   table.append(tr);
            		   
                   });           	   
               }
           }
       });
    }

    function change(page){
    	indexPage = page;
    	loadPage(indexPage);
    } 

</script>
</head>
<body>
	<div id="productListTitle">產品一覽</div>
	<table id="showproduct" border="1"></table>
	<table id="showpage">
		<tr>
			<td>Total Pages:${totalPages} Total Records:${totalElements}</td>
			<td colspan="3" align="right">Previous <c:forEach var="i"
					begin="1" end="${totalPages}" step="1">
					<button id="myPage" value="${i}" onclick="change(${i})">${i}</button>
				</c:forEach>Next
			</td>
		</tr>
		<tr>
			<td align="right"><a href="/login/welcome">首頁</a></td>
			<td align="right"><a href="/login/welcome">首頁2</a></td>
			<td align="right"><a href="/shoppingcart">購物車only</a></td>
			
		</tr>
	</table>

	<div class="container">
		<button type="button" class="btn btn-success" data-toggle="modal"
			data-target="#cartModal"><svg class="cart" width="24" height="24" viewBox="0 0 24 24">
  <path d="M17,18C15.89,18 15,18.89 15,20A2,2 0 0,0 17,22A2,2 0 0,0 19,20C19,18.89 18.1,18 17,18M1,2V4H3L6.6,11.59L5.24,14.04C5.09,14.32 5,14.65 5,15A2,2 0 0,0 7,17H19V15H7.42A0.25,0.25 0 0,1 7.17,14.75C7.17,14.7 7.18,14.66 7.2,14.63L8.1,13H15.55C16.3,13 16.96,12.58 17.3,11.97L20.88,5.5C20.95,5.34 21,5.17 21,5A1,1 0 0,0 20,4H5.21L4.27,2M7,18C5.89,18 5,18.89 5,20A2,2 0 0,0 7,22A2,2 0 0,0 9,20C9,18.89 8.1,18 7,18Z"></path>
	</svg> 購物車</button>
	</div>

	<div class="modal fade" id="cartModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered"
			role="document">
			<div class="modal-content">
				<div class="modal-header border-bottom-0">
					<h5 class="modal-title" id="exampleModalLabel">購物車</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table table-image">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">產品名稱</th>
								<th scope="col">單價</th>
								<th scope="col">數量</th>
								<th scope="col">總價</th>
								<th scope="col">移除</th>
							</tr>
						</thead>
						<tbody id="cartItem"></tbody>
					</table>
					<div class="d-flex justify-content-end" id="total">
						<h5>
							<span class="price text-success">Total</span>
						</h5>
					</div>
				</div>
				<div
					class="modal-footer border-top-0 d-flex justify-content-between">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">關閉</button>
					<button type="button" class="clearCart" onclick="clearCart()">清空購物車</button>	
					<button type="button" class="btn btn-success" onclick="checkout()">結帳</button>
				</div>
			</div>
		</div>
	</div>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
	<script
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>
	<script src="/js/shoppingcart.js"></script>
</body>
</html>