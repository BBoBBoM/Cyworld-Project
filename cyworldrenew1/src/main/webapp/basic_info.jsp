<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body><form action="add_basicinfo.jsp" method="post" enctype="multipart/form-data">
    <div id="imgdiv">
        <p>본인의 프로필 사진을 선택해주세요</p>
        <input type="file" name="user_profileimg" id="user_profileimg">
    </div>
    <br>
<div><p>본인의 미니홈피 제목을 입력하세요</p>
    <textarea name="usermini_subject" id="usermini_subject" cols="30" rows="1"></textarea></div>
    <div>
       <p>간단한 자기소개 작성하기</p>
        <textarea name="user_introduceself" id="user_introduceself" cols="30" rows="10"></textarea>
    </div>
    <div>
        <p>홈페이지 시작시 공개할 간단한 인사말을 작성해주세요</p>
         <textarea name="user_hello_word" id="user_hello_word" cols="30" rows="10"></textarea>
     </div>
    <input type="submit" value="저장하기">
    <button><a href="login.html">처음으로 돌아가기</a></button>

</form>

</body>
</html>