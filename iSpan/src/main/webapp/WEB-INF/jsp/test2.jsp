<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
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
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING:Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">


	$(document).ready(function(){
		var sid = $('#sid').val();
		StoreAll();
		loadPage(sid);
		console.log(sid)
		login()
	});

    function StoreAll(){
	       $.ajax({
	           type:'post',
	           url:'/product/StoreAll.controler',
	           dataType:'JSON',
	           contentType:'application/json',
	           success: function(data){
	               
	               console.log(data);
	               $('#showproduct').empty("");

//              	var h3 = data[0];
	               
	             	if(data==null){
	            	  	 	$('#showproduct').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
	               	}else{
	               		$.each(data, function(i,n){
		               		
		               		if(parseInt(n.storeID) == sid.value){
			              		var h3 = 
									"<h3>"+ n.storeName +"</h3>"
									+"<h3>營業時間</h3>"
									+"<h3>"+ n.storeBusinessHours +"</h3>";
			          			$('#showproduct').append(h3);
				            }
		               	
	               		});
	            	}
	       		}
	     });
	}
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

function loadPage(sid){
	
    $.ajax({
        type:'post',
        url:'/product/testtest3?sid='+sid,
            //queryByPage/' + indexPage,
        dataType:'JSON',
        contentType:'application/json',
        success: function(data){
            
            console.log(data);
            //顯示之前把Table標籤資料清空
            //清空這段<table id="showorder" border="1"></table>
			$('#showorder').empty("");

            
            if(data==null){
         	 
            }else{
         	 
         	 
	
         	   //data:jsonArray n:jsonObject
         	   $.each(data, function(i,n){

      
					//如果 餐點沒有圖片  不顯示 圖片的圖示
					var src ="/images/product";
          			if (n.preview === null){
                    	   n.preview = "";
                    	   src=""
                           }


         			var fileDir = n.preview;
          			var suffix = fileDir.substr(fileDir.lastIndexOf("\\"));

         		   
					var dr =
										"<div class='col-6 col-md-3'>"+
										"<div class='recipe-thumb'>"+
											"<img width='50%' height='50%' src="+ src + suffix + " alt='Recipe Image'>"+
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
<div class="cartModal">
        <%@ include file="shoppingcart.jsp" %>
        </div>
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
					<h2 class="animated bounce">Our 10 Most Popular Recipes</h2>
					<!-- <button class="btn btn-primary">EXPLORE NOW</button> -->
				</div>
			</div>
			<!-- end item -->
			<div class="item">
				<img src="/images/content/slide-14.png" alt="slide 2">
				<div class="caption">
					<h2 class="animated bounce">Best Review Recipe 2019</h2>
					<!-- <button class="btn btn-primary">READ MORE</button> -->
				</div>
			</div>
			<!-- end item -->
			<div class="item">
				<img src="/images/content/slide-15.png" alt="slide 3">
				<div class="caption">
					<h2 class="animated bounce">Most Popular Homemade Recipes</h2>
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

					<!-- 產品圖 /////////////////////////////////////////////////////////////////////-->
					<div class="recipes-section">
						<div class="container">
							<div class="section-title">
								<h3 id="showproduct">
								
								</h3>
							</div>
							<input id="sid" type="hidden" value="${sid}">
							<!-- end section-title -->
							<div class="row" id="test2">
							
							
								
															

							</div>
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

					<!-- end blog-section -->

					<!-- 刪除社群分享 -->


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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>	
</body>
</html>