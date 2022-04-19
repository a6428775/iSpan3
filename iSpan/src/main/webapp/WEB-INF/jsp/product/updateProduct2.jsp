<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="/css/ordersystem.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	var pid = $('#pid').val();
	load(pid);

});



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
             
        	 $('#ProductName').attr({"value":jsonArray.productname});
        	 $('#ProductCategory').attr({"value":jsonArray.productcategory});
        	 $('#ProductUnitPrice').attr({"value":jsonArray.productunitprice});
        	 $("#img-preview").attr({"src":jsonArray.preview});
         }
     }
	   });
}


function sendProductUpdate(){
	  var name = $("#ProductName").val();
	  var category = $("#ProductCategory").val();
	  var price = $("#ProductUnitPrice").val();
	  var pid = $('#pid').val();

	  var contactForm=document.getElementById('contactForm');
	  var file = "${fileName}";
//    var amount = parseInt(orderQuantity)*parseInt(price);

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
    contactForm.submit();
}
///////////////////////////////////////////////////////////////
$(function () {            
    //當選檔變更時，立即預覽之前被選擇的照片
    $("#uploadFile").change(function () { 
        previewImg(this.files);
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
            $("#img-preview").attr({ src: fr.result});
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

</script>

    <body class="sb-nav-fixed">

        <div id="layoutSidenav">
  
            <div id="layoutSidenav_content">
                <main>
        

<!--  ///////////////////////////////////////// -->
					        <section class="page-section" id="contact">
					            <div class="container">
					                <!-- Contact Section Heading-->
					                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">餐點資料修改</h2>
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
					                        <form id="contactForm"  method="post" enctype="multipart/form-data" action="/product/insertProduct2.controller">
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
					                            <button class="btn btn-primary " id="submitButton" type="button" onclick='sendProductUpdate()'>送出修改</button>
					                        </form>
					                    </div>
					                </div>
					            </div>
					        </section>							
                        


  				
				<input id="pid" type="hidden" value="${pid}">
<!--  ///////////////////////////////////////// -->
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
    </body>
</html>