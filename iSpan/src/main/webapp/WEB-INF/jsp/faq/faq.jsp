<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>常見問題</title>
<!-- STYLE CSS -->
<link href="https://fonts.googleapis.com/css?family=Raleway:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Yellowtail"
	rel="stylesheet">
<link href="/css/fonts/styles.css" rel="stylesheet">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">


	$(document).ready(function(){
		var indexPage = 1;
	      loadPage(indexPage);
	});

function loadPage(indexPage){
	
    $.ajax({
        type:'post',
        url:'/product/testtest',
            //queryByPage/' + indexPage,
        dataType:'JSON',
        contentType:'application/json',
        success: function(data){
            
            console.log(data);
            //顯示之前把Table標籤資料清空
            //清空這段<table id="showorder" border="1"></table>
			$('#showorder').empty("");

            
            if(data==null){
         	   $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
            }else{
         	   var table = $('#showorder'); 
         	   table.append("<tr id='ptitle' align='center'> <th>餐點ID</th> <th>餐點名稱</th> <th>餐點種類</th> <th>餐點單價</th> <th>餐點圖片</th> <th> </th> </tr>");
	
         	   //data:jsonArray n:jsonObject
         	   $.each(data, function(i,n){

      
					//如果 餐點沒有圖片  不顯示 圖片的圖示
          			if (n.preview === null){
                    	   n.preview = "";
                           }

							
                   
         		   var tr = 
             		   		"<tr align='center'>" + 
         		   			"<td>" + n.productid + "</td>" +
         		            "<td>" + n.productname + "</td>" + 
         		            "<td>" + n.productcategory + "</td>" +
         		            "<td>" + n.productunitprice + "</td>" + 
         		            "<td>" + "<img id='img-preview' src=" + n.preview + ">" + "</td>" + 
         		         	"<td><a href='/product/updateproduct.controller?pid="+ n.productid +"'>修改餐點</a></td>"+
         		            "</tr>";

         		   table.append(tr);

					var dr =
										"<div class='col-6 col-md-3'>"+
										"<div class='recipe-thumb'>"+
											"<img src='/images/content/thumb-8.png' alt='Recipe Image'>"+
											"<a href='#' class='bookmarker'><i class='fas fa-bookmark'></i></a>"+
											"<div class='view-recipe' >"  +
											"<a href='#' class='add-to-cart' style='color:white'>加入購物車</a>" +
												
											"<span href='#' id='name' style='display:none'>" + n.productname + "</span>"+
											"<span id='price' style='display:none'>"+ n.productunitprice + "</span>"+	
											"<span href='#' id='pid' style='display:none'>" + n.productid + "</span>"+
											"<span href='#' id='sid' style='display:none'>" + n.storeid + "</span>"+	
											"</div>"+
											
										"</div>"+
										"<div class='recipe-desc'>"+
											"<h2 class='recipe-title'>"+
											"<span href='#' id='name'> " + n.productname + "</span>"+
											"</h2>"+
											"<p>"+
												
												"<em id=''>By Lina Sukowati</em>"+
											"</p>"+
											"<span>價格：$ </span><span id='price'>"+ n.productunitprice + "</span>"+	

										"</div>"+
										<!-- end recipe-desc -->

										"</div>";
	
					$('#test2').append(dr);		

                       
         	
                });       
            }
        }
    });
 }


</script>
<style type="text/css">
.rt-text-note {
	color: #8d8d8d;
	padding-top: 30px;
}

.btn-re {
	text-align: center;
}

.btn-1 {
	float: right;
}

.loginerror {
	color: #f00;
	text-align: center;
}

