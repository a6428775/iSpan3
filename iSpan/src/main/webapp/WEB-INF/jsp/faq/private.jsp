<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>隱私權政策</title>
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
									<!-- header 標題列///////////////////////////////////////////////////////////////////// -->
									<ul class="navbar-nav">
										<li class="nav-item active"><a class="nav-link"
											href="/login/welcome">Home <span class="sr-only">(current)</span></a>
										</li>
										<li class="nav-item"><a class="nav-link" href="/aboutus">關於我們</a>
										</li>
										<li class="nav-item"><a class="nav-link"
											href="/event">最新消息</a></li>
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
													class="dropdown-item" href="/faq">FAQ</a>
											</div></li>

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
										<li class="nav-item"><a class="nav-link"
											href="/verifyIdentity.controller">會員中心</a></li>
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

		<!-- 刪除搜尋列 -->

		<!-- 幻燈片 輪播圖 SLIDER SECTION /////////////////////////////////////////////////////////////////////-->

		<!-- end owl-carousel -->


		<div class="choice-section">
			<div class="container">
				<div class="section-title">
					<!-- 刪除12張圖片組 -->

					<!-- 刪除中間大圖1 -->

					<!-- 產品圖 /////////////////////////////////////////////////////////////////////-->
					<h1 class="t1">美好食程隱私權政策</h1>
					<h5>
						<strong style="color: red;">美好食程</strong>（以下簡稱本公司）為提供您完善與多元的會員服務，謹依個人資料保護法（以下簡稱個資法）與本「隱私權政策」蒐集、處理及利用您的個人資料，並承諾尊重以及保護您個人於本公司服務平台的隱私權。
					</h5>
					<br />
					<h5>請您詳細閱讀本公司「隱私權政策」，透過「隱私權政策」，您將瞭解到本公司如何蒐集、處理、利用以及保護您所提供的資訊。如您不同意下列條款內容，您可以立即向本公司要求停止處理及利用您的個人資料（聯絡我們）。本公司有權修訂本「隱私權政策」，修訂後將於官方網站上公告或以言詞、書面、電話、電子郵件、傳真、電子文件或其他足以使您知悉或可得知悉之方式告知您修訂內容。</h5>
					<br />
					<h5>
						<strong>一、隱私權政策適用範圍</strong>
					</h5>
					<br />
					<h5>1. 本「隱私權政策」適用本公司所有服務平台與網域。</h5>
					<h5>2.
						本公司可能會在本公司服務平台提供其他廠商服務平台的連結供您參考，當您瀏覽這些平台時，您將會離開本公司服務平台，您所提供給這些廠商的個人資料將適用各該廠商的隱私權政策，而非適用本「隱私權政策」，本公司無法負擔任何連帶責任。</h5>
					<h5>3.
						本公司與同業餐廳合作，提供多樣化的外送點餐店家以供會員選擇，訂購後會在您結帳時將您的姓名、電話、E-mail、地址。</h5>
					<h5>依據個資法第8條第1項規定，告知事項如下：</h5>
					<br />
					<h5>
						<strong>A. 個人資料蒐集之目的</strong>
					</h5>
					<h5>本公司為行銷、消費者保護、消費者/客戶管理與服務、網路購物及其他電子商務服務、帳務管理、契約/類似契約關係或其他法律關係事務、調查/統計與研究分析、資訊與資料庫管理、非公務機關依法定義務所進行個人資料之蒐集處理及利用等目的，蒐集並於前述目的範圍內處理及利用您的個人資料。</h5>
					<br />
					<h5>
						<strong>B. 個人資料的類別</strong>
					</h5>
					<h5>I.
						加入會員：當您註冊成為本公司會員時，將請您提供個人資料，包括但不限於真實姓名、電話、住址、電子信箱、性別、出生日期等資料。詳細個人基本資料項目請您參閱會員註冊頁面欄位。</h5>
					<h5>II.
						參與線上活動：當您參與本公司舉辦的線上活動時，將請您提供可供聯絡與核對真實身分之必要個人資料。如您不願提供前述必要個人資料，您將無法參與線上活動。</h5>
					<h5>III. 因其他活動而有蒐集您的個人資料時，其個人資料項目請您參閱該活動相關欄位。</h5>
					<br />
					<h5>
						<strong>C. 個人資料利用期間、地區、對象及方式</strong>
					</h5>
					<h5>I. 期間：個人資料蒐集之特定目的存續期間、依相關法令或契約約定之保存年限或本公司因執行業務所必需之保存期間。</h5>
					<h5>II.
						地區：中華民國境內。若涉及中華民國境外之國際傳輸，本公司將會在充份確保您的個人資料安全及符合法律規定情形下，才會進行。</h5>
					<h5>III.
						對象：本公司、本公司之分公司與關係企業、未受主管機關限制之國際傳輸個人資料之接收者、業務委外機構、具有合作關係之第三人。前述業務委外機構或具有合作關係之第三人名單，您得隨時向本公司進行查詢(聯絡我們)，我們也會要求前述機構或第三人遵守個人資料保護法的規定。</h5>
					<h5>IV. 方式：以自動化機器或其他非自動化之利用方式。</h5>
					<br />
					<h5>
						<strong>D. 所得行使之相關權利 </strong>
					</h5>
					<h5>依據個資法第3條規定，您就本公司所保有之己身個人資料得行使下列權利：</h5>
					<h5>I. 得向本公司查詢、請求閱覽或請求製給複製本，而本公司依法得酌收必要成本費用；</h5>
					<h5>II. 得向本公司請求補充或更正，惟依法您應為適當之釋明；</h5>
					<h5>III. 得向本公司請求刪除、停止蒐集、處理或利用；</h5>
					<h5>IV. 在符合法律規定情形下，本公司得不依您請求為之。</h5>
					<br />
					<h5>
						<strong>E. 不提供個人資料所致權益之影響 </strong>
					</h5>
					<h5>您得自由選擇是否提供您的個人資料，惟若您選擇拒絕提供者，您將無法註冊成為本公司會員、或無法獲得相關優惠、活動或行銷訊息等。</h5>
					<br />
					<h5>
						<strong>二、Cookie、網站信標(Web beacon)的使用方式 </strong>
					</h5>
					<br />
					<h5>1.
						Cookie是由網站伺服器透過使用者在瀏覽網站時寫入使用者電腦硬碟的小型資料檔，用來確認使用者的身分以及存取與使用者相關的帳戶資料。</h5>
					<h5>2.
						當您瀏覽本公司網站，本公司會使用Cookie蒐集您瀏覽網站的資料，以提供您更方便、個人化服務，並且透過這些資料分析使用者瀏覽本公司網站的狀況，以作為本公司提供更優質服務的參考。</h5>
					<h5>3.
						您也能透過您電腦的瀏覽器設定修改您對Cookies的接受程度，若您選擇拒絕所有Cookies，您就可能無法使用部份個人化服務，或參與部分活動。</h5>
					<br />
					<h5>
						<strong>三、網站信標(Web beacon)的使用</strong>
					</h5>
					<br />
					<h5>1. 網路信標(Web Beacon)是一種電子影像檔，如單一像素(1x1)或GIF檔，網路信標 (Web
						Beacon)可以辨識使用者電腦上某些資訊類型，以計算網站或網頁使用人次，或辨識您在網站的互動情況。</h5>
					<h5>2. 本公司在相關網頁以及發送給您的HTML電子報或活動訊息eDM，會使用網路信標(Web
						Beacon)以及其他工具蒐集您在本公司網站的使用狀況與電子報互動情形。</h5>
					<h5>3.
						您也可以不要下載電子郵件中所附的電子影像，但由於電子郵件軟體功能各有差異，這樣做不見得一定能使電子郵件中的網路信標(Web
						Beacon)或是其他自動資訊收集工具無法作用。</h5>
					<br />
					<h5>
						<strong>四、電子郵件與商業訊息</strong>
					</h5>
					<br />
					<h5>本公司將在您加入會員、參加活動、訂閱電子報時，取得您的同意後，傳送相關電子郵件或商業性資料給您。在該電子郵件或商業資料上將清楚註明是由本公司發送，同時也會提供您可以停止接收這些電子郵件或商業資料的說明與方法。</h5>
					<br />
					<h5>
						<strong>五、資訊安全</strong>
					</h5>
					<br />
					<h5>本公司會採取適當的安全措施，來防止未經授權的資料存取、竄改、披露或損毀，其中包括就資料的蒐集、儲存、處理慣例和安全措施進行內部審查，以及實體的安全措施，以防止本公司儲存個人資料的系統遭到未經授權的存取。但網際網路資料的傳輸不能保證百分之百的安全，儘管本公司努力保護您的個人資料安全，然因資料傳輸過程牽涉您上網環境保全之良窳，本公司無法確信或保證您傳送或接收本公司服務平台資料的安全，您仍須注意並承擔資料傳輸之風險。</h5>
					<br />
					<h5>
						<strong>六、自我保護措施</strong>
					</h5>
					<br />
					<h5>請您妥善保管密碼及任何個人資料，不要將任何個人資料，尤其是密碼提供給任何人。</h5>
					<br />
					<h5>
						<strong>七、對於本隱私權政策建議與看法</strong>
					</h5>
					<br />
					<h5>若您對於本隱私權政策有任何疑問，歡迎您來信詢問。</h5>
					<br />
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