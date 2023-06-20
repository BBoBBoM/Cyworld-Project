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

	String user_id = (String)session.getAttribute("sessionId");
	String selectedValue = request.getParameter("radioGroup");
	 
	PreparedStatement pstmt = null;	
	
	String sql = "UPDATE user SET user_background = ? WHERE user_id = ?";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(2, user_id);
	pstmt.setString(1, selectedValue);
	int rs =pstmt.executeUpdate();

	if (pstmt != null)
		{pstmt.close();}
	if (rs ==1){
		%>
	<script type="text/javascript">

	
		alert("효과가 변경되었습니다.");
		window.location.href = "loginuser.jsp";
		</script>
		<%}	
	

	%>
	