.cartModal {
	position: fixed;
	z-index: 10000;
	padding: 20px
}
</style>

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
								<!-- 左上logo圖片////////////////////////////////////////////////////////////////////////// -->
								<a href="/login/welcome"><img src="/images/logo-2.png"
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
										

										
										<!-- <li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#"
											id="navbarDropdown4" role="button" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">會員中心</a>
											<div class="dropdown-menu" aria-labelledby="navbarDropdown4">
												<a class="dropdown-item" href="/user1/membercenter.controller">登入</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="/createuser1main.controller">註冊</a>
											</div>
										</li> -->
									
									<!--	<li class="nav-item"><a class="nav-link" href="/test2">餐點測試頁面</a></li>-->


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
	<!-- end col-md-6 -->

	</nav>
	</div>
	<!-- end col-md-3 -->

	</div>
	<!-- end row -->

	</div>
	<!-- end container-fluid -->
	</div>
	<!-- end header-navigation -->
	</header>
	<!-- end #masthead -->


	<div class="head-title">
		<div class="container">
			<h2 class="page-title">常見問題</h2>
		</div>
		<!-- end container -->
	</div>
	<!-- end head-title -->

	<div id="main">
		<div class="container">

			<div class="faq-content">
				<div class="row">
					<div class="col-6 col-md-4">
						<span> <i class="fas fa-bullhorn"></i>
						</span>
						<h3>什麼是美好食程?</h3>
						<p>
							<strong style="color: red;">美好食程</strong>是一個線上訂餐平台,可以用來預定餐點。
						</p>
					</div>
					<!-- end col -->

					<div class="col-6 col-md-4">
						<span> <i class="fas fa-question"></i>
						</span>
						<h3>如何點餐</h3>
						<p>依照畫面流程指示,可以把餐點加入購物車,購物完成後,選擇付款方式,完成訂單後,等待店家完成訂單即可享受美食。</p>
					</div>
					<!-- end col -->

					<div class="col-6 col-md-4">
						<span> <i class="fas fa-award"></i>
						</span>
						<h3>為什麼要線上訂餐?</h3>
						<p>可以事先訂餐,節省等待時間,多樣性付款方式,可以讓生活更加便利。</p>
					</div>
					<!-- end col -->

					<div class="col-6 col-md-4">
						<span> <i class="fas fa-bolt"></i>
						</span>
						<h3>輕鬆訂購</h3>
						<p>輕鬆訂購,手指點一點餐點輕鬆完成訂購,不管手機、平板、筆電、電腦各種裝置皆可訂購。</p>
					</div>
					<!-- end col -->

					<div class="col-6 col-md-4">
						<span> <svg xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-123"
								viewBox="0 0 16 16">
  <path
									d="M2.873 11.297V4.142H1.699L0 5.379v1.137l1.64-1.18h.06v5.961h1.174Zm3.213-5.09v-.063c0-.618.44-1.169 1.196-1.169.676 0 1.174.44 1.174 1.106 0 .624-.42 1.101-.807 1.526L4.99 10.553v.744h4.78v-.99H6.643v-.069L8.41 8.252c.65-.724 1.237-1.332 1.237-2.27C9.646 4.849 8.723 4 7.308 4c-1.573 0-2.36 1.064-2.36 2.15v.057h1.138Zm6.559 1.883h.786c.823 0 1.374.481 1.379 1.179.01.707-.55 1.216-1.421 1.21-.77-.005-1.326-.419-1.379-.953h-1.095c.042 1.053.938 1.918 2.464 1.918 1.478 0 2.642-.839 2.62-2.144-.02-1.143-.922-1.651-1.551-1.714v-.063c.535-.09 1.347-.66 1.326-1.678-.026-1.053-.933-1.855-2.359-1.845-1.5.005-2.317.88-2.348 1.898h1.116c.032-.498.498-.944 1.206-.944.703 0 1.206.435 1.206 1.07.005.64-.504 1.106-1.2 1.106h-.75v.96Z" />
