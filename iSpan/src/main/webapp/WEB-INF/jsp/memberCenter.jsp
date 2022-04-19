<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>會員中心</title>
<!-- STYLE CSS -->

<!-- 電話填寫驗證 X；V -->
<style type="text/css">
#telNo {
  margin-bottom: 10px;position: relative;}
#Phone + #validity {
  padding-right: 30px;}
#Phone:invalid+#validity:after {
  position: absolute; content: '✖';padding-left: 5px;color: #8b0000;}
#Phone:valid+#validity:after {
  position: absolute;content: '✓';padding-left: 5px;color: #009000;}
</style>

<!-- Tabs分頁 -->
<style>
a:hover, a:focus {
	text-decoration: none;outline: none;
}
.tab .nav-tabs {
	border: none;margin: 20px 0 20px 0;
}
.tab .nav-tabs li a {
	padding: 10px 20px;margin-right: 10px;font-size: 17px;font-weight: 600;color: #293241;text-transform: uppercase;border: none;
	border-radius: 0;background: transparent;z-index: 1;position: relative;transition: all 0.3s ease 0s;
}
.tab .nav-tabs li a:hover, .tab .nav-tabs li.active a {
	border: none;color: #fff;
}
.tab .nav-tabs li a:before {
	content: "";width: 20%;height: 100%;background: #ed5551;position: absolute;top: 0;left: 0;z-index: -1;transition: all 0.3s ease 0s;
}
.tab .nav-tabs li.active a:before, .tab .nav-tabs li a:hover:before {
	width: 100%;
}
.tab .tab-content {
	padding: 30px;background: #fff;outline: 3px solid #eb482d;outline-offset: 0px;font-size: 17px;color:;letter-spacing: 1px;
	line-height: 30px;position: relative;margin-bottom:15px;height:650px;
}
.tab .tab-content h3 {
	margin-top: 0;
}
@media only screen and (max-width: 479px) {
	.tab .nav-tabs li {
		width: 100%;text-align: center;margin-bottom: 15px;
	}
}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Raleway:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Yellowtail" rel="stylesheet">
<link href="/css/fonts/styles.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/reset.css">

<!-- 歷史訂單table -->
<script type="text/javascript">
///////////////////////////////////////////////////////////////////
	$(document).ready(function(){
		var indexPage = 1;
	      loadPage(indexPage);   

	      FormInfo();
	      
	    if(document.URL.indexOf("#")==-1){  //第一次載入網頁時會重整一次，解決換頁顯示問題
	          // Set the URL to whatever it was plus "#".
	          url = document.URL+"#";
	          location = "#";

	          //Reload the page
	          location.reload(true);
	      } 
	      
	});
/* 新註冊之帳號，提示先填寫基本資料 */
	function FormInfo() {
		var a = $('#Phone').val();
		if ( a == "")
	        swal({
	            title: "欲進行訂購請先填寫基本資料！",
	            text: "",
	            icon: "warning",
	        })
        return false;
	}
	

    function loadPage(indexPage){
        $.ajax({
            type:'post',
            url:'/Store/queryUserIDByPage/' + indexPage, // OrderController => QueryUserIDByPage 前往的網頁
            dataType:'JSON',
            contentType:'application/json',
            success: function(data){  //server送回來的訂單資料
                
                console.log(data);
                //顯示之前把Table標籤資料清空
                //清空這段<table id="showorder" border="1"></table>
                $('#showorder').empty("");
                
             	   var table = $('#showorder'); 
             	   table.append("<thead><tr id='ptitle' align='center'><th>訂單編號</th><th>訂單日期</th><th>訂單狀態</th><th>訂單總價</th><th>訂單明細</th><th>顧客回饋</th><th>評論</th></tr></thead>");
                
                if(data.length==0){
             	   $('#showorder').append("<tr align='center'><td colspan='7'>暫無訂購紀錄</td></tr>");
                }else{

             	   //data:jsonArray n:jsonObject
             	   $.each(data, function(i,n){
             		   var tr =
                 		   			"<tr align='center'>" + 
			   						"<td>" + n.orderid + "</td>" +
	   		            		   	"<td>" + n.orderdate + "</td>" + 
	   		            		   	"<td>" + n.orderstatus + "</td>" +
	   		            		    "<td>" + n.price + "</td>" +
	   		            		 	"<td><a class='collapsed btn btn-sm btn-info' href='#' data-bs-toggle='collapse' data-bs-target='#collapseLayouts" + n.orderid + "' aria-expanded='false' aria-controls='collapseLayouts'>" + "MORE" + "</a></td>" +
									"<td><a class='collapsed btn btn-success' href='#' data-bs-toggle='collapse' data-bs-target='#collapseLayoutsremark" + n.orderid + "' aria-expanded='false' aria-controls='collapseLayouts'>" + "MORE" + "</a></td>" +
	        		   				"<td><a class='btn btn-primary' href='/Store/orderquerybyid.controller?oid=" + n.orderid + " '>" + "REMARK" + "</a></td>" +
		           					"</tr>" + 

		           					/* "<td>" + n.remark + "</td>" + */
									
		           					"<tr align='center' class='collapse' id='collapseLayouts"+n.orderid+"' aria-labelledby='headingOne' data-bs-parent='#sidenavAccordion'>" + 
	                 		   		"<td colspan='5' id = 'orderid"+ n.orderid +"'></td>" +
									"</tr>"+

									"<tr align='center' class='collapse' id='collapseLayoutsremark"+n.orderid+"' aria-labelledby='headingOne' data-bs-parent='#sidenavAccordion'>" + 
	                 		   		"<td colspan='5' id = 'remark"+ n.orderid +"'></td>" +
									"</tr>";
									
					   table.append(tr);
								// 執行 loadorder(n.orderid); 根據ordrerid 查詢
			   					 loadorder(n.orderid);
			   					 
			   					 loadorderRemark(n.orderid);
                    });           	   
                }
                
            }
        });
        
     }

     function change(page){
     	indexPage = page;
     	loadPage(indexPage);
	 	} 
	 	
