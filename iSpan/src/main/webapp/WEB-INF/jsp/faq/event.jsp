<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>最新消息</title>
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
								<a href="/login/welcome"><img src="/images/logo-2.png" alt="美好食程"
									title="美好食程"></a>
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
		<div class="head-title">
			<div class="container">
				<h2 class="page-title">最新消息</h2>
			</div>
			<!-- end container -->
		</div>
		<!-- end head-title -->

		<div id="main">
			<div class="container">
				<div class="row">

					<div id="primary" class="content-area col-md-8">
						<div id="content" class="site-content">



							<!-- event-bar -->

							<div class="event-post">
								<div class="event-date">
									<a
										href="https://news.yahoo.co.jp/articles/2696e46b56db6a56f0d7b0f96ab7b8a9d687be62"
										target="_blank"> <time class="published"
											datetime="2022-04-11" title="04, 11, 2022 - 00:00 am">
											Apr<span class="date">11</span>2022
										</time>
									</a>
								</div>
								<!-- event-date -->
								<figure class="event-img">
									<a
										href="https://news.yahoo.co.jp/articles/2696e46b56db6a56f0d7b0f96ab7b8a9d687be62"
										target="_blank"><img src="images/content/breakfast-1.jpg"
										alt="早餐圖片" title="免費素材圖片"></a>
								</figure>
								<h2 class="event-title">
									<a
										href="https://news.yahoo.co.jp/articles/2696e46b56db6a56f0d7b0f96ab7b8a9d687be62"
										target="_blank">4月11日は「しっかりいい朝食」の日。すぐおいしい“時短朝食”におすすめの5品</a><br />
									<br />
								</h2>
								<div class="row">
									<div class="col">
										<p>Yahoo!新聞</p>
										<p>April 11 &mdash; now</p>
									</div>
									<div class="col">
										<a
											href="https://news.yahoo.co.jp/articles/2696e46b56db6a56f0d7b0f96ab7b8a9d687be62"
											target="_blank" class="btn btn-primary float-right"><i
											class="fas fa-newspaper">&nbsp;</i>查看新聞</a>
									</div>
								</div>
								<!-- end row -->
							</div>
							<!-- event-post -->

							<div class="event-post">
								<div class="event-date">
									<a
										href="https://www.foodnext.net/life/recipes/dinner/paper/5470686181S"
										target="_blank"> <time class="published"
											datetime="2022-03-23" title="03, 23, 2022 - 21:12 pm">
											Feb<span class="date">23</span>2022
										</time>
									</a>
								</div>
								<!-- event-date -->
								<figure class="event-img">
									<a
										href="https://www.foodnext.net/life/recipes/dinner/paper/5470686181"
										target="_blank"><img src="images/content/pizza-1.jpg"
										alt="披薩" title="免費素材圖片"></a>
								</figure>
								<h2 class="event-title">
									<a
										href="https://www.foodnext.net/life/recipes/dinner/paper/5470686181"
										target="_blank">名廚簡天才推出第4個餐飲品牌！主打經典義式豹紋披薩 LA ONE
										Pizza於高雄新開幕</a>
								</h2>
								<div class="row">
									<div class="col">
										<p>食力新聞</p>
										<p>2022/03/25 開幕</p>
									</div>
									<div class="col">
										<a
											href="https://www.foodnext.net/life/recipes/dinner/paper/5470686181"
											target="_blank" class="btn btn-primary float-right"><i
											class="fas fa-newspaper">&nbsp;</i>查看新聞</a>
									</div>
								</div>
								<!-- end row -->
							</div>
							<!-- event-post -->

							<div class="event-post">
								<div class="event-date">
									<a
										href="https://dallas.eater.com/2022/4/8/23016455/carbone-vino-dallas-design-district-major-food-group"
										target="_blank"> <time class="published"
											datetime="2022-04-10" title="04, 10, 2022 - 16:30 pm">
											Apr<span class="date">10</span>2022
										</time>
									</a>
								</div>
								<!-- event-date -->
								<figure class="event-img">
									<a
										href="https://dallas.eater.com/2022/4/8/23016455/carbone-vino-dallas-design-district-major-food-group"
										target="_blank"><img src="images/content/steak-1.jpg"
										alt="牛排" title="免費素材圖片"></a>
								</figure>
								<h2 class="event-title">
									<a
										href="https://dallas.eater.com/2022/4/8/23016455/carbone-vino-dallas-design-district-major-food-group"
										target="_blank">Major Food Group Opens a Third Restaurant,
										Carbone Vino, in the Dallas Design District</a>
								</h2>
								<div class="row">
									<div class="col">
										<p>EATER NEWS</p>
										<p>NEW OPEN</p>
									</div>
									<div class="col">
										<a
											href="https://dallas.eater.com/2022/4/8/23016455/carbone-vino-dallas-design-district-major-food-group"
											target="_blank" class="btn btn-primary float-right"><i
											class="fas fa-newspaper">&nbsp;</i>查看新聞</a>
									</div>
								</div>
								<!-- end row -->
							</div>
							<!-- event-post -->

							<div class="event-post">
								<div class="event-date">
									<a
										href="http://www.kfoodtimes.com/news/articleView.html?idxno=19899"
										target="_blank"> <time class="published"
											datetime="2022-04-11" title="04, 11, 2022 - 21:40 pm">
											Apr<span class="date">11</span>2022
										</time>
									</a>
								</div>
								<!-- event-date -->
								<figure class="event-img">
									<a
										href="http://www.kfoodtimes.com/news/articleView.html?idxno=19899"
										target="_blank"> <img src="images/content/salad-1.jpg"
										alt="沙拉" title="免費素材圖片">
									</a>
								</figure>
								<h2 class="event-title">
									<a
										href="http://www.kfoodtimes.com/news/articleView.html?idxno=19899"
										target="_blank">파란만장한 샐러드의 역사</a>
								</h2>
								<div class="row">
									<div class="col">
										<p>Koreal Foodservice News</p>
										<p>沙拉歷史新聞</p>
									</div>
									<div class="col">
										<a
											href="http://www.kfoodtimes.com/news/articleView.html?idxno=19899"
											target="_blank" class="btn btn-primary float-right"><i
											class="fas fa-newspaper">&nbsp;</i>查看新聞</a>
									</div>
								</div>
								<!-- end row -->
							</div>
							<!-- event-post -->

							<div class="event-post">
								<div class="event-date">
									<a href="https://times.hinet.net/news/23832461" target="_blank">
										<time class="published" datetime="2022-03-29"
											title="03, 29, 2022 - 15:45 pm">
											Feb<span class="date">29</span>2022
										</time>
									</a>
								</div>
								<!-- event-date -->
								<figure class="event-img">
									<a href="https://times.hinet.net/news/23832461" target="_blank">
										<img src="images/content/bbq-1.jpg" alt="烤肉" title="免費素材圖片">
									</a>
								</figure>
								<h2 class="event-title">
									<a href="https://times.hinet.net/news/23832461" target="_blank">高雄美食|炭火燒肉大進化，人氣橫膈膜、雞佛熱門必吃！</a>
								</h2>
								<div class="row">
									<div class="col">
										<p>HiNet生活誌</p>
										<p>報導時間:03/29</p>
									</div>
									<div class="col">
										<a href="https://times.hinet.net/news/23832461"
											target="_blank" class="btn btn-primary float-right"><i
											class="fas fa-newspaper">&nbsp;</i>查看新聞</a>
									</div>
								</div>
							</div>

							<div class="event-post">
								<div class="event-date">
									<a
										href="https://news.biglobe.ne.jp/economy/0411/prt_220411_9814325969.html"
										target="_blank"> <time class="published"
											datetime="2022-04-09" title="04, 09, 2022 - 16:30 pm">
											Apr<span class="date">09</span>2022
										</time>
									</a>
								</div>
								<!-- event-date -->
								<figure class="event-img">
									<a
										href="https://news.biglobe.ne.jp/economy/0411/prt_220411_9814325969.html"
										target="_blank"><img src="images/content/steak-2.jpg"
										alt="牛排" title="免費素材圖片"></a>
								</figure>
								<h2 class="event-title">
									<a
										href="https://news.biglobe.ne.jp/economy/0411/prt_220411_9814325969.html"
										target="_blank">Major
										大人気のバターステーキ業態『グッドバターグッドステーキ』がUberEatsで50店舗達成！！
										話題のゴーストレストランを始めませんか？</a>
								</h2>
								<div class="row">
									<div class="col">
										<p>BIGLOBEニュース</p>
										<p>虛擬廚房新商機!</p>
									</div>
									<div class="col">
										<a
											href="https://news.biglobe.ne.jp/economy/0411/prt_220411_9814325969.html"
											target="_blank" class="btn btn-primary float-right"><i
											class="fas fa-newspaper">&nbsp;</i>查看新聞</a>
									</div>
								</div>
								<!-- end row -->
							</div>
							<!-- event-post -->

						</div>
						<!-- end content -->
					</div>
					<!-- end primary -->

					<div id="secondary" class="col-md-4">

						<div>
							<div class="widget-title-outer"></div>
							<!-- end searchform -->
						</div>
						<!-- end search widget -->

						<div class="widget post-type-widget">
							<div class="widget-title-outer">
								<h3 class="widget-title">最新消息</h3>
							</div>
							<ul>
								<li><span class="post-category"> <a href="#">美好早餐日</a>
								</span>
									<figure class="post-thumbnail">
										<a
											href="https://news.yahoo.co.jp/articles/2696e46b56db6a56f0d7b0f96ab7b8a9d687be62"
											target="_blank"><img
											src="images/content/thumb-post-01.png" alt="早餐"></a>
									</figure>
									<h2 class="post-title">
										<a
											href="https://news.yahoo.co.jp/articles/2696e46b56db6a56f0d7b0f96ab7b8a9d687be62"
											target="_blank">4月11日は「しっかりいい朝食」の日。すぐおいしい“時短朝食”におすすめの5品</a>
									</h2></li>
								<li><span class="post-category"> <a
										href="https://www.foodnext.net/life/recipes/dinner/paper/5470686181"
										target="_blank">新義式披薩店</a>
								</span>
									<figure class="post-thumbnail">
										<a
											href="https://www.foodnext.net/life/recipes/dinner/paper/5470686181"
											target="_blank"><img
											src="images/content/thumb-post-02.png" alt=""></a>
									</figure>
									<h2 class="post-title">
										<a
											href="https://www.foodnext.net/life/recipes/dinner/paper/5470686181"
											target="_blank">名廚簡天才推出第4個餐飲品牌！主打經典義式豹紋披薩 LA ONE
											Pizza於高雄新開幕</a>
									</h2></li>
								<li><span class="post-category"> <a
										href="https://dallas.eater.com/2022/4/8/23016455/carbone-vino-dallas-design-district-major-food-group"
										target="_blank">第3家分店開幕</a>
								</span>
									<figure class="post-thumbnail">
										<a
											href="https://dallas.eater.com/2022/4/8/23016455/carbone-vino-dallas-design-district-major-food-group"
											target="_blank"><img
											src="images/content/thumb-post-03.png" alt=""></a>
									</figure>
									<h2 class="post-title">
										<a
											href="https://dallas.eater.com/2022/4/8/23016455/carbone-vino-dallas-design-district-major-food-group"
											target="_blank">Major Food Group Opens a Third
											Restaurant, Carbone Vino, in the Dallas Design District</a>
									</h2></li>
								<li><span class="post-category"> <a
										href="https://times.hinet.net/news/23832461" target="_blank">燒肉大進化</a>
								</span>
									<figure class="post-thumbnail">
										<a href="https://times.hinet.net/news/23832461"
											target="_blank"><img src="images/content/bbq-2.jpg"
											alt=""></a>
									</figure>
									<h2 class="post-title">
										<a href="https://times.hinet.net/news/23832461"
											target="_blank">高雄美食|炭火燒肉大進化，人氣橫膈膜、雞佛熱門必吃！</a>
									</h2></li>
								<li><span class="post-category"> <a
										href="https://news.biglobe.ne.jp/economy/0411/prt_220411_9814325969.html"
										target="_blank">虛擬餐廳新商機</a>
								</span>
									<figure class="post-thumbnail">
										<a href="https://times.hinet.net/news/23832461"
											target="_blank"><img src="images/content/steak-3.jpg"
											alt=""></a>
									</figure>
									<h2 class="post-title">
										<a
											href="https://news.biglobe.ne.jp/economy/0411/prt_220411_9814325969.html"
											target="_blank">Major 大人気のバターステーキ業態『グッドバターグッドステーキ』
											話題のゴーストレストランを始めませんか？</a>
									</h2></li>
								<li><span class="post-category"> <a
										href="http://www.kfoodtimes.com/news/articleView.html?idxno=19899"
										target="_blank">沙拉歷史</a>
								</span>
									<figure class="post-thumbnail">
										<a
											href="http://www.kfoodtimes.com/news/articleView.html?idxno=19899"
											target="_blank"><img
											src="images/content/thumb-post-04.png" alt=""></a>
									</figure>
									<h2 class="post-title">
										<a
											href="http://www.kfoodtimes.com/news/articleView.html?idxno=19899"
											target="_blank">파란만장한 샐러드의 역사</a>
									</h2></li>
							</ul>
						</div>
						<!-- end widget -->

						<div class="widget widget_categories">
							<div class="widget-title-outer">
								<h3 class="widget-title">消息列表</h3>
							</div>
							<ul>
								<li><a class="float-left"
									href="https://jp.taiwan.net.tw/m1.aspx?sNo=0003026"
									target="_blank">台灣食文化</a> <span class="float-right"></span></li>
								<li><a class="float-left"
									href="https://jp.taiwan.net.tw/m1.aspx?sNo=0011926"
									target="_blank">台灣平價美食</a> <span class="float-right"></span></li>
								<li><a class="float-left"
									href="https://jp.taiwan.net.tw/m1.aspx?sNo=0003028"
									target="_blank">台灣甜點</a><span class="float-right"></span></li>
								<li><a class="float-left"
									href="https://guide.michelin.com/tw/en/taipei-region/taipei/restaurants"
									target="_blank">台灣米其林</a><span class="float-right"></span></li>
								<li><a class="float-left" href="https://taiwanstay.net.tw/"
									target="_blank">台灣旅宿</a><span class="float-right"></span></li>
								<li><a class="float-left"
									href="https://jp.taiwan.net.tw/m1.aspx?sNo=0003027"
									target="_blank">台灣伴手禮</a><span class="float-right"></span></li>
							</ul>
						</div>
						<!-- end widget -->
						<div class="widget">
							<div class="widget-title-outer">
								<h3 class="widget-title">台灣的標籤</h3>
							</div>
							<div class="tagcloud">
								<a href="https://jp.taiwan.net.tw/m1.aspx?sNo=0003001"
									target="_blank">最新情報</a> <a
									href="https://jp.taiwan.net.tw/m1.aspx?sNo=0000306"
									target="_blank">美食</a><a
									href="https://jp.taiwan.net.tw/m1.aspx?sNo=0000348"
									target="_blank">觀光</a> <a
									href="https://jp.taiwan.net.tw/m1.aspx?sNo=0000304"
									target="_blank">活動</a> <a
									href="https://jp.taiwan.net.tw/m1.aspx?sNo=0000366"
									target="_blank">購物</a> <a href="https://taiwanstay.net.tw/"
									target="_blank">住宿</a><br /> <a
									href="https://jp.taiwan.net.tw/m1.aspx?sNo=0000320"
									target="_blank">旅行指南</a><a
									href="https://jp.taiwan.net.tw/m1.aspx?sNo=0000308"
									target="_blank">旅遊規劃</a>
							</div>
						</div>
						<!-- end widget -->
						<div class="widget">
							<a href="#"><img src="images/content/banner.png" alt="Banner"></a>
						</div>

					</div>
					<!-- end #secondary -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</div>


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