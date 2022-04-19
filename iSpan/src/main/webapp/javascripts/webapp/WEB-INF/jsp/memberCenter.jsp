<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/reset.css">
    
    <style type="text/css">
      	.header .nav-item{
          padding:10px 10px;
        }
        .list-group {
          padding: 25px 0;
        }
        .picture {
          border-radius: 15%;
          padding: 10px 0;
        }
    </style>
    
    <link href="stylesheets/jquery-ui/base/jquery-ui.min.css" rel="stylesheet" />
    <style>
        .main-box {
            margin: 50px auto;
            width: 400px;
            height: 250px;
            padding: 50px;
            box-shadow: 5px 5px 10px #999;
            border: 1px solid #fff;
            text-align: center;
        }
    </style>
    <script src="javascripts/jquery-3.6.0.min.js"></script>
    <script src="javascripts/jquery-ui.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#tabs").tabs();
        });
        function init() {

        }
    </script>
    
    <title>完美食程</title>
  </head>
  <body>
      <!-- 導覽列選單 -->
      <div class="header">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
          <div class="container-fluid">
            <a class="navbar-brand" href="#">完美食程</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" 
              aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                <!-- <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li> -->
                <li  class="nav-item">
                  <a class="nav-link" href="/welcome">首頁</a>
                </li>
                <li  class="nav-item">
                  <a class="nav-link" href="/aboutus/aboutus.controller">關於我們</a>
                </li>
                <li  class="nav-item">
                  <a class="nav-link" href="/product/productquerymainaction.controller">商品資訊​</a>
                </li>
                <li  class="nav-item">
                  <a class="nav-link" href="#">最新消息</a>
                </li>
                <li  class="nav-item">
                  <a class="nav-link" href="#">服務資源</a>
                </li>
                <li  class="nav-item">
                  <a class="nav-link" href="/logout">登出</a>
                </li>
  
                <!-- <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Dropdown
                  </a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#">Action</a></li>
                    <li><a class="dropdown-item" href="#">Another action</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                  </ul>
                </li>
                <li class="nav-item">
                  <a class="nav-link disabled">Disabled</a>
                </li> -->
              </ul>

              <!-- <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
              </form> -->
            </div>
          </div>
        </nav>
      </div>
      
      <div class="container">
        <div class="row">
          <!-- 選單 -->
          <div class="row-cols-1 col-12 col-md-3">
            <div class="list-group">
              <a href="#" class="list-group-item list-group-item-action active" aria-current="true">個人首頁</a>
              <a href="#" class="list-group-item list-group-item-action">帳號管理</a>
              <a href="#" class="list-group-item list-group-item-action">歷史訂單</a>
              <!-- <a href="#" class="list-group-item list-group-item-action">A fourth link item</a> -->
              <!-- <a class="list-group-item list-group-item-action disabled">A disabled link item</a> -->
            </div>
          </div>
        </div>
      </div>
      
      <div id="tabs">
        <ul>
            <li><a class="class1" href="#p1">選擇性敘述</a></li>
            <li><a class="class1 class2" href="#p2">帳號管理</a></li>
            <li><a class="class1 class2" href="#p3">歷史訂單</a></li>
        </ul>
        <div id="p1">
            <div class="main-box">
                1
            </div>
        </div>
        <div id="p2">
            <div class="main-box">
                2
            </div>
        </div>
        <div id="p3">
            <div class="main-box">
                3
            </div>
        </div>
    </div>
      
	</body>
</html>