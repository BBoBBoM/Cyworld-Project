<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		let error = '<%= request.getParameter("error") %>';
		if (error !== 1 ) {
			alert("아이디 비밀번호 확인","아이디와 비밀번호를 확인해 주세요");
			window.location.href = "login.html";
		}
	</script>
</body>
</html>
