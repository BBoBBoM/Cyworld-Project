<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
</head>
<body>
    <span id="errorMessage" style="display: none;"><%= request.getAttribute("errorMessage") %></span>
    
    <script type="text/javascript">
        let errorMessage = document.getElementById("errorMessage").textContent;
        if (errorMessage && errorMessage.trim() !== "") {
            alert(errorMessage);
        }
    </script>
</body>
</html>