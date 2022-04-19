<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="/css/ordersystem.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<style>


</style>
<script type="text/javascript">

///////////////////////////////////////////////////////////////////

	
		let indexPage = 1;
	$(document).ready(function(){
		 loadPage(indexPage);
	 	 $("#mySearch").change(function(){
	 		indexPage = 1;
			 loadPage(indexPage);
			});	
	 	 $("#mySearch3").change(function(){
	 		indexPage = 1;
		 	 loadPage(indexPage);
			});		 

	      
	});
	async function Cancel(){
		const { value: text } = await Swal.fire({
			  input: 'textarea',
			  inputLabel: 'Message',
			  inputPlaceholder: 'Type your message here...',
			  inputAttributes: {
			    'aria-label': 'Type your message here'
			  },
			  showCancelButton: true
			})

			if (text) {
			  alert(text)
			}
	}	

	//預設 資料總筆數
	let Totalpage = 15;
	//預設 一頁顯示幾筆資料	
	let SearchText2 = 3 ;
	
    function loadPage(indexPage){

    	var SearchText = document.getElementById("mySearch").value;
    	SearchText2 = document.getElementById("mySearch3").value;

        $.ajax({
            type:'post',
            url:'/Store/QueryAllByStoreIDByPage2/'+indexPage+'/'+SearchText2+'/'+SearchText,
            success: function(data){
                

            	$('#totalcount2').empty("");
            	Totalpage = data;
            	console.log(Totalpage)
            	console.log(SearchText2)
            	 $('#mySearch4').after("<a id='totalcount2'><span>　　總共:　" + Totalpage + "　筆資料</span></a>");
            	showpage(Totalpage,SearchText2)
                }
        })
   
        $.ajax({
            type:'post',
            url:'/Store/QueryAllByStoreIDByPage/'+indexPage+'/'+SearchText2+'/'+SearchText,
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
             	   table.append("<tr id='ptitle' align='center'> <th>訂單編號</th> <th>會員ID</th> <th>訂購時間</th> <th>完成時間</th> <th>訂單總價</th> <th></th> <th></th> <th>訂單狀態</th>  <th></th> </tr>");

             	   //data:jsonArray n:jsonObject
             	   $.each(data, function(i,n){

           //  		  if ((SearchText == "全部") || (n.orderstatus.search(SearchText) != -1 ) ) {

             			  
                 		  var testtest= "<td width='20%'><button class='btn btn-success' onclick='changeOrderstatus("+n.orderid+")'>接受訂單</button><a>　</a><button class='btn btn-danger' onclick='changeOrderstatus2("+n.orderid+")'>取消訂單</button></td>" 
                 		  
							if(n.orderstatus=="已完成"){
								testtest = "<td width='20%'>訂單已完成</td>";
									};
                 		 	if(n.orderstatus=="已取消"){
								testtest = "<td width='20%'>訂單已取消</td>";
									};
		                 	if(n.orderstatus=="準備中"){
								testtest = "<td width='20%'><button class='btn btn-warning' onclick='changeOrderstatus3("+n.orderid+")'>已完成</button><a>　</a><button class='btn btn-danger' onclick='changeOrderstatus2("+n.orderid+")'>取消訂單</button></td>";
									};									
                 		 	if(n.orderstatus=="未付款"){
								testtest = "<td width='20%'>等待訂單付款完成</td>";
									};

									
                        	   
             		   var tr = 
                 		   		"<tr align='center' >" + 
                 		   		"<td>" + n.orderid + "</td>" +
       //      		            "<td>" + n.storeid + "</td>" + 
             		            "<td>" + n.userid + "</td>" +
             		            "<td>" + n.orderdate + "</td>" + 
             		            "<td>" + n.ordersuccessdate + "</td>" + 
             		            "<td> $" + n.price + "</td>" + 
             		            "<td width='8%'>" + "<input type='button' class='btn btn-outline-primary' data-bs-toggle='collapse' data-bs-target='#collapseLayoutss"+n.orderid+"' aria-expanded='false' aria-controls='collapseLayouts' value='訂單明細' style='font-size:9px;color:black;'></input>" + "</td>" +
             		   //        "<td><a class='collapsed btn btn-success' href='#' data-bs-toggle='collapse' data-bs-target='#collapseLayoutsremark" + n.orderid + "' aria-expanded='false' aria-controls='collapseLayouts'>" + "MORE" + "</a></td>" +
             		            "<td width='8%'>" + "<input type='button' class='btn btn-outline-info' data-bs-toggle='collapse' data-bs-target='#collapseLayoutsremark"+n.orderid+"' aria-expanded='false' aria-controls='collapseLayouts' value='顧客回饋'  style='font-size:9px;color:black;'></input>" + "</td>" + 
             		            "<td width='8%'>" + n.orderstatus + "</td>" +

             		            testtest +
             		         //   "<td>" + "<button onclick=''>接受訂單</button><a>　</a><button>取消訂單</button>" + "</td>" +





             		            
             		            "</tr>"+		          
                		   		"<tr align='center' class='collapse' id='collapseLayoutss"+n.orderid+"' aria-labelledby='headingOne' data-bs-parent='#sidenavAccordion'>" + 
                 		   		"<td colspan='9' id = 'orderid"+ n.orderid +"'></td>" +
								"</tr>" +

								"<tr align='center' class='collapse' id='collapseLayoutsremark"+n.orderid+"' aria-labelledby='headingOne' data-bs-parent='#sidenavAccordion'>" + 
                 		   		"<td colspan='9' id = 'remark"+ n.orderid +"'></td>" +
								"</tr>";

             		            
					   table.append(tr);
             		  
								// 執行 loadorder(n.orderid); 根據ordrerid 查詢
			   					loadorder(n.orderid);

			   					loadorderRemark(n.orderid);
      //       		  }
                    });           	   
                }
            }
        });
        //load 訂單詳細資訊的 function
     }
    

    
