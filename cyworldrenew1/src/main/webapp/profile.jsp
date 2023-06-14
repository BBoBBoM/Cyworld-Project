
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ include file="dbconn.jsp"%>



<%
request.setCharacterEncoding("UTF-8");
String user_id = (String) session.getAttribute("sessionId");
PreparedStatement pstmt;
String cyworld_url = null;
String user_mini_subject = null;
String user_miniroom_file = null;
String user_profile_photo = null;
String user_name = "";
String email = "";
String user_hello_word = "";
String user_profile_photo1 = "";
int user_today_visit = 0;
int user_total_visit = 0;
String user_introduce_text="";
try {
	String sql = "select * from user where user_id=?";
	String sql1 = "select * from profile where user_id=?";
	String sql2 = "select * from user_visitrate where user_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, user_id);
	ResultSet rs = pstmt.executeQuery();
	while (rs.next()) {
		cyworld_url = rs.getString("cyworld_url");
		user_name = rs.getString("user_name");
		email = rs.getString("email");
	}
	pstmt = conn.prepareStatement(sql1);
	pstmt.setString(1, user_id); // user_id 값을 설정해야 합니다.
	ResultSet rs1 = pstmt.executeQuery();
	while (rs1.next()) {
		user_mini_subject = rs1.getString("user_mini_subject");
		user_miniroom_file = rs1.getString("user_miniroom_file");
		user_profile_photo = rs1.getString("user_profile_photo");
		user_profile_photo1 = rs1.getString("user_profile_photo1");
		user_hello_word = rs1.getString("user_hello_word");
		user_introduce_text = rs1.getString("user_introduce_text");
	}
	pstmt = conn.prepareStatement(sql2);
	pstmt.setString(1, user_id); // user_id 값을 설정해야 합니다.
	ResultSet rs2 = pstmt.executeQuery();
	while (rs2.next()) {
		user_today_visit = rs2.getInt("user_today_visit");
		user_total_visit = rs2.getInt("user_total_visit");


	}
} catch (SQLException e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="profile1.css" rel="stylesheet" type="text/css" />

</head>



<body>
  <script>
    // 이전 페이지 새로고침
    if (window.performance && window.performance.navigation.type === window.performance.navigation.TYPE_BACK_FORWARD) {
      location.reload();
    }
  </script>
<script src="profile.js"></script>
	<div id="mini_container">
		<div id="mini_background1">
			<div id="mini_background2">
				<div id="all_contentsdiv">
					<div id="left_contentsborderdiv">
						<div id="left_contents_visitrate">
							<label>Today <%=user_today_visit%> || Total <%=user_total_visit%></label>
						</div>
						<div id="profile_contents_div">
							<div id="profile_tag_subject">
								profile
							
							</div>
	<hr style="position:absolute;top:21%;left:7%;width:21%">
							<div id="profile_tag_div1">
								<a href=""> 자기소개</a>
							</div>
							<div id="profile_tag_div2">
								<a href="">기본정보</a>
							</div>
						</div>

					</div>
<div id="left_right_borderdiv" style="position:absolute;width:1%;height:78%;border-left:1px solid black;top:13%;left:30.5%"></div>
					<div id="center_contentsdiv">
											<div id="center_subject">
							<div id="user_mini_subject">
								<%
								if (user_mini_subject == null || user_mini_subject.equals("")) {
								%>
								<div id="user_mini_subject2" class="user_mini_subject2">
									미니홈피 제목</div>
								<%
								} else {
								%>
								<div id="user_mini_subject2" class="user_mini_subject2">
									<a><%=user_mini_subject%></a>
								</div>
								<%
								}
								%>

								<div class="user_mini_subject" id="subjectarea"
									class="user_mini_subject2"
									style="display: none; width: 60%; float: left;">
									<form action="add_subject.jsp" method="post">
										<textarea id="subjectText" name="subjectText"
											style="width: 73%;"></textarea>
										<div class="subject_edit_button" style="width: 25%;">
											<button type="submit" onclick="saveText1()">저장</button>
											<button onclick="cancelEdit1()">취소</button>
										</div>
									</form>
								</div>

								<div id="cyworld_url">
									<%=cyworld_url%><button class="subject_edit_button"
										type="button" onclick="showTextArea1()">Edit</button>
								</div>
							</div>

						</div>

						<div id="center_contentsdiv1">
							<div id="center_contents">
								<div id="center_profile_img">
									<%
									if (user_profile_photo1 == null || user_profile_photo1.equals("")) {
									%>
									<img id="profileimg1" src="userprofileimg/profile_default.jpg">
									<label>개인 사진이 없네요. 우리 등록해봐요.</label>
									<%
									} else {
									%>
									<img id="profileimg1"
										src="userprofileimg/<%=user_profile_photo1%>">
									<%
									}
									%>

									<form id="formtag" action="add_profileimg1.jsp" method="post"
										enctype="multipart/form-data">
										<button id="edit_button" type="button" onclick="selectFile()">Edit</button>
										<input type="submit" id="edit_input" value="edit"
											style="display: none;"> <input type="file"
											id="fileinput" name="fileinput" style="display: none;">
									</form>

								</div>
								<div id="center_profile_content">

<script>
// 파일 선택 창 열기 및 자동 전환
function selectFile() {
	document.getElementById(
		'fileinput').click();
}

// 파일이 선택되었을 때 자동으로 페이지 전환
document
	.getElementById('fileinput')
	.addEventListener(
		'change',
		function() {
			document
				.getElementById(
					'edit_input')
				.click();
		});</script>

<div id="profile_introduce_border1" style="position:relative;">
    <button onclick="showTextArea()">수정하기</button>
    <div id="fileContent" style="width:90%;height:80%;">
        <%=user_introduce_text %>
    </div>
</div>
<div id="profile_introduce_border2" style="display:none;">
    <form action="saveText.jsp" method="post">
        <button type="submit" onclick="saveText();">저장</button>
        <button type="reset" onclick="cancelEdit();">취소</button>
        <textarea id="filecontent_textarea" name="filecontent_textarea"style="width:90%;height:80%;"></textarea>
    </form>
</div>
<script>function saveText(){
	document.getElementById('profile_introduce_border1').style.display='block';
	document.getElementById('profile_introduce_border2').style.display='none';
}</script>
							</div></div>
						</div>
					</div>
				<div id="right_contentsdiv_border">
					<div id="right_contentsdiv">
						<div id="right_music"></div>
						<div id="right_menu">
							<div>
								<input type="radio" id="home" class="radioG" name="radio1"
									style="display: none;"> <a href="index.jsp"
									target="_parent">홈</a>
							</div>
							<div>
								<input type="radio" id="profile" class="radioG" name="radio1"
									style="display: none;"> <a href="profile.jsp"
									target="_parent">프로필</a>
							</div>
							<div>
								<input type="radio" id="diary" class="radioG" name="radio1"
									style="display: none;"> <a href="diary.jsp"
									target="_parent">다이어리</a>
							</div>
							<div>
								<input type="radio" id="musicbox" class="radioG" name="radio1"
									style="display: none;"> <a href="jukebox.jsp"
									target="_parent">주크박스</a>
							</div>
							<div>
								<input type="radio" id="photo" class="radioG" name="radio1"
									style="display: none;"> <a target="_parent"
									href="photo.jsp">사진첩</a>
							</div>
							<div>
								<input type="radio" id="board" class="radioG" name="radio1"
									style="display: none;"> <a target="_parent"
									href="index.html">게시판</a>
							</div>
							<div>
								<input type="radio" id="visitboard" class="radioG" name="radio1"
									style="display: none;"> <a target="_parent"
									href="visit_board.jsp">방명록</a>
							</div>
							<div>
								<input type="radio" id="settion" class="radioG" name="radio1"
									style="display: none;"> <a target="_parent"
									href="index.jsp">설정</a>
							</div>
						</div>
					</div>
				</div>
											<div id="dotori_div">
					<div id="current_dotori">보유도토리</div>
					<div><a href="index.jsp"></a> 도토리 장터</div></div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>