//	 load 訂單詳細資訊的 function
     function loadorder(oid){
		   $.ajax({
			     type:'post',
			     //透過訂單id 查詢訂單詳細資訊
			     url:'/Store/QueryInformationByOrderID.controller?oid='+ oid,
			     dataType:'JSON',
			     contentType:'application/json',
			     success: function(data){
	
			         var json = JSON.stringify(data, null, 4);
			         console.log('success:' + json);
			         var jsonArray = JSON.parse(json);

			         if(jsonArray==null){

			         }
				         $.each(jsonArray, function(i,n){
				        	var tdd = "餐點 : " + n.productName + " 數量 : " + n.number + " 價格 : " + n.productPrice +"</br>" 
				       		$('#orderid'+oid).prepend(tdd);
			         	
			         });
			     }
			});
		}

//	 load 訂單資訊的 function
     function loadorderRemark(oid){
		   $.ajax({
			     type:'post',
			     //透過訂單id 查詢訂單回饋資訊
			     url:'/Store/orderquerybyidremark.controller?oid=' + oid,
			     dataType:'JSON',
			     contentType:'application/json',
			     success: function(data){
	
			         var json = JSON.stringify(data, null, 4);
			         console.log('success:' + json);
			         var jsonArray = JSON.parse(json);

			         if(jsonArray.remark==null){
			        	 var tdd = " 尚未收到您的回饋 "+"</br>" 
			        	 $('#remark'+oid).prepend(tdd);
			         }else {
			        	var tdd = " 我的回饋 : " + jsonArray.remark +"</br>" 
			        	$('#remark'+oid).prepend(tdd);
				      }
			     }
		   });
		}

/*      if(jsonArray.remark==null){
    	 var tdd = " 尚未收到您的回饋 "+"</br>" 
    	 $('#remark'+oid).prepend(tdd);
     }else {
    	var tdd = " 我的回饋 : " + jsonArray.remark + "</br>" + " 店家回覆 : " 
    	
    	$('#remark'+oid).prepend(tdd);

    	if(jsonArray.remark2==null){
        	 
         }else {
        	 var tdd1 = jsonArray.remark2 + "</br>"
        	 $('#remark'+oid).prepend(tdd1);
	         }
      } */
