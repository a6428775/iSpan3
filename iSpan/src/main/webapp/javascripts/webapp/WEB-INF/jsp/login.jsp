<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<title>使用者登入</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="offset-sm-3 col-sm-6 my-5 p-5 border shadow">
				<h3 class="text-center">登入系統</h3>
				<form action="/login" method="post">
					<div class="mb-3">
					
						<label for="username" class="form-label">帳號：</label>
						<input class="form-control" type="text" name="username" id="username"
							   placeholder="請輸入使用者名稱" />
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">密碼：</label>
						<input class="form-control form-control-sm" type="password" name="password" id="password"
							   placeholder="請輸入密碼" />
					</div>
					<div class="mb-3 form-check">
						<input type="checkbox" class="form-check-input" id="exampleCheck1">
            			<label class="form-check-label" for="exampleCheck1">記住我</label>
					</div>

					<button type="submit" class="btn btn-primary">送出</button>
					<button type="reset" class="btn btn-info">清除</button>
					<div align="right">
						<a href="/userProfilemain.controller" class="btn btn-info" >註冊</a>
						<a href="/welcome" class="btn btn-info" >首頁</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

	<!-- <style>
		.main-box {
		margin: 50px auto;
		width: 320px;
		height: 200px;
		padding: 30px;
		box-shadow: 5px 5px 10px #999;
		border: 1px solid #fff;
		text-align: center;
		font-size: 30px;
		color: #000;
		}
		h3 {
			text-align:center;
			font-size: 30px;
		}
		.button1 {
			font-size: 25px;
			color: #4F4FFF;
		}
		a {
			text-decoration:none;
		}
		a:hover {
			color:#4F4FFF;
		}
</style> -->