
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
String user_name = null;
String email = null;
String user_profile_photo = null;
String user_hello_word = null;
String gender = null;
int user_today_visit = 0;
int user_total_visit = 0;
String user_date="";

int countDiary = 0;
int countPhoto = 0;
int countMusic = 0;
int countBoard = 0;
int countVisitBoard = 0;

String[] tables = {"diary", "music", "photo", "board", "visit_board"};
String basesql = "select count(*) from "; // 기본 쿼리
Map<String, Integer> countMap = new HashMap<>();
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
		gender = rs.getString("gender");
	}
	pstmt = conn.prepareStatement(sql1);
	pstmt.setString(1, user_id); // user_id 값을 설정해야 합니다.
	ResultSet rs1 = pstmt.executeQuery();
	while (rs1.next()) {
		user_mini_subject = rs1.getString("user_mini_subject");
		user_miniroom_file = rs1.getString("user_miniroom_file");
		user_profile_photo = rs1.getString("user_profile_photo");
		user_hello_word = rs1.getString("user_hello_word");
	}
	pstmt = conn.prepareStatement(sql2);
	pstmt.setString(1, user_id); // user_id 값을 설정해야 합니다.
	ResultSet rs2 = pstmt.executeQuery();
	while (rs2.next()) {
		user_today_visit = rs2.getInt("user_today_visit");
		user_total_visit = rs2.getInt("user_total_visit");


	}

	for (String table : tables) {
		String sql3 = basesql + table + " where user_id = ?";

		pstmt = conn.prepareStatement(sql3);
		pstmt.setString(1, user_id);
		ResultSet rs3 = pstmt.executeQuery();

		if (rs3.next()) {
	int count = rs3.getInt(1);
	countMap.put(table, count);
		}
	}

	countDiary = countMap.getOrDefault("diary", 0);
	countPhoto = countMap.getOrDefault("photo", 0);
	countMusic = countMap.getOrDefault("music", 0);
	countBoard = countMap.getOrDefault("board", 0);
	countVisitBoard = countMap.getOrDefault("visit_board", 0);

} catch (SQLException e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<link href="index1.css" rel="stylesheet" type="text/css" />
<style>#mini_background1 {
	width: 100%;
	height: 100%;
	background: url(outer/bg3.gif) no-repeat center;
	background-size: cover;
	position: absolute;border:5px;solid;    background-size: 100% 100%;}
	
#mini_background2 {
	width: 95%;
	height: 95%;
	margin-top: 25px;
	<!--background: url(outer/bg1.gif) no-repeat center;-->
background-color : gray;
	background-size: cover;
	background-size: 100% 100%;
}</style>
</head>

<body>
  <script>
    // 이전 페이지 새로고침
    if (window.performance && window.performance.navigation.type === window.performance.navigation.TYPE_BACK_FORWARD) {
      location.reload();
    }
  </script>
