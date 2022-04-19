<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/ordersystem.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
	   var pid = $("#pid").val();
       load(pid);
   });

   function sendOrder(pid){
       var orderQuantity = $("#orderQuantity").val();
       var quantity = $("#quantity").val();
       var price = $("#price").val();

       var amount = parseInt(orderQuantity)*parseInt(price);

       if($.trim(orderQuantity)==''){
    	   alert('Order Quantity is empty');
    	   return;
       }

       if(parseInt(orderQuantity)>parseInt(quantity)){
    	   alert('Order Quantity can not more than Product Quantity');
    	   return;
       }

       var params = {
           "amount":amount,
           "userid":1001,
           "productid":pid
       }

       $.ajax({
    	   type:'post',
    	   url:'/users/orders/ordersinsert.controller',
    	   dataType:'JSON',
    	   contentType:'application/json',
    	   data: JSON.stringify(params),
    	   success: function(data) {
    	      var json = JSON.stringify(data);
    	      console.log("SUCCESS : ", json);
    	      $('#feedback').html(json);
    	      var parsedObjinArray = JSON.parse(json);
    	      $.each(parsedObjinArray, function(index, value) {
    	          console.log(value);
    	      });
    	   },
    	   error: function() {
    	      console.log("error");
           }
       });
   }

   function load(pid){
	   $.ajax({
           type:'post',
           url:'/product/productquerybyid.controller?pid='+ pid,
           dataType:'JSON',
           contentType:'application/json',
           success: function(data){
               var json = JSON.stringify(data, null, 4);
               console.log('success:' + json);
               var jsonArray = JSON.parse(json);
               $('#showproduct').empty("");
               if(json==null){
                   $('table').prepend('<tr><td colspan="2">No Result</td></tr>');
               }else{
            	   var table = $('#showproduct');
            	   table.append("<tr id='ptitle'><th>產品編號</th><th>產品名稱</th><th>產品種類</th><th>產品價格</th><th>產品數量</th><th>訂購數量</th></tr>");
            	   var tr = "<tr align='center'>" +
            	   "<td>" + jsonArray.pid + "</td>" 
            	   "<td>" + jsonArray.pname + "</td>" +
            	   "<td>" + jsonArray.category + "</td>" +
            	   "<td><input id='price' type='text' value='" + jsonArray.price + "' readonly/></td>" +
            	   "<td><input id='quantity' type='text' value='"+ jsonArray.quantity +"' readonly/></td>" +
            	   "<td><input id='orderQuantity' type='text'/></td>" +
            	   "<td><button id='order' type='button' value='order' onclick='sendOrder(" + jsonArray.id + ")'>order</button></td>" +
            	   "</tr>";
            	   table.append(tr);
               }
           }
	   });
   }
</script>
<meta charset="UTF-8">
<title>Product Purchase Order</title>
</head>
<body>
<div id="productListTitle">PurchaseOrder</div>
<table id="showproduct" border="1"></table>
<input id="pid" type="hidden" value="${pid}">
<div id="feedback" align="center"></div>
</body>
</html>