///////////////////////////---------------------------------------
</script>
<style>
.panel {
	font-family: 'Raleway', sans-serif;padding: 0;border: none;box-shadow: 0 0 10px rgba(0, 0, 0, 0.08);
}
.panel .panel-heading {
	background: #535353;padding: 5px;border-radius: 0;
}
.panel .panel-heading .btn {
	color: #fff;background-color: #000;font-size: 14px;font-weight: 600;padding: 7px 15px;border: none;border-radius: 0;transition: all 0.3s ease 0s;
}
.panel .panel-heading .btn:hover {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}
.panel .panel-heading .form-horizontal .form-group {
	margin: 0;
}
.panel .panel-heading .form-horizontal label {
	color: #fff;margin-right: 10px;
}
.panel .panel-heading .form-horizontal .form-control {
	display: inline-block;width: 60px;border: none;border-radius: 0;
}
.panel .panel-heading .form-horizontal .form-control:focus {
	box-shadow: none;border: none;
}
.panel .panel-body {
	padding: 0;border-radius: 0;
}
.panel .panel-body .table thead tr th {
	color: #fff;background: #8D8D8D;font-size: 17px;font-weight: 700;padding: 12px;border-bottom: none;
}
.panel .panel-body .table thead tr th:nth-of-type(1) {
	width: ;
}
.panel .panel-body .table thead tr th:nth-of-type(3) {
	width: ;
}
.panel .panel-body .table tbody tr td {
	color: #555;background: #fff;font-size: 15px;font-weight: 500;padding: 13px;vertical-align: middle;border-color: #e7e7e7;
}
.panel .panel-body .table tbody tr:nth-child(odd) td {
	background: #f5f5f5;
}
.panel .panel-body .table tbody .action-list {
	padding: 0;margin: 0;list-style: none;
}
.panel .panel-body .table tbody .action-list li {
	display: inline-block;
}
.panel .panel-body .table tbody .action-list li a {
	color: #fff;font-size: 13px;line-height: 28px;height: 28px;width: 33px;padding: 0;border-radius: 0;transition: all 0.3s ease 0s;
}
.panel .panel-body .table tbody .action-list li a:hover {
	box-shadow: 0 0 5px #ddd;
}
.panel .panel-footer {
	color: #fff;background: #535353;font-size: 16px;line-height: 33px;padding: 25px 15px;border-radius: 0;
}
.pagination {
	margin: 0;
}
.pagination li a {
	color: #fff;background-color: rgba(0, 0, 0, 0.3);font-size: 15px;font-weight: 700;margin: 0 2px;border: none;border-radius: 0;transition: all 0.3s ease 0s;
}
.pagination li a:hover, .pagination li a:focus, .pagination li.active a{
	color: #fff;background-color: #000;box-shadow: 0 0 5px rgba(0, 0, 0, 0.4);
}
</style>

<!-- 回到最上方鈕 -->
<style type="text/css">
.toTop-arrow {
	width: 2.5rem;height: 2.5rem;border-radius: 33%;opacity: 0.6;background: #000;cursor: pointer;position: fixed;right: 1rem;bottom: 1rem;display: none;
}
.toTop-arrow::before, .toTop-arrow::after {
	width: 18px;height: 5px;border-radius: 3px;background: #f90;position: absolute;content: "";
}
.toTop-arrow::before {
	transform: rotate(-45deg) translate(0, -50%);left: 0.5rem;
}
.toTop-arrow::after {
	transform: rotate(45deg) translate(0, -50%);right: 0.5rem;
}
.toTop-arrow:focus {
	outline: none;
}
</style>

