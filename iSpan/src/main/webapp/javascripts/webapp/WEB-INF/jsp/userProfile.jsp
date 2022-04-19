<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>使用者登入</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="offset-sm-3 col-sm-6 my-5 p-5 border shadow">
				<h3 align="center">註冊</h3>
				<form:form action="createuserprofiles.controller" method="post" modelAttribute="userProfile">
					<div class="mb-3">
						<form:label path="username" class="form-label">帳號：</form:label>
						<form:input class="form-control" type="text" path="username" id="username"
									   placeholder="" />
					</div>
					<div class="mb-3">
						<form:label path="password" class="form-label">密碼：</form:label>
						<form:input class="form-control" type="password" path="password" id="password"
									   placeholder="" />
					</div>
					<div class="mb-3">
						<form:label path="name" class="form-label">姓名：</form:label>
						<form:input class="form-control" type="text" path="name" id="name"
									   placeholder="" />
					</div>
					<div class="mb-3">
						<form:label path="phone" class="form-label">電話：</form:label>
						<form:input class="form-control" type="text" path="phone" id="phone"
									   placeholder="" />
					</div>
					<div class="mb-3">
						<form:label path="emailaddress" class="form-label">信箱：</form:label>
						<form:input class="form-control" type="text" path="emailaddress" id="emailaddress"
									   placeholder="" />
					</div>
		
					<div align="center"><form:button class="btn btn-primary" value="Submit">送出</form:button></div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>