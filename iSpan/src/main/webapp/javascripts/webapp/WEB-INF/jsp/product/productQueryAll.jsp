<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>ProductListAll</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/css/ordersystem.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style type="text/css">
		.header{
			display:flex;
			padding:6px 10px;
			background-color:#555;
		}
		.header .logo{
			display:inline-block;
			padding:15px 0;
		}
		.header nav{
			text-align: right;
			width: 100%;
			padding:20px 20px;
			font-size: 0;
		}
		.header nav a{
			font-size:20px;
			color:#fff;
			text-decoration:none;
			display:inline-block;
			padding:0 20px;
		}
		.header nav a:hover{
			background-color:#fa0;
		}
</style>
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
	            	   table.append("<tr id='ptitle'><th>產品編號</th><th>產品名稱</th><th>產品種類</th><th>產品價格</th><th>產品數量</th></tr>");
	
	            	   //data: jsonArray n:jsonOnject
	            	   $.each(data, function(i,n){
	            		   var tr = "<tr align='center'>" + "<td>" + n.pid + "</td>" +
	            		            "<td>" + n.pname + "</td>" + "<td>" + n.category + "</td>" +
	            		            "<td>" + n.price + "</td>" + n.quantity + "</td>" +"</tr>";
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
	<div class="header">
		<a href="#" class="logo"><img alt="網站名稱" src="https://picsum.photos/100/40?random=1"></a>
		<nav>
			<a href="/welcome" >首頁</a>
			<a href="/aboutus/aboutus.controller">品牌介紹</a>
			<a href="/users/membercentre.controller">會員中心</a>
			<a href="#">活動資訊</a>
			<a href="#">服務資源</a>
			<a href="#">最新消息</a>
		</nav>
	</div>
	<div id="productListTitle">ProductQueryAll</div>
	<table id="showproduct" border="1"></table>
	<table id="showpage">
	   <tr>
	      <td>Total Pages:${totalPages} Total Records:${totalElements}</td>
	      <td colspan="3" align="right">Previous
	         <c:forEach var="i" begin="1" end="${totalPages}" step="1">
	             <button id="myPage" value="${i}" onclick="change(${i})">${i}</button>
	         </c:forEach>Next
	      </td>
	   </tr>
	   <tr>
	   		<td ><a href="/welcome">首頁</a></td>
	   </tr>
	</table>
</body>
</html>