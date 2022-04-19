<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="/css/ordersystem.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">


	
	$(document).ready(function(){
		var indexPage = 1;
		 loadPage(indexPage);

      
	      
		 	 $("#mySearch").change(function(){
			 	 loadPage(indexPage);
				});	
		 	 $("#mySearch3").change(function(){
			 	 
			 	 loadPage(indexPage);
				});	  

				
	});


	//預設 資料總筆數
		let Totalpage = 15;
	//預設 一頁顯示幾筆資料	
		let SearchText2 = 3 ;		
	
    function loadPage(indexPage){
    
    	var  SearchText = document.getElementById("mySearch").value;
    	     SearchText2 = document.getElementById("mySearch3").value;
    	
    	if (SearchText == ""){
    		SearchText ='全部'
        	}
    
			 console.log(SearchText);
			 $.ajax({
		           type:'post',
		            url:'/product/queryByPage3/'+indexPage+'/'+SearchText+'/'+SearchText2,

		            success: 

			            function(data){
		            	$('#totalcount').empty("");
			            Totalpage = data;
			            console.log("page:"+Totalpage)
			            console.log("page2:"+SearchText2)
			            $('#mySearch3').after("<a id='totalcount'><span>　　總共:　" + Totalpage + "　筆資料</span></a>");
			            showpage(Totalpage,SearchText2)
		            }
			 })
			 
			 
        $.ajax({
            type:'post',
            url:'/product/queryByPage/'+indexPage+'/'+SearchText+'/'+SearchText2,
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
             	   table.append("<tr id='ptitle' height='50'> <th>餐點編號</th> <th>餐點名稱</th> <th>餐點種類</th> <th>餐點單價</th> <th>餐點圖片</th> <th> </th> <th> </th> </tr>");
  
             	   //data:jsonArray n:jsonObject
             	   $.each(data, function(i,n){

          
						//如果 餐點沒有圖片  不顯示 圖片的圖示
						var src ="/images/product";
              			if (n.preview === null){
                        	   n.preview = "";
                        	   src="";
                               }
              			var fileDir = n.preview;
              			var suffix = fileDir.substr(fileDir.lastIndexOf("\\"));

     //         			if ((SearchText == "") || (n.productname.search(SearchText) != -1 ) || (n.productcategory.search(SearchText) != -1 ) || (n.productunitprice.search(SearchText) != -1 ) || (SearchText.search(n.productid) != -1 ) ) {
             		   var tr = 
                 		   		"<tr>" + 
             		   			"<td>" + n.productid + "</td>" +
             		            "<td>" + n.productname + "</td>" + 
             		            "<td>" + n.productcategory + "</td>" +
             		            "<td text-align:center>" + n.productunitprice + "</td>" + 
             		//           <img  src='${pageContext.request.contextPath }/images/" + n.storeID + ".jpg'  />
             		            "<td width='10%'>" + "<img id='img-preview' width='80' height='80' src="+ src + suffix + ">" + "</td>" + 
             		 //           "<td>" + src + suffix + "</td>" + 
        //     		         	"<td width='10%'><a class='btn btn-success' href='/product/updateproduct.controller?pid="+ n.productid +"'>修改餐點</a></td>"+
             		         	"<td width='10%'><button type='button' class='btn btn-success' onclick='load("+ n.productid +")' data-bs-toggle='modal' data-bs-target='#exampleModal'><a>修改餐點</a></button></td>"+
             		         	"<td width='10%'><button type='button' class='btn btn-danger' onclick='delete2("+ n.productid +")' ><a>刪除餐點</a></button></td>"+
             		      //   	"<td width='10%'><a class='btn btn-danger' href='/product/deleteProduct.controller?pid="+ n.productid +"'>刪除餐點</a></td>"+
             		            "</tr>";

             		   table.append(tr);
       //       			}
             	
                    });      
             	  
             	  
              		
                }
            }
        
        });
         //    	  showpage(Totalpage)
             	  console.log(Totalpage);
     }
    
    function showpage(Totalpage,SearchText2){
    	var page ="";
   
    	$('#page123').empty("");


    	 
		var data = Array(Math.ceil(Totalpage/SearchText2));
		var page2 = `  <li class='page-item'>
		      <a class='btn page-link' onclick='change2()' aria-label='Previous'>
	        <span aria-hidden='true'>&laquo;</span>
	      </a>
	    </li>`
	    var page3 = `    <li class='page-item'>
	        <a class='btn page-link' onclick='change3()'  aria-label='Next'>
	        <span aria-hidden='true'>&raquo;</span>
	      </a>
	    </li>`
		 $('#page123').append(page2);
    	
    	$.each(data, function(i,n){
			i=i+1
			var allpage = " <li class='page-item'  id='myPage2' value='"+i+"'><a class='btn page-link' onclick='change("+i+")' >"+i+"</a></li>"
	       $('#page123').append(allpage);   
    	});

    	$('#page123').append(page3);
        }
    
    function change(page){
     	indexPage = page;
     	loadPage(indexPage);

     } 
    function change2(){

        if(indexPage>1){
    	indexPage=indexPage-1;
        }
    	
     	loadPage(indexPage);
     }
    function change3(){

		if(indexPage+1<Math.ceil(Totalpage/SearchText2)+1){
        
    	indexPage=indexPage+1;

			}
    	
     	loadPage(indexPage);
     }  