</svg>
						</span>
						<h3>如何新增餐點</h3>
						<p>登入廠商帳號可以進入新增商品或者是編輯商品價格、折扣、跟刪除產品。</p>
					</div>
					<!-- end col -->

					<div class="col-6 col-md-4">
						<span> <i class="fas fa-credit-card"></i>
						</span>
						<h3>多樣性付款</h3>
						<p>可以使用現金、信用卡、第三方支付系統付款。</p>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->

				<div class="row-space"></div>

				<div class="row justify-content-center">
					<div class="col-12 col-md-8">
						<div id="accordion">

							<div class="card">
								<div class="card-header" id="headingOne">
									<h5 class="mb-0">
										<button class="btn btn-link" data-toggle="collapse"
											data-target="#collapseOne" aria-expanded="true"
											aria-controls="collapseOne">可以在哪裡找到我們?</button>
									</h5>
								</div>

								<div id="collapseOne" class="collapse show"
									aria-labelledby="headingOne" data-parent="#accordion">
									<div class="card-body">可以使用本網站內的聯繫我們,會有專人在最短的時間內提供您服務!!</div>
								</div>
							</div>
							<!-- end card -->
							<div class="card">
								<div class="card-header" id="headingTwo">
									<h5 class="mb-0">
										<button class="btn btn-link collapsed" data-toggle="collapse"
											data-target="#collapseTwo" aria-expanded="false"
											aria-controls="collapseTwo">可以使用現金付款嗎?</button>
									</h5>
								</div>
								<div id="collapseTwo" class="collapse"
									aria-labelledby="headingTwo" data-parent="#accordion">
									<div class="card-body">
										美好食程平台上都是以線上支付為主。您可以使用信用卡、現金等多元支付方式，歡迎多加利用。</div>
								</div>
							</div>
							<!-- end card -->

							<div class="card">
								<div class="card-header" id="headingThree">
									<h5 class="mb-0">
										<button class="btn btn-link collapsed" data-toggle="collapse"
											data-target="#collapseThree" aria-expanded="false"
											aria-controls="collapseThree">支付頁面顯示「使用台灣發行的信用卡時，系統將發送驗證碼」，每次下單皆未收到手機驗證簡訊，請問這樣是正常的程序嗎？</button>
									</h5>
								</div>
								<div id="collapseThree" class="collapse"
									aria-labelledby="headingThree" data-parent="#accordion">
									<div class="card-body">您好，綠界支付手機驗證，有時候會因為電信設定拒收廣告訊息，收不到驗證碼故不能訂購成功，因此美好食程將簡訊功能關閉，沒有發送手機驗證是正常的喔!</div>
								</div>
							</div>
							<!-- end card -->
							<div class="card">
								<div class="card-header" id="headingFour">
									<h5 class="mb-0">
										<button class="btn btn-link" data-toggle="collapse"
											data-target="#collapseFour" aria-expanded="true"
											aria-controls="collapseFour">我的帳號被停權或停用了</button>
									</h5>
								</div>
								<div id="collapseFour" class="collapse"
									aria-labelledby="headingFour" data-parent="#accordion">
									<div class="card-body">您好，有許多原因會造成帳號遭停用，而我們會以不同方式處理這些個案，瞭解如何修復登入問題，可透過信箱聯繫我們，由專人為您服務。</div>
								</div>
							</div>
							<!-- end card -->

							<div class="card">
								<div class="card-header" id="headingFive">
									<h5 class="mb-0">
										<button class="btn btn-link collapsed" data-toggle="collapse"
											data-target="#collapseFive" aria-expanded="false"
											aria-controls="collapseFive">自取服務？</button>
									</h5>
								</div>
								<div id="collapseFive" class="collapse"
									aria-labelledby="headingFive" data-parent="#accordion">
									<div class="card-body">您好，到店取餐服務是用戶自行到店家取餐喔！先用本網站訂餐，店家接單後製作完成餐點，本網站會通知用戶可前往取餐喔！</div>
								</div>
							</div>
							<!-- end card -->
							<div class="card">
								<div class="card-header" id="headingSix">
									<h5 class="mb-0">
										<button class="btn btn-link collapsed" data-toggle="collapse"
											data-target="#collapseSix" aria-expanded="false"
											aria-controls="collapseSix">我們接受外國服務嗎?</button>
									</h5>
								</div>
								<div id="collapseSix" class="collapse"
									aria-labelledby="headingSix" data-parent="#accordion">
									<div class="card-body">我們目前不接受外國訂單,也不支援國外廠商登入產品,敬請見諒!</div>
								</div>
							</div>
							<!-- end card -->

						</div>
						<!-- end accordion -->
					</div>
					<!-- end col -->

				</div>
				<!-- end row -->
			</div>
			<!-- end faq content -->

		</div>
		<!-- end container -->
	</div>
	<!-- end main -->


	<!-- 頁尾 //////////////////////////////////////////////////////////////////////////-->
	<div class="bottom">
		<div class="container">

			<!-- 刪除關於我們 -->

			<!-- 頁尾 /////////////////////////////////////////////////////////////////////-->
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
						<li><a href="/login/welcome">Home</a></li>
						<li><a href="#">Contact Us</a></li>
						<li><a href="/private">隱私權政策</a></li>
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
	</div>
	</div>


	</div>
	<!-- end #page hfeed site -->

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="/js/fonts/modernizr-3.7.1.min.js"></script>
	<script src="/js/fonts/jquery-3.4.1.min.js"></script>

	<!-- Include all compiled plugins(below),or include individual files as needed -->
	<script src="/js/fonts/bootstrap.bundle.min.js"></script>
	<script src="/js/fonts/plugin.js"></script>
	<script src="/js/fonts/main.js"></script>
	<script src="/js/shoppingcart.js"></script>
</body>
</html>