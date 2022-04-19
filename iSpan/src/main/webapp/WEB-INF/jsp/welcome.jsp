<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>home</title>
<!-- STYLE CSS -->
<link href="https://fonts.googleapis.com/css?family=Raleway:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Yellowtail" rel="stylesheet">
<link href="/css/fonts/styles.css" rel="stylesheet">

<!-- 123 -->

<link href="/css/fronts/style2.css" rel='stylesheet' type='text/css' media="all" />

<link href="/css/fronts/component.css" rel="stylesheet" type="text/css"  />

<link href="/css/fronts/welcome.css" rel="stylesheet" type="text/css"  />	

<!-- 123 -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING:Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<script type="text/javascript">   

$(document).ready(function(){
    login();
    StoreAll2();
    StoreAll();
});

function login(){


    $.ajax({
        type:'post',
        url:'/Auth.controller',
        dataType:'JSON',
        contentType:'application/json',
        success: function(data){
        	var member = "<li class='nav-item'><a class='nav-link' href='/verifyIdentity.controller' style='font-size:18px;'>會員中心</a></li>"
            var logout = "<li class='nav-item'><a class='nav-link' href='/logout' id='logout' style='font-size:18px;'>登出</a></li>"
                
        	$('#loginlogout').append(member);
        	$('#loginlogout').append(logout);
			

            },
   		error : function(){

   	   		var login = "<li class='nav-item'><a class='nav-link' href='/login/page' id='login'  style='font-size:18px;'>登入</a></li>"
   			$('#loginlogout').append(login);
   	   		}
    });
}

//推薦餐廳//////////////////////////////////////
	    function StoreAll2(){
	       $.ajax({
	           type:'post',
	           url:'/product/StoreAll.controler',
	           dataType:'JSON',
	           contentType:'application/json',
	           success: function(data){
	               console.log(data);
	               
	               $('#showproduct').empty("");
	               
	               if(data==null){
	            	   $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
	               }else{
	            	   
//	            	   table.append("<tr id='ptitle'><th>產品編號</th><th>產品名稱</th><th>產品種類</th><th>產品價格</th><th>產品數量</th></tr>");
	
	            	   //data: jsonArray n:jsonOnject
// 	            	   $.each(data, function(i,n){
// 	            		   var tr = "<tr align='center'>" + "<td>" + n.pid + "</td>" +
// 	            		            "<td>" + n.pname + "</td>" + "<td>" + n.category + "</td>" +
// 	            		            "<td>" + n.price + "</td>" + n.quantity + "</td>" +"</tr>";
// 	            		   table.append(tr);
// 	                   });      
	            	   //data: jsonArray n:jsonOnject
	            	   $.each(data, function(i,n){

		            	   
						var src ="/images/store";
              			if (n.preview === null){
                        	   n.preview = "";
                        	   src="";
                               }
              			var fileDir = n.preview;
              			var suffix = fileDir.substr(fileDir.lastIndexOf("\\"));
	            		var div =
	            		"<li>"
	           			+"<div class='team1' align='center' valign='center' >"
	    //       			+ "<img src='images/t2.jpg' class='img-responsive' alt='' />"
		//				+ "<a href='http://localhost:8081/test2'><img  src='${pageContext.request.contextPath }/images/" + n.storeID + ".jpg'  class='img-responsive' alt=''/></a>"
						+ "<a href='/product/testtest2?sid="+ n.storeID +"'><img class='img-responsive' src= " + src + suffix + " /></a>"
	//					+ "<input  type='image'  name='submit_Btn'  id='submit_Btn' src='${pageContext.request.contextPath }/images/" + n.storeID + ".jpg'  onClick='document.form1.submit()' >"
						+ "<h6>　 " + n.storeName + "</h6>"
						+ "<p style='color:red'>　 " + n.storeCategory + "</p>"
						+ "<p style='color:red'>　 " + n.storePhone + "</p>"
						+ "</div>"
						+ "</li>";


						
						$('#flexiselDemo3').append(div);
	                   });    	   
	               }
	           }
	       });
	    }

		$(window).on('load', function() {
				
			$("#flexiselDemo3").flexisel({
				visibleItems: 5,
				animationSpeed: 1000,
				autoPlay: true,
				autoPlaySpeed: 2500,    		
				pauseOnHover: true,
				enableResponsiveBreakpoints: true,
				responsiveBreakpoints: { 
					portrait: { 
						changePoint:480,
						visibleItems: 1
					}, 
					landscape: { 
						changePoint:640,
						visibleItems: 2
					},
					tablet: { 
						changePoint:768,
						visibleItems: 4
					}
				}

					
			});
				
		});		   

