<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Jumbotron example · Bootstrap v5.1</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/jumbotron/">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap core CSS -->
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">

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

	
</style>
  </head>
  <body>
    
	<main>
		<div class="header">
			<a href="#" class="logo"><img alt="網站名稱" src="https://picsum.photos/100/40?random=1"></a>
			<nav>
				<a href="/welcome" >首頁</a>
				<a href="/users/membercenter.controller">會員中心</a>
				<a href="/product/productquerymainaction.controller">商品資訊​</a>
				<a href="#">活動資訊</a>
				<a href="#">服務資源</a>
				<a href="#">最新消息</a>
			</nav>
		</div>
	
	  <div class="container py-4">
	
	    <div class="p-5 mb-4 bg-light rounded-3">
	      <div class="container-fluid py-5">
	        <h1 class="display-5 fw-bold">關於我們</h1>
	        <p class="col-md-8 fs-4">關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們
	        關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們
	        關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們關於我們</p>
	        <button class="btn btn-primary btn-lg" type="button">觀看菜單</button>
	      </div>
	    </div>
	
	    <div class="row align-items-md-stretch">
	      <div class="col-md-6">
	        <div class="h-100 p-5 text-white bg-dark rounded-3">
	          <h2>Change the background</h2>
	          <p>Swap the background-color utility and add a `.text-*` color utility to mix up the jumbotron look. Then, mix and match with additional component themes and more.</p>
	          <button class="btn btn-outline-light" type="button">最新消息</button>
	        </div>
	      </div>
	      <div class="col-md-6">
	        <div class="h-100 p-5 bg-light border rounded-3">
	          <h2>Add borders</h2>
	          <p>Or, keep it light and add a border for some added definition to the boundaries of your content. Be sure to look under the hood at the source HTML here as we've adjusted the alignment and sizing of both column's content for equal-height.</p>
	          <button class="btn btn-outline-secondary" type="button">最新消息</button>
	        </div>
	      </div>
	    </div>
	
	    <footer class="pt-3 mt-4 text-muted border-top">
	      &copy; copyright 2022 by iii-Java-123-group1
	    </footer>
	  </div>
	</main>

  </body>
</html>