<title>會員中心</title>
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
									<!-- header 標題列 //////////////////////////////////////////////////////////////////////////-->
									<ul class="navbar-nav">
										<li class="nav-item active"><a class="nav-link"
											href="/login/welcome">Home <span class="sr-only">(current)</span></a>
										</li>
										<!-- <li class="nav-item"><a class="nav-link"
											href="about.html">關於我們</a></li> 
										<li class="nav-item"><a class="nav-link"
											href="typography.html">最新消息</a></li>
										<li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#"
											id="navbarDropdown1" role="button" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">餐點資訊</a>
											<div class="dropdown-menu" aria-labelledby="navbarDropdown1">
												<a class="dropdown-item" href="recipes.html">Recipe List</a>
												<a class="dropdown-item" href="recipe-single.html">Recipe
													Single</a> <a class="dropdown-item" href="recipe-index.html">Recipe
													Index</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="submit-recipe.html">Submit
													Recipe</a>
											</div></li>
										<li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#"
											id="navbarDropdown1" role="button" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">店家資訊</a>
											<div class="dropdown-menu" aria-labelledby="navbarDropdown1">
												<a class="dropdown-item" href="recipes.html">Recipe List</a>
												<a class="dropdown-item" href="recipe-single.html">Recipe
													Single</a> <a class="dropdown-item" href="recipe-index.html">Recipe
													Index</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="submit-recipe.html">Submit
													Recipe</a>
											</div></li>
										<li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#"
											id="navbarDropdown4" role="button" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">服務資源</a>
											<div class="dropdown-menu" aria-labelledby="navbarDropdown4">
												<a class="dropdown-item" href="contact.html">聯絡我們</a> <a
													class="dropdown-item" href="faq.html">FAQ</a>
											</div></li>

										 <li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#"
											id="navbarDropdown4" role="button" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">會員中心</a>
											<div class="dropdown-menu" aria-labelledby="navbarDropdown4">
												<a class="dropdown-item" href="/login/page">登入</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="#">註冊</a>
											</div></li> 
										<li class="nav-item"><a class="nav-link"
											href="typography.html">購物車</a></li> -->

										<li class="nav-item" ><a class="nav-link" href="/aboutus" >關於我們</a></li>
										<li class="nav-item"><a class="nav-link" href="/events" >最新消息</a></li>
										<li class="nav-item"><a class="nav-link" href="welcome" >餐廳列表</a></li>						
										<li class="nav-item"><a class="nav-link" href="/faq" >常見問題</a></li>

										<li class="nav-item"><label class="nav-link">登入帳號：${Useraccount}</label>
										</li>
										<li class="nav-item"><a class="nav-link" href="/logout">登出</a>
										</li>
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
	</div>
	<!-- end #page hfeed site -->
	<!-- ====================================================自由發揮區==================================================== -->

	<div class="container">
		<div class="row">
			<div class="offset-sm-1 col-md-10">
				<div class="tab" role="tabpanel">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#Section1" onclick=gototab()
							aria-controls="home" role="tab" data-toggle="tab">基本資料</a></li>
						<li role="presentation"><a href="#Section2"
							aria-controls="profile" role="tab" data-toggle="tab">修改密碼</a></li>
						<li role="presentation"><a href="#Section3" 
							aria-controls="messages" role="tab" data-toggle="tab" >歷史訂單</a></li>
					</ul>	