//已付款
     function changeOrderstatus(oid2){
 
    	    var params = {
    	    	    "orderstatus":"準備中",
    	    }  
			$.ajax({
				   type:'post',
				   url:'/Store/updateorderstatus.controller?oid2='+oid2,
				   dataType:'JSON',
				   contentType:'application/json',
				   data: JSON.stringify(params),
				   success: function(data) {},		
			});
		   setTimeout("loadPage("+indexPage+")",100);
     }
   //已取消
    async function changeOrderstatus2(oid2){

//////////////////////////取消提示框//////////////////
 		const { value: text } = await Swal.fire({
			  input: 'textarea',
			  title: '確定要取消訂單嗎?',
			  inputPlaceholder: '請輸入取消原因(必填)',
			  inputAttributes: {
			    'aria-label': 'Type your message here'
			  },
			  showCancelButton: false
			})

			if (text!="") {
			  
			
////////////////////////////////////////

    	 
    	    var params = {
    	    	    "orderstatus":"已取消",
    	    	    "remark2":text,
    	    }  
			$.ajax({
				   type:'post',
				   url:'/Store/updateorderstatus.controller?oid2='+oid2,
				   dataType:'JSON',
				   contentType:'application/json',
				   data: JSON.stringify(params),
				   success: function(data) {},		
			});
		   setTimeout("loadPage("+indexPage+")",100);
 	  }
     }

     
     //已完成
     function changeOrderstatus3(oid2){
 
    	    var params = {
    	    	    "orderstatus":"已完成",
    	    	    
    	    }  
			$.ajax({
				   type:'post',
				   url:'/Store/updateorderstatus.controller?oid2='+oid2,
				   dataType:'JSON',
				   contentType:'application/json',
				   data: JSON.stringify(params),
				   success: function(data) {

					   },		
			});
		   setTimeout("loadPage("+indexPage+")",100);
     }            
	 function loadorder(oid){
		   $.ajax({
			     type:'post',
			     //透過訂單id 查詢訂單詳細資訊
			     url:'/Store/QueryInformationByOrderID.controller?oid='+ oid,
			     dataType:'JSON',
			     contentType:'application/json',
			     success: function(data){
	
			         var json = JSON.stringify(data, null, 4);
			         console.log('success:' + json);
			         var jsonArray = JSON.parse(json);

	
			         if(data==null){
			         
			         }
			         
			         $.each(jsonArray, function(i,n){

			         var tdd = "餐點 : " + n.productName + "     數量 :  " + n.number + "    價格 :  " + n.productPrice + "  　　　　  餐點註記 :  "+ n.remark+"   </br>"
			         
			        	 $('#orderid'+oid).prepend(tdd);
		        	 
			         });

			     }
				   });

		 }
//	 load 訂單資訊的 function
     function loadorderRemark(oid){
		   $.ajax({
			     type:'post',
			     //透過訂單id 查詢訂單回饋資訊
			     url:'/Store/orderquerybyidremark.controller?oid=' + oid,
			     dataType:'JSON',
			     contentType:'application/json',
			     success: function(data){
	
			         var json = JSON.stringify(data, null, 4);
			         console.log('success:' + json);
			         var jsonArray = JSON.parse(json);

			         if(jsonArray.remark==null){
			        	 var tdd = " 尚未收到顧客的回饋 "+"</br>" 
			        	 $('#remark'+oid).prepend(tdd);
			         }else {
			        	var tdd = " 顧客的回饋 : " + jsonArray.remark +"</br>" 
			        	$('#remark'+oid).prepend(tdd);
				      }
			     }
		   });
		}
/////////////////////////////////////////////////////////////
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


///////////////////////////---------------------------------------
</script>

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
                        <h1 class="mt-4">全部訂單</h1>

 <!--  /////////////////////////////////////商家地圖 和 資訊                       //////////////////////////-->
 
 <!--  /////////////////////////////////////商家地圖 和 資訊                       //////////////////////////-->
                        
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                               訂單資訊
                            </div>
                        <div class="card-body" >
                        
                        <div>       
						<select id = "mySearch" name="mySearch">
						    <option value="全部">全部</option>
						    <option value="已付款">已付款</option>
						    <option value="未付款">未付款</option>
						    <option value="已完成">已完成</option>
						    <option value="準備中">準備中</option>
						    <option value="已取消">已取消</option>

						</select>
   
                        </div>
                        <div style="display: inline-block;">
               			 <a>每頁顯示筆數：</a>
                		<select id = "mySearch3" name="mySearch3">
						    <option value="5">5</option>
						    <option value="10">10</option>
						    <option value="20">20</option>
						    <option value="50">50</option>
						    <option value="100">100</option>

						</select>
						</div>
                        <div><p></p></div>

							<table  class="dataTable-table">
								<tbody  id="showorder">
								
								
								</tbody>
								<tbody id="showorder2">
								
								
								</tbody>
							</table>
							
							
			<!-- 	
							<table id="showpage">
								<tr>
									<td>全部頁數 : ${totalPages}  全部筆數:${totalElements} </td>
							      <td colspan="3" align="right">上一頁
							         <c:forEach var="i" begin="1" end="${totalPages}" step="1">
							             <button id="myPage" value="${i}" onclick="change(${i})">${i}</button>
							         </c:forEach>下一頁
							      </td>
								</tr>
					
							</table>
							 -->
			<!-- 換頁功能 -->
			
<nav aria-label='Page navigation example' id = 'changepage'>

<a id='totalcount'>
<span id='mySearch4' style = "float: left"></span>
</a>

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
							<div id ="creat"></div>
						
					

</div>
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