</script>
<style>
img[src=""]{
opacity: 0;
}
</style>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>後台管理</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- 導航欄品牌-->
            <a class="navbar-brand ps-3">商家後台管理</a>
            <!-- 側邊欄切換-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- 導航欄搜索-->
<!--             <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0"> -->
<!--                 <div class="input-group"> -->
<!--                     <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" /> -->
<!--                     <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button> -->
<!--                 </div> -->
<!--             </form> -->
            <!-- 右上角導航欄-->
            <ul class="navbar-nav ms-auto me-0 me-md-3 my-2 my-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
<!--                         <li><a class="dropdown-item" href="#!">設定</a></li> -->
<!--                         <li><a class="dropdown-item" href="#!">廠商資料</a></li> -->
<!--                         <li><hr class="dropdown-divider" /></li> -->
                        <li><a class="dropdown-item" href="/logout">登出</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="/login/welcome">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                美好食程
                            </a>
                            <a class="nav-link" href="/verifyIdentity.controller">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                後台主頁
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                商家資訊
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">

                                    <a class="nav-link" href='/Store/updateStore.controller'> 商家資料修改</a>
                                    <a class="nav-link" href="/Store/Store.controller">訂單</a>
                                </nav>
                            </div>
                            
                        	<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts2" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                商家餐點
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>                               
                            <div class="collapse" id="collapseLayouts2" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">

                                    <a class="nav-link" href='/product/storeCreateProduct.controller?'> 新增餐點</a>
                                    <a class="nav-link" href="/product/mainacction.controller">餐點列表</a>
                                </nav>
                            </div>                                
                            
<!--                             <div class="sb-sidenav-menu-heading">Addons</div> -->
<!--                             <a class="nav-link" href="charts.html"> -->
<!--                                 <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div> -->
<!--                                 Charts -->
<!--                             </a> -->
<!--                             <a class="nav-link" href="tables.html"> -->
<!--                                 <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div> -->
<!--                                 歷史訂單 -->
<!--                             </a> -->
                        </div>
                    </div>


                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h2 class="mt-4">店家商品資訊</h2>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">產品資訊</li>
                        </ol>
                

							   
 <div class="container">
                            <div class="card-header">
                            
                            
                            
<!-- 搜索框 -->	
				<div style="display: inline-block;"><i class="fas fa-table me-1" style="display: inline-block;"></i><a style="font-size:30px">餐點</a>
                <div class="input-group justify-content-end" >
                    <input  id = "mySearch" type="search" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" size="20"  />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="submit" onclick="loadPage()"><i class="fas fa-search" ></i></button>
                </div>
                </div>
						<div style="display: inline-block;">
               			 <a>每頁顯示筆數：</a>
                		<select id = "mySearch3" name="mySearch3">
						    <option value="3">3</option>
						    <option value="5">5</option>
						    <option value="10">10</option>
						    <option value="20">20</option>
						    <option value="50">50</option>
						    <option value="100">100</option>

						</select>
						</div>
						
                            </div>
                        <div class="col-md-12 col-md-offset-3" style="text-align:center;line-height:80px;font-size: 20px">
                        
							<table  class="dataTable-table">
								<tbody id="showorder">
								
								
								</tbody>
						
							</table>
			<!-- 換頁功能 -->
<nav aria-label='Page navigation example' id = 'changepage'>
  <ul class='pagination justify-content-end' id='page123'>
    <li class='page-item'>
      <a class='btn page-link' onclick='change2()' aria-label='Previous'>
        <span aria-hidden='true'>&laquo;</span>
      </a>
    </li>
	<li></li>
    <li class='page-item'>
      <a class='btn page-link' onclick='change3()'  aria-label='Next'>
        <span aria-hidden='true'>&raquo;</span>
      </a>
    </li>
  </ul>
</nav>	
							
							
						
						</div>
	</div>					
							<div id ="creat"></div>
<!--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->