/////////////////////////////////////////////
///////////////////////////////

		function StoreAll(){

			var SearchText = document.getElementById("mySearch").value;
	       $.ajax({
	           type:'post',
	           url:'/product/StoreAll.controler',
	           //url:'/product/StoreByName.controler',
	           dataType:'JSON',
	           contentType:'application/json',
	           success: function(data){
	               console.log(data);
	               console.log(SearchText);
	               //console.log(flag);
	               

	               $('#divData').empty("");
//             	   $('#flexiselDemo3').empty("");
	               
	               if(data==null){
	            	   $('#divData').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
	            	   $('#flexiselDemo3').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
	               }else{
	            		
	            	   $.each(data, function(i,n){

							var src ="/images/store";
	              			if (n.preview === null){
	                        	   n.preview = "";
	                        	   src="";
	                               }
	              			var fileDir = n.preview;
	              			var suffix = fileDir.substr(fileDir.lastIndexOf("\\"));

		            	   
		            	if ((SearchText == "") || (n.storeName.search(SearchText) != -1 )) {
		            		var div =
								"<div class='col-6 col-md-3'>"
			            		+ "<div class='recipe-thumb'>"
								+ "<img class='img-responsive' src= " + src + suffix + " />"
								+ "<a href='#' class='bookmarker'><i class='fas fa-bookmark'></i></a>"
								+ "<a href='/product/testtest2?sid="+ n.storeID +"' class='view-recipe'>進入店家</a>"
								+ "</div>"
								+ "<div class='recipe-desc'>"
								+ "<h2 class='recipe-title'>"
								+ "<a href='#'>" + n.storeName + "</a>"
								+ "</h2>"
								+ "<p>"
								+ "<em>" + n.storePhone + "</em>"
								+ "</p>"
								+ "<span><i class='fas fa-clock'></i>&nbsp;" + n.storeID + "</span>"
								+ "</div>"
								+ "</div>"
							$('#divData').append(div);
		            	}
	            	   });      
	            	   
				 
      			
	               }
	           }
	       });
	    }


///////////////////////////////
async function sendmail(){
	const { value: email } = await Swal.fire({
		  title: '請輸入您的信箱',
		  input: 'email',
		  inputLabel: 'Your email address',
		  inputPlaceholder: 'Enter your email address'
		})

		if (email) {
			
		  	   $.ajax({
	           type:'post',
	           url:'/sendmail.controller?email='+email,
		  	 }); 
		  
		  Swal.fire(`訂閱成功!`)
		}
};



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
								<!-- 左上logo圖片////////////////////////////////////////////////////////////////////////// -->
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

								<div class="collapse navbar-collapse" id="navbarSupportedContent" >
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
		<div class="owl-carousel owl-theme">
			<div class="item">
				<img src="/images/content/slide-13.png" alt="slide 1">
				<div class="caption">
					<h2 class="animated bounce">Reasonable Prices and Choices</h2>
					<!-- <button class="btn btn-primary">EXPLORE NOW</button> -->
				</div>
			</div>
			<!-- end item -->
			<div class="item">
				<img src="/images/content/slide-14.png" alt="slide 2">
				<div class="caption">
					<h2 class="animated bounce">Quality Service</h2>
					<!-- <button class="btn btn-primary">READ MORE</button> -->
				</div>
			</div>
			<!-- end item -->
			<div class="item">
				<img src="/images/content/slide-15.png" alt="slide 3">
				<div class="caption">
					<h2 class="animated bounce">Best Dishes in Town</h2>
					<!-- <button class="btn btn-primary">EXPLORE NOW</button> -->
				</div>
			</div>
			<!-- end item -->
		</div>
		<!-- end owl-carousel -->


		<div class="choice-section">
			<div class="container">
				<div class="section-title">
					<!-- 刪除12張圖片組 -->

					<!-- 刪除中間大圖1 -->
	<!--  ////////////////////////////推薦餐廳////////////////////-->				

				<div class="blog-section">


													<div margin:auto><h3 >推薦餐廳</h3></div>
									<div class="ourteam" >
												<div class="container" >
													<div class="team" >
														  <ul id="flexiselDemo3" >
															<li>
																<div class="team1" >
									
																</div>
															</li>
									<!--  					<li>
																<div class="team1" >
																	<img src="images/t2.jpg" class="img-responsive" alt="" />
																	<h4>Tony Stark</h4>
																	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
																</div>
															</li>
									-->	
														 </ul>
													</div>
											</div>
										</div>





					</div>
					<!-- end blog-section -->

					<!-- 刪除社群分享 -->

	<!--  ////////////////////////////推薦餐廳////////////////////-->		
					<!-- 產品圖 /////////////////////////////////////////////////////////////////////-->
					<div class="recipes-section">
						<div class="container">
							<div class="section-title">
								<h3>餐廳列表</h3>
							</div>
							 <div class="item">
							  <h3>
							    <input type="search" style="outline: none;" id = "mySearch" placeholder="搜尋想訂購餐點的餐廳" size="50">
							    <button type="submit" style="outline: none;" onclick="StoreAll()">搜尋</button>
							  </h3>
							  </div>
							<!-- end section-title -->
							<div id="divData" class="row">
							<!-- end row -->
							<div class="row">
								<div class="centered">
									<a href="#" class="btn btn-line">VIEW ALL RECIPES</a>
								</div>
								<!-- end centered -->
							</div>
							<!-- end row -->

						</div>
						<!-- end container -->
					</div>
					<!-- end recipes -->

					<!-- 刪除作者群介紹 -->

					<!-- 刪除中間大圖2 -->

					<!-- 文章分享(可改為餐廳簡介) /////////////////////////////////////////////////////////////////////-->				


				</div>
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
											&copy; copyright 2022 by iii-Java-123-group1
											<i class="fas fa-heart"></i>
										</p>
									</div>
									<!-- end copy -->
								</div>
								<!-- end col -->
								<div class="col-md-6">
									<ul class="bottom-nav">
										<li><a href="http://www.bootstrapmb.com/">Home</a></li>
										<li><a href="#">Contact Us</a></li>
										<li><a href="/privates">隱私權政策</a></li>
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
	<script src="/js/shoppingcart.js"></script>
	
	<script src="/js/jss/jquery.flexisel.js"></script>
	<script src="/js/jss/modernizr.custom.js"></script>
	<script src="/js/jss/classie.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>	
</body>
</html>