<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>忘記密碼</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="offset-sm-3 col-sm-6 my-5 p-5 border shadow">
				<h3 class="text-center">查詢密碼</h3>
				<form action="/forgotPswd" method="post">
					<div class="mb-3">
						<label for="forgotPswd" class="form-label">會員信箱：</label>
						<input id="forgotPswd" class="form-control" type="text" name="forgotPswd" placeholder="" value="@gmail.com" />
					</div>
					
                      <button type="submit" class="btn btn-primary">下一步</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

