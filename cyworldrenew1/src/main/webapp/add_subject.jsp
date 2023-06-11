<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>

<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>  
<%@ include file="dbconn.jsp" %>
<%  
	request.setCharacterEncoding("UTF-8");
String subjectText = request.getParameter("subjectText");
	String user_id = (String)session.getAttribute("sessionId");
	
	PreparedStatement pstmt = null;	
	
	String sql = "UPDATE profile SET user_mini_subject = ? WHERE user_id = ?";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(2, user_id);
	pstmt.setString(1, subjectText);
	int rs =pstmt.executeUpdate();

	if (pstmt != null)
		{pstmt.close();}
	if (rs ==1){
		%>
	<script type="text/javascript">

	
		alert("미니홈페이지 제목이 수정되었습니다");
history.go(-1);
		</script>
		<%}	
	

	%>
	