<!-- 					<script>function gototab(reload) {window.location.reload(true);}</script> //點擊"基本資料"會重整頁面-->
										
					<!-- Tab panes -->
					<div class="tab-content tabs">
						<div role="tabpanel" class="tab-pane in active" id="Section1">
							<div class="container">
								<div class="row">
									<div class="offset-sm-1 col-md-10">

										<h3 class="title">基本資料</h3>
										<h5 class="">(欲進行訂購請先填寫基本資料)</h5>
										<form id="form-userinfo" onsubmit="return submitFormA(this);"
											action="/Account/User1/membercenterupdate.controller"
											method="post">
											<div class="mb-3">
												<label class="form-label">帳號</label> <input
													name="Useremailaddress" type="text" class="form-control"
													id="Useremailaddress" value="${Useraccount}" disabled />
											</div>
											<div class="mb-3">
												<label class="form-label">姓名</label> <input name="Nickname"
													type="text" class="form-control" id="Nickname"
													value="${Nickname}" />
											</div>
											
											<div class="mb-3" id="telNo">
												<label class="form-label">電話 (09xxxxxxxx)</label> <input
													name="Phone" type="tel" class="form-control" id="Phone" minlength="10" maxlength="10" 
													value="${Phone}" required/><span class="validity" id="validity"></span>
											</div>
											<div class="mb-3">
												<label class="form-label">地址</label> <input name="Address"
													type="text" class="form-control" id="Address"
													value="${Address}" />
											</div>
											<div class="mb-3">
												<label class="form-label">生日</label> <input name="Birthday"
													type="date" class="form-control" id="Birthday"
													value="${Birthday}">
											</div>

											<!-- =================生日預設=================== 
								<script type="text/javascript">
									var now = new Date(); // 給input date設定預設值
									var day = ("0" + now.getDate()).slice(-2); //格式化日，如果小於9，前面補0
									var month = ("0" + (now.getMonth() + 1))
											.slice(-2); //格式化月，如果小於9，前面補0
									var today = now.getFullYear() + "-"
											+ (month) + "-" + (day); //拼裝完整日期格式
									$('#Birthday').val(today); //完成賦值
								</script>-->

											<div align="center">
												<button type="submit" class="btn btn-primary">送出修改</button>
											</div>
										</form>

										<script type="text/javascript">
										function submitFormA(form) {
											
											var nickname = $('#Nickname').val();
											var phone = $('#Phone').val();
											var address = $('#Address').val();
											var birthday = $('#Birthday').val();
									        swal({
									            title: "資料已修改成功",
									            text: "暱稱：" + nickname + "\n電話："+ phone + "\n地址：" + address+ "\n生日：" + birthday,
									            icon: "success",
									        })
										        .then(function (isOkay) {
										            if (isOkay) {
										                form.submit();
										            }
										        });
									        return false;
									    }
											
										</script>

									</div>
								</div>
							</div>
						</div>

						<div role="tabpanel" class="tab-pane " id="Section2">
							<div class="container">
								<div class="row">
									<div class="offset-sm-1 col-md-10">

										<h3 class="title">修改密碼</h3>
										<form id="form-userinfo" onsubmit="return submitForm(this);"
											action="/Account/User1/membercenterupdatepwd.controller"
											method="post">

											<div class="mb-5">
												<label class="form-label">新密碼</label> <input
													name="userpassword" type="password" class="form-control"
													id="userpassword" required placeholder="請輸入新密碼"
													onkeyup="KeyUp()" />
											</div>
											<div class="mb-5">
												<label for="userpassword-new" class="form-label">請再次輸入新密碼</label>
												<input name="userpassword-new" type="password"
													class="form-control" id="userpassword-new" required
													placeholder="再次輸入新密碼" onkeyup="KeyUp()" /> <span
													id="different-pwd"></span>
											</div>
											<div align="center">
												<button type="submit" id="submit1" class="btn btn-primary"
													disabled onclick="processFormDataPwd()">送出修改</button>
											</div>
										</form>

										<script type="text/javascript">
											
											function submitForm(form) {
												
										        swal({
										            title: "您的密碼已修改！",
										            text: "",
										            icon: "warning",
										        })
										        .then(function (isOkay) {
										            if (isOkay) {
										                form.submit();
										            }
										        });
										        return false;
											}
										</script>

										<script>
											function KeyUp() {
												var a = $('#userpassword').val();
												// alert(a); 
												var b = $('#userpassword-new').val();
												// alert(b); 
												if (a == b && a != "") {
													$('#submit1').removeAttr('disabled');
													document
															.getElementById("different-pwd").innerHTML = "";
												} else {
													$('#submit1').attr('disabled',
															'disabled');
													document
															.getElementById("different-pwd").innerHTML = "<h5 style='color:red;padding-top:10px;'>兩次密碼不相同，請重新輸入。</h5>";
												}
											}
										</script>
									</div>
								</div>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane " id="Section3">

							<div class="container">
								<div class="row">
									<div class=" col-md-12">

										<h3 class="title">歷史訂單</h3>
										<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css /> -->
										<div class="panel">
											<div class="panel-body table-responsive">
											
											<!-- Ajax呈現歷史訂單table -->
													<table id="showorder" class="table"></table>										
											</div>
											<div class="panel-footer">
												<div class="row">
													<div class="col-sm-12 col-xs-12">
														<ul class="pagination hidden-xs pull-right" style="float:right">
															<li style="padding-right: 20px;">總頁數:${totalPages}</li>
															<li style="padding-right: 20px;">總筆數:${totalElements}</li>
															<li style="padding-right: 20px">《 <c:forEach
																	var="i" begin="1" end="${totalPages}" step="1">
																	<button id="myPage" value="${i}" onclick="change(${i})">${i}</button>
																</c:forEach> 》
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
										

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- =================回到頂端鈕=================== -->

	<button type="button" id="BackTop" class="toTop-arrow"></button>
	<script>
		$(function() {
			$('#BackTop').click(function() {
				$('html,body').animate({
					scrollTop : 0
				}, 333);
			});
			$(window).scroll(function() {
				if ($(this).scrollTop() > 100) {
					$('#BackTop').fadeIn(222);
				} else {
					$('#BackTop').stop().fadeOut(222);
				}
			}).scroll();
		});
	</script>

	<!-- ==================================================================================================================== -->


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



	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="/js/fonts/modernizr-3.7.1.min.js"></script>
	<script src="/js/fonts/jquery-3.4.1.min.js"></script>

	<!-- Include all compiled plugins(below),or include individual files as needed -->
	<script src="/js/fonts/bootstrap.bundle.min.js"></script>
	<script src="/js/fonts/plugin.js"></script>
	<script src="/js/fonts/main.js"></script>

	<!-- SweetAlert CDN -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>