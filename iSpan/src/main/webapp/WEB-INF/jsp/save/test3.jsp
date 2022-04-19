<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="/css/fronts/welcome.css" rel="stylesheet" type="text/css"  />
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
		.main-box { 
            margin: 50px auto; 
            width: 600px; 
            height: auto; 
            padding: 50px; 
            box-shadow: 5px 5px 10px #999; 
            border: 1px solid #fff; 
            text-align: center; 
            font-size: 1.3em; 
        } 
		.item h3{
			font-size:36px;
		}
		.wrap{
			width:960px;
			margin:auto;
		}
		.rest{
			padding:40px 0 60px;
		}
		.rest .wrap{
			display:flex;
		}
		.rest .item{
			margin:0 10px;
			text-align:center;
		}
		.rest .item input{
			border-radius:5%;
		}
		.rest .wrap .item{
			width:300px;
			margin:0 10px;
			text-align: center;
		}
		.rest > h2{
			width:960px;
			font-size: 42px;
			margin:auto;
			text-align: center;
			padding:20px 0;
		}

</style>

	<script type="text/javascript">
	    var indexPage = 1;
	
	    $(document).ready(function(){
	    	StoreAll();
	    	StoreAll2();
	    });
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
		            	if ((SearchText == "") || (n.storeName.search(SearchText) != -1 )) {
		            		var div =
								"<div class='col-6 col-md-3'>"
			            		+ "<div class='recipe-thumb'>"
								+ "<img src='${pageContext.request.contextPath }/images/" + n.storeID + ".jpg' alt='Recipe Image'>"
								+ "<a href='#' class='bookmarker'><i class='fas fa-bookmark'></i></a>"
								+ "<a href='#' class='view-recipe'>VIEW RECIPE</a>"
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
	            	   

	            	   //data: jsonArray n:jsonOnject
	            	   $.each(data, function(i,n){

	            		var div =
	            		"<li>"
	           			+"<div class='team1'>"
						+ "<a href='#'><img  src='${pageContext.request.contextPath }/images/" + n.storeID + ".jpg'  class='img-responsive' alt=''/></a>"
						+ "<h4 >" + n.storeName + "</h4>"
						+ "<p>" + n.storePhone + "</p>"
						+ "</div>"
						+ "</li>";


						
						$('#flexiselDemo3').append(div);
	                   });    	   
	               }
	           }
	       });
	    }
	
	    function change(page){
	    	indexPage = page;
	    	loadPage(indexPage);
	    } 


		$(window).on('load', function() {
				
			$("#flexiselDemo3").flexisel({
				visibleItems: 4,
				animationSpeed: 1000,
				autoPlay: true,
				autoPlaySpeed: 3000,    		
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
	    
	</script>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>頁籤</title>
<!-- STYLE CSS -->
<link href="https://fonts.googleapis.com/css?family=Raleway:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Yellowtail" rel="stylesheet">
<link href="/css/fonts/styles2.css" rel="stylesheet">
<link href="/css/fronts/bootstrap.css" rel='stylesheet' type='text/css' media="all" />
<link href="/css/fronts/style2.css" rel='stylesheet' type='text/css' media="all" />
<link href="/css/fronts/component.css" rel="stylesheet" type="text/css"  />

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
								<a href="#"><img src="/images/logo.png"
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
							<h3></h3>	
							<h3></h3>
							<!-- end section-title -->
							<div id="divData" class="row">
							
<!-- 								<div class="col-6 col-md-3"> -->
<!-- 									<div class="recipe-thumb"> -->
<!-- 										<img src="/images/content/thumb-1.png" alt="Recipe Image"> -->
<!-- 										<a href="#" class="bookmarker"><i class="fas fa-bookmark"></i></a> -->
<!-- 										<a href="#" class="view-recipe">VIEW RECIPE</a> -->
<!-- 									</div> -->
<!-- 									<div class="recipe-desc"> -->
<!-- 										<h2 class="recipe-title"> -->
<!-- 											<a href="#">Salad Nicoise</a> -->
<!-- 										</h2> -->
<!-- 										<p> -->
<!-- 											<em>By Lina Sukowati</em> -->
<!-- 										</p> -->
<!-- 										<span><i class="fas fa-clock"></i>&nbsp;9 Minutes</span> -->
<!-- 									</div> -->
<!-- 									end recipe-desc -->
<!-- 								</div> -->
<!-- 								end col -->

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

<div class="ourteam">
			<div class="container" >
				<h3>推薦餐廳</h3>
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


<!-- 	<div class="header">
		<a href="#" class="logo"><img alt="網站名稱" src="https://picsum.photos/100/40?random=1"></a>
		<nav>
			<a href="/welcome" >首頁</a>
			<a href="/aboutus/aboutus.controller">品牌介紹</a>
			<a href="/users/membercentre.controller">會員中心</a>
			<a href="#">活動資訊</a>
			<a href="#">服務資源</a>
			<a href="#">最新消息</a>
		</nav>
	</div >
	<div id="productListTitle" class="col-md-6">ProductQueryAll
	<table id="showproduct" border="1" ></table>
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
	</div>
	<div class="main-box">
		<h2>餐廳</h2>
		<div class="rest">
			<div class="warp">
				<div class="item">
					<input  type="image"  name="submit_Btn"  id="submit_Btn" src="${pageContext.request.contextPath }/images/1.jpg"  onClick="document.form1.submit()" >
					<h3>義朵朵</h3>
					<p>某某店</p>
				</div>
				
				<div class="item">
					<input  type="image"  name="submit_Btn"  id="submit_Btn" src="${pageContext.request.contextPath }/images/1.jpg"  onClick="document.form1.submit()" >
					<h3>義朵朵</h3>
					<p>某某店</p>
				</div>
				
				<div class="item">
					<input  type="image"  name="submit_Btn"  id="submit_Btn" src="${pageContext.request.contextPath }/images/1.jpg"  onClick="document.form1.submit()" >
					<h3>義朵朵</h3>
					<p>某某店</p>
				</div>
			</div>
		</div>
	</div>


 -->

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
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) 
	<script src="/js/fonts/modernizr-3.7.1.min.js"></script>
	<script src="/js/fonts/jquery-3.4.1.min.js"></script>
	
	<!-- Include all compiled plugins(below),or include individual files as needed 
	<script src="/js/fonts/bootstrap.bundle.min.js"></script>
	<script src="/js/fonts/plugin.js"></script>
	<script src="/js/fonts/main.js"></script>-->
	
	<script src="/js/jss/jquery.flexisel.js"></script>
	<script src="/js/jss/modernizr.custom.js"></script>
	<script src="/js/jss/classie.js"></script>
</body>
</html>