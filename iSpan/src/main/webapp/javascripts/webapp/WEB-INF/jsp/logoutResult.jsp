<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogoutResult</title>
</head>
<body>
	<form action="/logout" method="post">
		<table>
			<tr>
				<td>Logout:</td>
				<td><button type="submit" value="Logout">Logout</button></td>
			</tr>
		</table>
	<input type="hidden" id="${_csrf.parameterName}"
	name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
</body>
</html>