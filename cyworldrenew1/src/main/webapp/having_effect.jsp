<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>



    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="having_effect1.css" rel="stylesheet" type="text/css" />


</head>

<body>

<div style="display: none;"><%@ include file="dbconn.jsp"%></div>
<%
request.setCharacterEncoding("UTF-8");
String user_id = (String) session.getAttribute("sessionId");
PreparedStatement pstmt;
String cyworld_url = null;
String user_name = null;
int dotori=0;
int ilchon_count = 0;
String user_profile_photo = null;
String stock_background_file1 = "";
String stock_background_contents1="";
List<String> stock_background_file = new ArrayList<>();
List<String>stock_background_contents = new ArrayList<>();




try {
	String sql = "select * from user where user_id=?";
	String sql1 = "select * from profile where user_id=?";
	String sql2 = "select * from user_purchase where user_id=?";
	String sql3 ="SELECT COUNT(DISTINCT ilchon_id) FROM visit_board WHERE user_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, user_id);
	ResultSet rs = pstmt.executeQuery();
	while (rs.next()) {
		cyworld_url = rs.getString("cyworld_url");
		user_name = rs.getString("user_name");
		dotori =rs.getInt("dotori");	
	}
	pstmt = conn.prepareStatement(sql1);
	pstmt.setString(1, user_id); // user_id 값을 설정해야 합니다.
	ResultSet rs1 = pstmt.executeQuery();
	while (rs1.next()) {
		user_profile_photo = rs1.getString("user_profile_photo");
	}
pstmt = conn.prepareStatement(sql2);
pstmt.setString(1,user_id);
ResultSet rs2 = pstmt.executeQuery();
while(rs2.next()){
	stock_background_file1 =rs2.getString("stock_background_file");
	stock_background_contents1=rs2.getString("stock_background_contents");
	stock_background_file.add(stock_background_file1);
	stock_background_contents.add(stock_background_contents1);
}
	pstmt = conn.prepareStatement(sql3);
	pstmt.setString(1, user_id); // user_id 값을 설정해야 합니다.
	ResultSet rs3 = pstmt.executeQuery();
	while (rs3.next()) {
ilchon_count = rs3.getInt(1);
	}

	
	
	
	
} catch (SQLException e) {
	e.printStackTrace();
}
%>

<div id="imgboxbox">
		<div id="imgbox" class="imgbox">
			<img id="img1" class="imgslide" src="background/cyworld login.jpg">
			<img id="img2" class="imgslide" src="background/cyworld login1.jpg">
			<img id="img3" class="imgslide" src="background/cyworld login2.jpg">
		</div>
	</div>
		<div id="alldiv">

		<div id="subject_menudiv">
			<header id="header1">
				<div id="cyworld_logo"></div>
				<div id="cyworld_text">
					<b><span>우</span> <span>리</span> <span>들</span> <span>의</span>
						<span>&nbsp;</span> <span>c</span> <span>y</span> <span>W</span> <span>o</span>
						<span>r</span> <span>l</span> <span>d</span> </b>
				</div>
			</header>
			<div id="menudiv1">
				<nav id="menudiv_menu">
					<ul>
						<span><a href="background_purchase.jsp">배경화면</a></span>
					</ul>
					<ul>
						<span>Menu2</span>
					</ul>
					<ul>
						<span>Menu3</span>
					</ul>
					<ul>
						<span><a href="having_effect.jsp">보유효과</a></span>
					</ul>
				</nav>
				<div id="menulistdiv">
					<ul>
						<li>서브1
							<hr>
						</li>

						<li>서브2
							<hr>
						</li>

						<li>서브3
							<hr>
						</li>
						<li>서브4
							<hr>
						</li>
						<li>서브5
							<hr>
						</li>
					</ul>
					<ul>
						<li>서브1
							<hr>
						</li>

						<li>서브2
							<hr>
						</li>

						<li>서브3
							<hr>
						</li>
						<li>서브4
							<hr>
						</li>
						<li>서브5
							<hr>
						</li>
					</ul>
					<ul>
						<li>서브1
							<hr>
						</li>

						<li>서브2
							<hr>
						</li>

						<li>서브3
							<hr>
						</li>
						<li>서브4
							<hr>
						</li>
						<li>서브5
							<hr>
						</li>
					</ul>
					<ul>
						<li>서브1
							<hr>
						</li>

						<li>서브2
							<hr>
						</li>

						<li>서브3
							<hr>
						</li>
						<li>서브4
							<hr>
						</li>
						<li>서브5
							<hr>
						</li>
					</ul>




				</div>
			</div>
		</div>

		<div id="stock_div">
		<form action="effect_change.jsp"method="post">

			<%
			for (int i = 0; i < stock_background_file.size(); i++) {
			%><div id="stock_div_inner" style="display:inline-flex;"
				>
			
					<div id="stock_div_img">

						<img src="<%=stock_background_file.get(i)%>"
							>
					</div>
					<div id="stock_div_contents" >

						<div >
							설명 :

							<%=stock_background_contents.get(i)%>
						</div>
						<div id="radio button"><input type="radio" id="option<%=i %>"name="radioGroup" value="<%=stock_background_file.get(i) %>"></div>
						<div >
							
								<button type="button" onclick="checkRadioSelected()">적용하기</button>
						
						</div>
					</div>

		
			</div>
			<%
			}
			%>	</form>
		</div>