<script src = "index.js"></script>
	<div id="mini_container">
		<div id="mini_background1">
			<div id="mini_background2">
				<div id="all_contentsdiv">
					<div id="left_contentsborderdiv">
						<div id="left_contents_visitrate">
							<label>Today <%=user_today_visit%> || Total <%=user_total_visit%></label>
						</div>

						<div id="left_contentsdiv">
							<div id="left_contentsdiv1">

								<div id="left_contents_userinfo">

									<%
									if (gender.equals("남") && user_profile_photo == null) {
									%>
									<div id="user_profileimg"
										style="background: url(userprofileimg/maledefault.jpg) no-repeat center; background-size: cover;">
										<form id="formtag" action="add_profileimg.jsp" method="post"
											enctype="multipart/form-data">
											<button id="photo_edit_button" type="button"
												onclick="selectFile()">Edit</button>
											<input type="submit" id="edit_input" value="edit"
												style="display: none;"> <input type="file"
												id="fileinput" name="fileinput" style="display: none;">
										</form>




									</div>
									<%
									} else if (gender.equals("여") && user_profile_photo.equals("") || user_profile_photo.equals(null)) {
									%>

									<div id="user_profileimg"
										style="background: url(userprofileimg/femaledefaultimg.jpg) no-repeat center; background-size: cover;">
										<form id="formtag" action="add_profileimg.jsp" method="post"
											enctype="multipart/form-data">
											<button id="photo_edit_button" type="button"
												onclick="selectFile()">Edit</button>
											<input type="submit" id="edit_input" value="edit"
												style="display: none;"> <input type="file"
												id="fileinput" name="fileinput" style="display: none;">
										</form>


									</div>
									<%
									} else {
									%>
									<div id="user_profileimg"
										style="background: url(userprofileimg/<%=user_profile_photo%>) no-repeat center; background-size: cover">
										<form id="formtag" action="add_profileimg.jsp" method="post"
											enctype="multipart/form-data">
											<button id="photo_edit_button" type="button"
												onclick="selectFile()">Edit</button>
											<input type="submit" id="edit_input" value="edit"
												style="display: none;"> <input type="file"
												id="fileinput" name="fileinput" style="display: none;">
										</form>


									</div>
									<%
									}
									%>
									<hr
										style="width: 95%; position: absolute; top: 32%; border: 1px solid black;">
									<div id="today_feeling">
										<span>오늘의 기분은?? <label id="feel_state"></label> <img
											id="feel_img" src=""></span><br>
										<button id="feel_edit_button" type="button"
											onclick="showRadioButton()" style="float: right;">Edit</button>
										<input type="radio" id="happy" class="radiofeel" name="radio2"
											onclick="feeling('행복해', 0)" style="display: none;"
											value="행복해"> <input type="radio" id="gloomy"
											class="radiofeel" name="radio2" onclick="feeling('우울해', 1)"
											style="display: none;" value="우울해"> <input
											type="radio" id="sad" class="radiofeel" name="radio2"
											onclick="feeling('슬퍼', 2)" style="display: none;" value="슬퍼">
									</div>

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
		});
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




									<div class="myself_introduce" id="myself_introduce"
										style="padding: 5%;">
										<%
										if (user_hello_word == null) {
										%>
										자기 소개를 입력해봅시다
										<%
										} else {
										%>
										<%=user_hello_word%>
										<%
										}
										%>



									</div>
									<button id="introduce_edit_button" type="button"
										onclick="showTextArea()">Edit</button>

									<div class="myself_introduce" id="textarea"
										style="display: none">
										<form action="add_introduce.jsp" method="post">
											<textarea name="introduceText"
												style="width: 100%; height: 88%"></textarea>
											<div class="edit_button">
												<button type="submit" onclick="saveText()">저장</button>
												<button onclick="cancelEdit()">취소</button>
											</div>
										</form>
									</div>

								
									<hr
										style="width: 95%; position: absolute; top: 71%; border: 1px solid black;">
									<div id="user_name_email">
										<b><%=user_name%></b> <br><%=email%></div>
									<div id="cousin_select">
										일촌파도타기 <br> <select id="ilchon" name="ilchon">
											<option value="">슈퍼맨</option>
											<option value="">1</option>
											<option value="">슈퍼맨</option>
											<option value="">1</option>
											<option value="">슈퍼맨</option>
											<option value="">1</option>


										</select>


									</div>

								</div>
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
									미니홈페이지 제목을 입력해주세요</div>
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
								<div id="center_innerdiv1">
									<div id="center_newupdate">
										<div>Update News</div>
										<br>


									</div>
									<div id="center_contents_atag">
										<table>
											<tr>
												<td><a href="diary.jsp">다이어리<span
														class="count_span"><%=countDiary%></span></a></td>
												<td><a href="jukebox.jsp">주크박스<span
														class="count_span"><%=countMusic%></span></a></td>
											</tr>
											<tr>
												<td><a href="photo.jsp">사진첩<span class="count_span"><%=countPhoto%></span></a></td>
												<td><a href="index.jsp">게시판<span class="count_span"><%=countBoard%></span></a></td>
											</tr>
											<tr>

												<td><a href="visit_board.jsp">방명록<span
														class="count_span"><%=countVisitBoard%></span></a></td>
											</tr>
										</table>
									</div>
								</div>

								<div id="center_miniroom" style="position: relative">

									<img alt=""
										src="userprofileimg/
									<%if (user_miniroom_file == null || user_miniroom_file.equals("")) {%>		miniroom1.png"
										<%} else {%> <%=user_miniroom_file%> <%} ;%>
										style="width: 100%; height: 100%; background-position: center; background-repeat: no-repeat; background-size: cover;">

									<div id="miniroom_img_edit">
										<form action="index.jsp">
											<button>Edit</button>
										</form>
									</div>

								</div>
								<div id="center_comment">DB에 평가란 만들어서 날짜 별로 가장 상위 3개만 뿌리는? 본인은 작성하지 못하고 타인이 본인의 홈피에 방문했을때 남기기 버튼 생기게?
								</div>
							</div>
						</div>
					</div>

					<div id="right_contentsdiv_border">
						<div id="right_contentsdiv">
							<div id="right_music"></div>
							<div id="right_menu">
								<div onclick="goToPage('index.jsp')">
									<input type="radio" id="home" class="radioG" name="radio1"
										style="display: none;"> <a href="index.jsp"
										target="_parent">홈</a>
								</div>
								<div onclick="goToPage('profile.jsp')">
									<input type="radio" id="profile" class="radioG" name="radio1"
										style="display: none;"> <a href="profile.jsp"
										target="_parent">프로필</a>
								</div>
								<div onclick="goToPage('diary.jsp')">
									<input type="radio" id="diary" class="radioG" name="radio1"
										style="display: none;"> <a href="diary.jsp"
										target="_parent">다이어리</a>
								</div>
								<div onclick="goToPage('jukebox.jsp')">
									<input type="radio" id="musicbox" class="radioG" name="radio1"
										style="display: none;"> <a href="jukebox.jsp"
										target="_parent">주크박스</a>
								</div>
								<div onclick="goToPage('photo.jsp')">
									<input type="radio" id="photo" class="radioG" name="radio1"
										style="display: none;"> <a target="_parent"
										href="photo.jsp">사진첩</a>
								</div>
								<div onclick="goToPage('index.jsp')">
									<input type="radio" id="board" class="radioG" name="radio1"
										style="display: none;"> <a target="_parent"
										href="index.jsp">게시판</a>
								</div>
								<div onclick="goToPage('visit_board.jsp')">
									<input type="radio" id="visitboard" class="radioG"
										name="radio1" style="display: none;"> <a
										target="_parent" href="visit_board.jsp">방명록</a>
								</div>
								<div onclick="goToPage('index.jsp')">
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