<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">餐點修改</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       						                        <form id="contactForm"  method="post" enctype="multipart/form-data" action="/product/insertProduct2.controller">
					                            <!-- Name input-->
					                            <div class="form-floating mb-3 "style="display:none">
					                                <input class="form-control" id="ProductID" name="ProductID" type="text" placeholder="Enter your productname..." data-sb-validations="required" />
					                                <label for="ProductID" >餐點ID</label>
					                                <div class="invalid-feedback" data-sb-feedback="ProductID:required">餐點名稱還未輸入</div>
					                            </div>
					                            <!-- Name input-->
					                            <div class="form-floating mb-3">
					                                <input class="form-control" id="ProductName" name="ProductName" type="text" placeholder="Enter your productname..." data-sb-validations="required" />
					                                <label for="ProductName" >餐點名稱</label>
					                                <div class="invalid-feedback" data-sb-feedback="ProductName:required">餐點名稱還未輸入</div>
					                            </div>
					                            <!-- Email address input-->
					                            <div class="form-floating mb-3">
					                                <input class="form-control" id="ProductCategory" name="ProductCategory" type="text" placeholder="Enter your ProductCategory..." data-sb-validations="required" />
					                                <label for="ProductCategory">餐點類別</label>
					                                <div class="invalid-feedback" data-sb-feedback="ProductCategory:required">餐點類別還未輸入</div>
					                            </div>
					                            <!-- Phone number input-->
					                            <div class="form-floating mb-3">
					                                <input class="form-control" id="ProductUnitPrice" name="ProductUnitPrice" type="text" placeholder="Enter your ProductUnitPrice..." data-sb-validations="required" />
					                                <label for="ProductUnitPrice">餐點單價</label>
					                                <div class="invalid-feedback" data-sb-feedback="ProductUnitPrice:required">餐點單價還未輸入</div>
					                            </div>
					
												<!--  圖片上傳部分 -->
							                    <div class="mb-3">
							                        <div class="row">
							                            <div class="col-sm-7">
							                                <label for="uploadFile" class="form-label">上傳照片</label>
							                                <input class="form-control" type="file" name="uploadFile" id="uploadFile" accept="image/*" />
							                            </div>
							                            <div class="col-sm-5">
							                                <div class="form-control text-center" style="height:100px;">
							                                    <img src="" id="img-preview2" class="h-100"/>
							                                </div>
							                            </div>
							                        </div>
							                    </div>
					
					                            <!-- Submit Button-->
					                            <button class="btn btn-primary " id="submitButton" type="button" onclick='sendProductUpdate()'>送出修改</button>
       											 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					                        </form>
      </div>
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-primary">Save changes</button> -->
<!--       </div> -->
    </div>
  </div>
</div>	  
<script>

function load(pid){

	
	   $.ajax({
  type:'post',
  //透過id 查詢產品
  url:'/product/productquerybyid.controller?pid='+ pid,
  dataType:'JSON',
  contentType:'application/json',
  success: function(data){
      
      var json = JSON.stringify(data, null, 4);
      console.log('success:' + json);
      var jsonArray = JSON.parse(json);
       
      if(json==null){
          $('table').prepend('<tr><td colspan="2">No Result</td></tr>');
      }else{
          
     	 $('#ProductID').attr({"value":jsonArray.productid});
     	 $('#ProductName').attr({"value":jsonArray.productname});
     	 $('#ProductCategory').attr({"value":jsonArray.productcategory});
     	 $('#ProductUnitPrice').attr({"value":jsonArray.productunitprice});
      }
  }
	   });
}


function sendProductUpdate(){
	  var pid = $("#ProductID").val();
	  var name = $("#ProductName").val();
	  var category = $("#ProductCategory").val();
	  var price = $("#ProductUnitPrice").val();


	  var contactForm=document.getElementById('contactForm');

// var amount = parseInt(orderQuantity)*parseInt(price);

 if($.trim(name)==''){
	   alert('請輸入產品名稱');
	   return;
 }

 if($.trim(price)==''){
	   alert('請輸入產品價格');
	   return;
  }


 var params = {
 	     "productid":pid,
         "productname":name,
         "productcategory":category,
         "productunitprice":price,
 }
 
 console.log("SUCCESS : ", JSON.stringify(params));
 $.ajax({
	   type:'post',
	   url:'/product/updateProduct.controller',
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
 Swal.fire(
	      '餐點修改成功',
	      '',
	      'success'
	    ).then(function (isOkay) {
	          if (isOkay) {

 contactForm.submit();
	}
	});
 

}
///////////////////////////////////////////////////////////////
$(function () {            
 //當選檔變更時，立即預覽之前被選擇的照片
 $("#uploadFile").change(function () { 
     previewImg(this.files);
     console.log(123);
 });
});
function previewImg(files) {
 if (files.length == 0)
     return;
 var file = files[0];
 var fr = new FileReader();
 //註冊當選檔被讀取完成後之事件處理器
 fr.readAsDataURL(file);
 fr.onload =
     function () {
         $("#img-preview2").attr({ src: fr.result});
         /*  fr.result: The file's contents. 內容如下:
             data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA ...
         */
     };
}
$(function () {
 //當使用者上傳一個檔案後將進入Web Server回應的新頁面。
 //又當使用者「返回前頁」時，需要「重新預覽」前回點選擬上傳的圖片。
 previewImg($("#uploadFile")[0].files);
});
function delete2(pid){
	Swal.fire({
		  title: '確定刪除此餐點嗎?',
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '刪除',
		  cancelButtonText:'關閉'
		}).then((result) => {
		  if (result.isConfirmed) {
		    Swal.fire(
		      '刪除餐點成功',
		      '',
		      'success'
		    )
		    .then(function (isOkay) {
		          if (isOkay) {
		      window.location.href="/product/deleteProduct.controller?pid="+ pid;	
		            }
		        });
		  }
		})
}

function test2(){
	console.log(123)
}
</script>
<!--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->

			
		

                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/js/datatables-simple-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>	
    </body>
</html>