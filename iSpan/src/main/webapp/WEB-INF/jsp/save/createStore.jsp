<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<script type="text/javascript">

function sendStoreUpdate(){
	  var name = $("#storeName").val();
	  var category = $("#storeCategory").val();
	  var phone = $("#storePhone").val();
	  var address = $("#storeAddress").val();
	  var businesshours = $("#storeBusinessHours").val();

	  
//	  var pid = $('#pid').val();

//var amount = parseInt(orderQuantity)*parseInt(price);

if($.trim(name)==''){
	   alert('請輸入商家名稱');
	   return;
}




var params = {
	    
        "storeName":name,
        "storeCategory":category,
        "storePhone":phone,
        "storeAddress":address,
        "storeBusinessHours":businesshours,
}

console.log("SUCCESS : ", JSON.stringify(params));
$.ajax({
	   type:'post',
	   url:'/Store/createStore.controller',
	   dataType:'JSON',
	   contentType:'application/json',
	   data: JSON.stringify(params),
	   success: function(data) {
	      var json = JSON.stringify(data);
	      
	      console.log("SUCCESS : ", json);
//	      $('#feedback').html("新增成功");
	      
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
</script>

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
<title>使用者登入</title>
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
											href="index.html">Home <span class="sr-only">(current)</span></a>
										</li>
										<li class="nav-item"><a class="nav-link"
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
											href="typography.html">購物車</a></li>
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

					        <section class="page-section" id="contact">
					            <div class="container">
					                <!-- Contact Section Heading-->
					                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">商家資料修改</h2>
					                <!-- Icon Divider-->
									</br>
					                <!-- Contact Section Form-->
					                <div class="row justify-content-center">
					                    <div class="col-lg-8 col-xl-7">
					                        <!-- * * * * * * * * * * * * * * *-->
					                        <!-- * * SB Forms Contact Form * *-->
					                        <!-- * * * * * * * * * * * * * * *-->
					                        <!-- This form is pre-integrated with SB Forms.-->
					                        <!-- To make this form functional, sign up at-->
					                        <!-- https://startbootstrap.com/solution/contact-forms-->
					                        <!-- to get an API token!-->
					                        <form id="contactForm"  method="post" enctype="multipart/form-data" action="/test2">
					                            <!-- Name input-->
					                            <div class="form-floating mb-3">
					                                <input class="form-control" id="storeName" name="storeName" type="text" placeholder="Enter your productname..." data-sb-validations="required" />
					                                <label for="storeName" >商家名稱</label>
					                                <div class="invalid-feedback" data-sb-feedback="storeName:required">餐點名稱還未輸入</div>
					                            </div>
					                            <!-- Email address input-->
					                            <div class="form-floating mb-3">
					                                <input class="form-control" id="storeCategory" name="storeCategory" type="text" placeholder="Enter your ProductCategory..." data-sb-validations="required" />
					                                <label for="storeCategory">商家類別</label>
					                                <div class="invalid-feedback" data-sb-feedback="storeCategory:required">餐點類別還未輸入</div>
					                            </div>
					                            <!-- Phone number input-->
					                            <div class="form-floating mb-3">
					                                <input class="form-control" id="storePhone" name="storePhone" type="text" placeholder="Enter your ProductUnitPrice..." data-sb-validations="required" />
					                                <label for="storePhone">商家電話</label>
					                                <div class="invalid-feedback" data-sb-feedback="storePhone:required">餐點單價還未輸入</div>
					                            </div>
					                            <!-- Phone number input-->
					                            <div class="form-floating mb-3">
					                                <input class="form-control" id="storeAddress" name="storeAddress" type="text" placeholder="Enter your ProductUnitPrice..." data-sb-validations="required" />
					                                <label for="storeAddress">商家地址</label>
					                                <div class="invalid-feedback" data-sb-feedback="storeAddress:required">餐點單價還未輸入</div>
					                            </div>
					                            <!-- Phone number input-->
					                            <div class="form-floating mb-3">
					                                <input class="form-control" id="storeBusinessHours" name="storeBusinessHours" type="text" placeholder="Enter your ProductUnitPrice..." data-sb-validations="required" />
					                                <label for="storeBusinessHours">商家營業時間</label>
					                                <div class="invalid-feedback" data-sb-feedback="storeBusinessHours:required">餐點單價還未輸入</div>
					                            </div>
				                            					                            					
												<!--  圖片上傳部分 -->
							                    <div class="mb-3">
							                        <div class="row">
							                            <div class="col-sm-9">
							                                <label for="uploadFile" class="form-label">上傳照片</label>
							                                <input class="form-control" type="file" name="uploadFile" id="uploadFile" accept="image/*" />
							                            </div>
							                            <div class="col-sm-3">
							                                <div class="form-control text-center" style="height:100px;">
							                                    <img src="" id="img-preview" class="h-100"/>
							                                </div>
							                            </div>
							                        </div>
							                    </div>
					
					                            <!-- Submit Button-->
					                            <button class="btn btn-primary " id="submitButton" type="button" onclick='sendStoreUpdate()'>新增</button>
					                        </form>
					                    </div>
					                </div>
					            </div>
					        </section>	





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
	<script src="/js/fonts/bootstrap.bundle.min.js"></script>
	<script src="/js/fonts/plugin.js"></script>
	<script src="/js/fonts/main.js"></script>
</body>
</html>