<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>home</title>
<!-- STYLE CSS -->
<link href="https://fonts.googleapis.com/css?family=Raleway:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Yellowtail"
	rel="stylesheet">
<link href="/css/fonts/styles.css" rel="stylesheet">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING:Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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

		<!-- 刪除搜尋列 -->

		<!-- 幻燈片 輪播圖 SLIDER SECTION /////////////////////////////////////////////////////////////////////-->



		<!-- 刪除中間大圖1 -->

		<!-- 產品圖 /////////////////////////////////////////////////////////////////////-->


		<!-- 刪除作者群介紹 -->

		<!-- 刪除中間大圖2 -->

		<!-- 文章分享(可改為餐廳簡介) /////////////////////////////////////////////////////////////////////-->

		<!-- end blog-section -->

		<!-- 刪除社群分享 -->
		<div class="head-title">
			<div class="container">
				<h2 class="page-title">聯繫我們</h2>
			</div>
			<!-- end container -->
		</div>
		<!-- end head-title -->


		<div class="col-md-15">
			<div class="contact-form">
				<h3>請在這裡留言問題</h3>
				<p>請填寫下面的表格，我們會盡快與您聯繫</p>
				<form>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputAddress">地址</label><input type="text"
								class="form-control" id="inputAddress"
								placeholder="xx市xx區xx里xx路xx號">
						</div>
						<div class="form-group col-md-6">
							<label for="inputEmail">Email</label><input type="email"
								class="form-control" id="inputEmail" placeholder="Email">
						</div>
					</div>
					<div class="form-row">
						<label for="messageTextarea">訊息</label>
						<textarea class="form-control" id="messageTextarea" rows="6"></textarea>
					</div>
					<!-- end form-row -->
					<div class="form-button">
						<button type="submit" class="btn btn-primary">發送訊息</button>
					</div>
				</form>
			</div>
			<!-- end contact-form -->
		</div>
		<!-- end col -->
	</div>
	<!-- end row -->
	
		<div class="col-md-10">
			<p>
				<strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp美好食程位置</strong>
			</p>
			<p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp線上平台,無實體地址</p>
			<p>
				<strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp專人服務時間</strong>
			</p>
			<p>
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp週一~週五:9:00 am - 6:00 pm<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp週六~週日:休息
			</p>
		</div>
	</div>

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