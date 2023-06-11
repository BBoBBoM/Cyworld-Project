<%@page import="com.mysql.cj.protocol.x.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%@ include file="dbconn.jsp" %>

<%

request.setCharacterEncoding("utf-8");
String user_id = (String) session.getAttribute("sessionId");
  String text = request.getParameter("filecontent_textarea");
text =text.replace("\r\n","<br>");

PreparedStatement pstmt = null;
	String sql = "update profile set user_introduce_text=? where user_id = ?";
	
	try {
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, text);
	    pstmt.setString(2, user_id);
	    pstmt.executeUpdate();
	} catch (SQLException e) {
	    e.printStackTrace(); 
	}
%>
<script type="text/javascript">
alert("개인정보가 수정되었습니다.");
history.go(-1);
</script>
