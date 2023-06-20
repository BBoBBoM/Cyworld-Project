
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

String user_name = null;
String email = null;
String user_profile_photo = null;
String user_hello_word = null;
String gender = null;
int user_today_visit = 0;
int user_total_visit = 0;
String user_background = "";
String music_subject1 = "";
String music_artist1 = "";
List<String> music_subject = new ArrayList<>();
List<String> music_artist = new ArrayList<>();

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
		user_background = rs.getString("user_background");
	}
	pstmt = conn.prepareStatement(sql1);
	pstmt.setString(1, user_id); // user_id 값을 설정해야 합니다.
	ResultSet rs1 = pstmt.executeQuery();
	while (rs1.next()) {
		user_mini_subject = rs1.getString("user_mini_subject");

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
	String sql3 = "select * from music where user_id=?";
	pstmt = conn.prepareStatement(sql3);
	pstmt.setString(1, user_id);
	ResultSet rs3 = pstmt.executeQuery();
	while (rs3.next()) {
		music_subject1 = rs3.getString("music_subject");
		music_artist1 = rs3.getString("music_artist");
		music_subject.add(music_subject1);
		music_artist.add(music_artist1);

	}

} catch (SQLException e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<link href="jukebox.css" rel="stylesheet" type="text/css" />
<link href = "backgroundEffect/sakura.css"rel="stylesheet" type="text/css" />

</head>

<body>
	<script>
    // 이전 페이지 새로고침
    if (window.performance && window.performance.navigation.type === window.performance.navigation.TYPE_BACK_FORWARD) {
      location.reload();
    }
  </script>
	<div id="mini_container">
		<div id="mini_background1" style="width: 100%;
	height: 100%;
	background: url(<%=user_background%>) no-repeat center;
	background-size: 100% 100%;
	position: absolute;">
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
										</script>


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
										</script>
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
										</script>
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
										function showRadioButton() {
											let feelings = [ '행복해', '우울해', '슬퍼' ];
											let radioButtons = document
													.querySelectorAll('.radiofeel');
											let feelState = document
													.getElementById('feel_state');
											feelState.textContent = ''; // feel_state의 내용을 초기화

											for (var i = 0; i < radioButtons.length; i++) {
												radioButtons[i].style.display = 'inline';
												radioButtons[i].nextSibling.textContent = feelings[i]; // 각 라디오 버튼의 텍스트 설정
											}

											document
													.getElementById('feel_edit_button').style.display = 'none';
										}

										function feeling(feeling, index) {
											var feelingText = document
													.createElement('span');
											feelingText.textContent = feeling;
											document.getElementById(
													'feel_state').appendChild(
													feelingText);

											var radioButtons = document
													.querySelectorAll('.radiofeel');
											for (var i = 0; i < radioButtons.length; i++) {
												radioButtons[i].style.display = 'none';
												radioButtons[i].nextSibling.textContent = ''; // 라디오 버튼의 텍스트 제거
											}

											document
													.getElementById('feel_edit_button').style.display = 'block';

											let feeling_img_url = [
													'background/smile.png',
													'background/gloomy.png',
													'background/sad.png' ];
											let feel_img = document
													.getElementById('feel_img');
											feel_img.src = feeling_img_url[index];
										}
									</script>




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

									<script>
										function showTextArea() {
											document
													.getElementById('myself_introduce').style.display = 'none';
											document.getElementById('textarea').style.display = 'block';
										}

										function saveText() {
											// 텍스트 저장 처리 및 다음 페이지로 이동
											// ...
											document.getElementById('textarea').style.display = 'none';
											document
													.getElementById('myself_introduce').style.display = 'block';
										}

										function cancelEdit() {
											document.getElementById('textarea').style.display = 'none';
											document
													.getElementById('myself_introduce').style.display = 'block';
										}
									</script>
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
					<div id="left_right_borderdiv"
						style="position: absolute; width: 1%; height: 78%; border-left: 1px solid black; top: 13%; left: 30.5%"></div>
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

							<script>
								function showTextArea1() {
									document
											.getElementById('user_mini_subject2').style.display = 'none';
									document.getElementById('subjectarea').style.display = 'block';
								}

								function saveText1() {
									// 텍스트 저장 처리 및 다음 페이지로 이동
									// ...
									document.getElementById('subjectarea').style.display = 'none';
									document
											.getElementById('user_mini_subject2').style.display = 'block';
								}

								function cancelEdit1() {
									document.getElementById('subjectarea').style.display = 'none';
									document
											.getElementById('user_mini_subject2').style.display = 'block';
								}
							</script>
						</div>


						<div id="center_contentsdiv1">

							<div id="center_contents">

								<div style="font-size: 25px;"><%=user_name%>님의 주크박스
								</div>
								<div style="height: 300px; font-size: 17px;">
									<br> 보유중인 노래 <br> <br>

									<div
										style="border: 1px solid black; padding: 10px; background: white; word-wrap: break-word; overflow-y: scroll;">
										<%
										for (int i = 0; i < music_subject.size(); i++) {
										%>

										<label class="music-item" style="text-decoration: underline;"><a
											href="#"
											onclick="playaudio('music/<%=music_subject.get(i)%>.mp3',<%=i%>)"><%=music_artist.get(i)%>-<%=music_subject.get(i)%></a>
											
											
											
											</label>
											<div id="image<%=i%>" style="width:5%;height:8%; float:left;display:none;"><img style="width:100%;height:100%;background-position: center;background-repeat: no-repeat;background-size: cover; " alt="" src="background/note.webp"></div>
											
											
											<br>
										<br>



										<%
										}
										%>

									</div>

								</div>


							</div>
						</div>
					</div>

					<div id="right_contentsdiv_border">
						<div id="right_contentsdiv">
							<div id="right_music">
								<audio id="audioPlayer" controls autoplay="autoplay"
									style="width: 100%">
									<source id="audioSource" src="" type="audio/mpeg">
								</audio>
								<button onclick="play()">play</button>
								<button onclick="pre_song()">pre</button>
								<button onclick="next_song()">next</button>
								<br>
								<p id="subjectname"></p>
							</div>
							<script>
							let src = [
								<%for (int i = 0; i < music_subject.size(); i++) {

	if (i == music_subject.size() - 1) {%>'<%=music_subject.get(i)%>.mp3'<%} else {%>
									'<%=music_subject.get(i)%>.mp3',
									
									<%}%>
								<%}%>
							];
		
let currentIndex = 0;
let audioPlayer = document.getElementById('audioPlayer');
let audioSource = document.getElementById('audioSource');
let subjectname = document.getElementById('subjectname');

function playaudio(name, index){
	audioPlayer.pause();
	audioSource.src = name;
	audioPlayer.load();
	audioPlayer.play();
	subjectname.innerHTML =name.replace('music/', '') + ' 재생중';
	
	
	  let images = document.querySelectorAll('[id^=image]');
	  //[^ id 속성 값이 "image"로 시작하는 모든 요소를 선택하는 역할 ^는 "시작하는"을 의미]
	  for (let i = 0; i < images.length; i++) {
	    images[i].style.display = 'none';
	  }
	document.getElementById('image' + index).style.display = 'block';
}

function play(){
    audioPlayer.pause();
    audioSource.src = "music/" + src[currentIndex];
    audioPlayer.load();
    audioPlayer.play();
    subjectname.innerHTML = src[currentIndex] + ' 재생중';

  
}


function pre_song(){
	if (currentIndex === 0) {
		currentIndex = src.length - 1;
	} else {
		currentIndex--;
	}
	audioSource.src = "music/"+src[currentIndex];
	audioPlayer.load();
	audioPlayer.play();
	subjectname.innerHTML =src[currentIndex] + '재생중'  
}

function next_song(){
	if (currentIndex === src.length - 1) {
		currentIndex = 0;
	} else {
		currentIndex++;
	}
	audioSource.src = "music/"+src[currentIndex];
	audioPlayer.load();
	audioPlayer.play();
	subjectname.innerHTML =src[currentIndex] + '재생중'  
}


</script>

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

								<script>
									function goToPage(url) {
										window.location.href = url;
									}
								</script>

							</div>
						</div>
					</div>
					<div id="dotori_div">
						<div id="current_dotori">보유도토리</div>
						<div id = "having_effect"><a href ="having_effect.jsp">배경화면 바꾸기</a></div>
						<div>
							<a href="index.jsp"></a> 도토리 장터
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>
$(window).load(function () {
    $('body').sakura();
});
</script>

<script src="backgroundEffect/sakura.js"></script>
</body>
</html>