<script>
  function checkRadioSelected() {
    // 라디오 버튼 체크 여부 확인
    var radioButtons = document.getElementsByName("radioGroup");
    var isSelected = false;
    for (var i = 0; i < radioButtons.length; i++) {
      if (radioButtons[i].checked) {
        isSelected = true;
        break;
      }
    }

    // 라디오 버튼이 선택되었을 경우 폼 전송
    if (isSelected) {
    	 document.forms[0].submit();
    } else {
      alert("라디오 버튼을 선택하세요.");
      return false;
    }
  }
  window.onload = function() {
	    // 라디오 버튼 체크해제
	    var radioButtons = document.getElementsByName("radioGroup");
	    for (var i = 0; i < radioButtons.length; i++) {
	      radioButtons[i].checked = false;
	    }
	  };
</script>


			<div id="logininfodiv" >
			<div id="logininfo_img" >
			<%if(user_profile_photo==null){%><img alt="" src="userprofileimg/default123.jpg"><% }else
				{%><img alt="" src="userprofileimg/<%=user_profile_photo%>"><%}%>
			
			
			
			
			</div>
			<div id="logininfo_user" >
			<div>이름 :<%=user_name %> </div>
			<div>싸이월드주소 :<%= cyworld_url%> </div>
				<div><img src="background/acorn.png" style="width:10%;height:70%;background-repeat: no-repeat;background-position: center;background-size: cover;" >보유 도토리 :<%=dotori %> </div>
			<div>나랑일촌 :<%=ilchon_count %></div>
			<div style="display:flex;"><form action="index.jsp" method = 'post'><input type ='submit' value = "나의 미니홈피로 이동하기"></form>
			<div id="logout_button" style="margin-left:10px;" ><form action="logout.jsp">
  <button type="submit">로그아웃</button>
</form></div>
		

			
			</div>
			
		</div>	</div>
	</div>
	<script src="http://code.jquery.com/jquery-1.7.min.js"></script>
	<script>
		$(function() {
			setInterval(function() {
				$("#imgbox").animate({
					left : "-100%"
				}, 2500, function() {
					let img = $("#imgbox> img").eq(0).detach()
					$("#imgbox").css("left", "0px")
					$("#imgbox").append(img)
				})
			}, 7000)
		})
		document.getElementById("cyworld_logo").addEventListener("click",
				function() {
					window.location.href = "login.html";
				})

		function submitForm() {
			document.querySelector('form').submit();
		}
	</script>
</body>
</html>