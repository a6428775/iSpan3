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
<style type="text/css">
</style>
<title>意見回饋</title>
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
											href="about.html">關於我們</a></li> -->
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

										<!-- <li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#"
											id="navbarDropdown4" role="button" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">會員中心</a>
											<div class="dropdown-menu" aria-labelledby="navbarDropdown4">
												<a class="dropdown-item" href="/login/page">登入</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="#">註冊</a>
											</div></li> -->
										<li class="nav-item"><a class="nav-link"
											href="typography.html">購物車</a></li>

										<%-- <li class="nav-item"><label class="nav-link">登入帳號：${Useraccount}</label>
										</li> --%>
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
				<div class="offset-sm-1 col-md-10 tab-content">

					<div class="rt-panel rt-panel-default rt-panel-header">
						<div class="rt-panel-inner">
							<form class="rt-form" name="my_opinion" onsubmit="return submitForm(this);"
								action="/OrderInformationupdate.controller" method="post"
								data-module="my-opinion">
								<!-- <input type="hidden" name="goods_order_no" value="52023229860324">
					<input type="hidden" name="url"
						value="aHR0cHM6Ly9teWJpZC5ydXRlbi5jb20udHcvbWFzdGVyL215LnBocD9sX3R5cGU9YnV5X2Z1bGw=">
					<input type="hidden" name="c_mode" value="1"> -->
								<h1 class="rt-panel-title rt-mb">評價店家</h1>
								<ul class="feedback-notice">
									<li class="feedback-notice-list">感謝您的支持，歡迎留下您的寶貴意見。
									</li>
									
								</ul>
								<h1 class="rt-panel-title rt-mb">訂單資訊</h1>
								<ul class="feedback-notice">
									<li class="feedback-notice-list">訂單編號 : ${oid} </li>
									<li class="feedback-notice-list">店家名稱 : ${StoreName}</li>
									
									
								</ul>
								<div class="rt-panel-inner rt-panel-border">
										
										<div class="rt-form-group clearfix">
											<label class="rt-form-label" for="credit_opinion">評價意見：</label>
											
											<div class="rt-form-control rt-mt feedback-ml">
												<textarea class="form-control" name="opinion" id="opinion"
													rows="5" data-type="opinion"></textarea>
											</div>
											<input name="oid" type="hidden" class="form-control" id="oid" value="${oid}"  />
										</div>
										
										<div class="rt-mb rt-mt rt-align-center">
											<button class="btn btn-primary" 
												type="submit">填好了，送出評價</button>
											<button
												class="btn btn-info"
												type="reset">重新填寫</button>
										</div>
									</div>
								</form>
								
								<script type="text/javascript">
								function submitForm(form) {
							        swal({
							            title: "已收到您的回饋，歡迎再次訂購！",
							            text: "",
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